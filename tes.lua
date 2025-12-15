local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "SAHAL - Fish Tracker Dashboard",
   LoadingTitle = "SAHAL FISH SYSTEM",
   LoadingSubtitle = "Vercel Webhook Integration v2.0",
   ConfigurationSaving = { 
      Enabled = true, 
      FolderName = "SAHAL_WEBHOOK", 
      FileName = "config_v2"
   },
   Discord = {
      Enabled = false,
      Invite = "noinvite",
      RememberJoins = true
   }
})

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local TeleportService = game:GetService("TeleportService")
local player = Players.LocalPlayer

-- Global Variables
local savedData = {
   webhookUrl = "",
   selectedRarities = {"Secret", "Legendary", "Mythic", "Epic"},
   sendAllRarities = false,
   showNotifications = true,
   debugMode = false,
   sessionId = HttpService:GenerateGUID(false):sub(1, 8),
   userData = {
      userId = tostring(player.UserId),
      username = player.Name,
      displayName = player.DisplayName
   }
}

-- Rarity Mapping
local rarityMap = {
   [1] = "common",
   [2] = "uncommon", 
   [3] = "rare",
   [4] = "epic", 
   [5] = "legendary", 
   [6] = "mythic", 
   [7] = "secret"
}

-- Fish Data Storage
local FishDataById = {}
local VariantsByName = {}
local FishPrices = {}

-- Load Configuration
local function saveConfig()
   if writefile then 
      local success, err = pcall(function()
         writefile("sahal_config_v2.json", HttpService:JSONEncode(savedData))
      end)
      if not success and savedData.debugMode then
         print("Save Config Error:", err)
      end
   end
end

local function loadConfig()
   if isfile and isfile("sahal_config_v2.json") then
      local success, data = pcall(function()
         return HttpService:JSONDecode(readfile("sahal_config_v2.json"))
      end)
      if success and type(data) == "table" then
         -- Merge loaded data with defaults
         for k, v in pairs(data) do
            savedData[k] = v
         end
         -- Ensure user data is current
         savedData.userData.userId = tostring(player.UserId)
         savedData.userData.username = player.Name
         savedData.userData.displayName = player.DisplayName
      end
   end
end

-- Load Fish Data
local function loadFishData()
   pcall(function()
      -- Load Fish Items
      for _, item in ipairs(ReplicatedStorage.Items:GetChildren()) do
         local success, data = pcall(require, item)
         if success and data.Data and data.Data.Type == "Fishes" then
            FishDataById[data.Data.Id] = {
               name = data.Data.Name,
               sellPrice = data.SellPrice or 0,
               tier = data.Data.Tier,
               icon = data.IconId or data.Data.Icon,
               rarity = rarityMap[data.Data.Tier] or "common"
            }
            FishPrices[data.Data.Name] = data.SellPrice or 0
         end
      end
      
      -- Load Variants
      for _, variant in ipairs(ReplicatedStorage.Variants:GetChildren()) do
         local success, data = pcall(require, variant)
         if success and data.Data and data.Data.Type == "Variant" then
            VariantsByName[data.Data.Name] = {
               multiplier = data.SellMultiplier or 1,
               name = data.Data.Name
            }
         end
      end
   end)
   
   if savedData.debugMode then
      print("Loaded", #FishDataById, "fish items")
      print("Loaded", #VariantsByName, "variants")
   end
end

-- Call load functions
loadConfig()
loadFishData()

--------------------------------------------------------------------------------
-- UI CREATION
--------------------------------------------------------------------------------
local MainTab = Window:CreateTab("Dashboard", 7734032451)
local WebhookTab = Window:CreateTab("Webhook Settings", 7734056488)
local LogsTab = Window:CreateTab("Logs & Stats", 7733929598)

-- Main Dashboard Tab
local StatsLabel = MainTab:CreateLabel("System Status: Ready")
local ConnectionLabel = MainTab:CreateLabel("Webhook: " .. (savedData.webhookUrl ~= "" and "✅ Configured" or "❌ Not Set"))

-- Stats Display Section
local statsSection = MainTab:CreateSection("Session Statistics")
local sessionStats = {
   catches = 0,
   value = 0,
   lastCatch = "None"
}

local CatchesLabel = MainTab:CreateLabel("Catches this session: 0")
local ValueLabel = MainTab:CreateLabel("Total Value: $0")
local LastCatchLabel = MainTab:CreateLabel("Last Catch: None")

-- Webhook Settings Tab
local webhookSection = WebhookTab:CreateSection("API Configuration")

WebhookTab:CreateInput({
   Name = "Vercel Webhook URL",
   PlaceholderText = "https://your-project.vercel.app/api/webhook",
   CurrentValue = savedData.webhookUrl,
   RemoveTextAfterFocusLost = false,
   Callback = function(value)
      savedData.webhookUrl = value
      ConnectionLabel:Set("Webhook: " .. (value ~= "" and "✅ Configured" or "❌ Not Set"))
      saveConfig()
   end
})

local RarityDropdown = WebhookTab:CreateDropdown({
   Name = "Send for Rarities",
   Options = {"secret", "legendary", "mythic", "epic", "rare", "uncommon", "common"},
   CurrentOption = savedData.selectedRarities,
   MultipleOptions = true,
   Callback = function(selected)
      savedData.selectedRarities = selected
      saveConfig()
   end
})

WebhookTab:CreateToggle({
   Name = "Send All Rarities",
   CurrentValue = savedData.sendAllRarities,
   Callback = function(value)
      savedData.sendAllRarities = value
      if value then
         RarityDropdown:Set({"secret", "legendary", "mythic", "epic", "rare", "uncommon", "common"})
      end
      saveConfig()
   end
})

WebhookTab:CreateToggle({
   Name = "Show Notifications",
   CurrentValue = savedData.showNotifications,
   Callback = function(value)
      savedData.showNotifications = value
      saveConfig()
   end
})

WebhookTab:CreateToggle({
   Name = "Debug Mode",
   CurrentValue = savedData.debugMode,
   Callback = function(value)
      savedData.debugMode = value
      saveConfig()
   end
})

local testingSection = WebhookTab:CreateSection("Testing")

WebhookTab:CreateButton({
   Name = "Test Connection",
   Callback = function()
      sendTestData()
   end
})

WebhookTab:CreateButton({
   Name = "Reset Session",
   Callback = function()
      sessionStats.catches = 0
      sessionStats.value = 0
      sessionStats.lastCatch = "None"
      updateStatsDisplay()
   end
})

-- Logs Tab
local logsSection = LogsTab:CreateSection("Session Logs")
local LogsText = LogsTab:CreateLabel("No catches yet...")
local sessionLogs = {}

LogsTab:CreateButton({
   Name = "Clear Logs",
   Callback = function()
      sessionLogs = {}
      LogsText:Set("Logs cleared.")
   end
})

LogsTab:CreateButton({
   Name = "Copy Session ID",
   Callback = function()
      setclipboard(savedData.sessionId)
      if savedData.showNotifications then
         Rayfield:Notify({
            Title = "Copied",
            Content = "Session ID copied to clipboard",
            Duration = 3,
            Image = 7733963436
         })
      end
   end
})

--------------------------------------------------------------------------------
-- WEBHOOK FUNCTIONS
--------------------------------------------------------------------------------
local function sendWebhook(data)
   if not savedData.webhookUrl or savedData.webhookUrl == "" then
      if savedData.debugMode then
         print("Webhook URL not configured")
      end
      return false
   end
   
   local requestFunc = syn and syn.request or http and http.request or http_request or request or fluxus and fluxus.request
   if not requestFunc then
      if savedData.debugMode then
         print("No HTTP request function available")
      end
      return false
   end
   
   local success, response = pcall(function()
      return requestFunc({
         Url = savedData.webhookUrl,
         Method = "POST",
         Headers = {
            ["Content-Type"] = "application/json",
            ["User-Agent"] = "SAHAL-Fish-Tracker/2.0"
         },
         Body = HttpService:JSONEncode(data)
      })
   end)
   
   if success and response then
      if savedData.debugMode then
         print("Webhook Response:", response.StatusCode)
      end
      return response.StatusCode == 200
   else
      if savedData.debugMode then
         print("Webhook Error:", response)
      end
      return false
   end
end

local function processFish(fishId, variantId, isTest)
   -- Get fish data
   local fishData = FishDataById[fishId]
   if not fishData and not isTest then
      if savedData.debugMode then
         print("Fish data not found for ID:", fishId)
      end
      return
   end
   
   -- Get variant multiplier
   local variantMultiplier = 1
   local variantName = "Normal"
   if variantId and VariantsByName[variantId] then
      variantMultiplier = VariantsByName[variantId].multiplier
      variantName = VariantsByName[variantId].name
   end
   
   -- Prepare data for real or test
   local rarity, fishName, price
   
   if isTest then
      rarity = "legendary"
      fishName = "Golden Tuna"
      price = 1500
   else
      rarity = fishData.rarity or "common"
      fishName = fishData.name or "Unknown Fish"
      price = math.floor((fishData.sellPrice or 0) * variantMultiplier)
   end
   
   -- Rarity filter check
   if not isTest then
      local shouldSend = savedData.sendAllRarities
      if not shouldSend then
         for _, r in pairs(savedData.selectedRarities) do
            if string.lower(r) == rarity then
               shouldSend = true
               break
            end
         end
      end
      
      if not shouldSend then
         if savedData.debugMode then
            print("Rarity filtered out:", rarity)
         end
         return
      end
   end
   
   -- Get player stats
   local caughtStat = 0
   local leaderstats = player:FindFirstChild("leaderstats")
   if leaderstats then
      local caught = leaderstats:FindFirstChild("Caught") or leaderstats:FindFirstChild("TotalCaught")
      caughtStat = caught and caught.Value or 0
   end
   
   -- Prepare payload for final API
   local payload = {
      account = {
         user_id = savedData.userData.userId,
         username = savedData.userData.username,
         display_name = savedData.userData.displayName
      },
      fish = {
         name = fishName,
         price = price,
         rarity = rarity,
         variant = variantName
      },
      session_id = savedData.sessionId,
      server = {
         job_id = game.JobId,
         place_id = game.PlaceId,
         place_name = "Fishing Simulator"
      },
      timestamp = os.time(),
      source = "roblox_sahal_tracker"
   }
   
   -- Send webhook
   local success = sendWebhook(payload)
   
   -- Update session stats
   if success and not isTest then
      sessionStats.catches = sessionStats.catches + 1
      sessionStats.value = sessionStats.value + price
      sessionStats.lastCatch = fishName
      
      -- Add to logs
      table.insert(sessionLogs, 1, {
         time = os.date("%H:%M:%S"),
         fish = fishName,
         rarity = rarity,
         price = price
      })
      
      -- Keep only last 10 logs
      if #sessionLogs > 10 then
         table.remove(sessionLogs, 11)
      end
      
      updateStatsDisplay()
      updateLogsDisplay()
      
      -- Show notification
      if savedData.showNotifications then
         Rayfield:Notify({
            Title = "🎣 Fish Caught!",
            Content = string.format("%s ($%d)", fishName, price),
            Duration = 3,
            Image = 7733963436
         })
      end
      
      if savedData.debugMode then
         print("Sent webhook for:", fishName, "Price:", price, "Rarity:", rarity)
      end
   end
   
   return success
end

local function sendTestData()
   if savedData.webhookUrl == "" then
      Rayfield:Notify({
         Title = "Error",
         Content = "Please set webhook URL first",
         Duration = 3,
         Image = 7733965728
      })
      return
   end
   
   -- Send test fish
   local success = processFish(nil, nil, true)
   
   if success then
      Rayfield:Notify({
         Title = "Test Successful",
         Content = "Test data sent to webhook",
         Duration = 3,
         Image = 7733958570
      })
   else
      Rayfield:Notify({
         Title = "Test Failed",
         Content = "Could not send test data",
         Duration = 3,
         Image = 7733965728
      })
   end
end

local function updateStatsDisplay()
   CatchesLabel:Set(string.format("Catches this session: %d", sessionStats.catches))
   ValueLabel:Set(string.format("Total Value: $%d", sessionStats.value))
   LastCatchLabel:Set(string.format("Last Catch: %s", sessionStats.lastCatch))
end

local function updateLogsDisplay()
   if #sessionLogs == 0 then
      LogsText:Set("No catches yet...")
      return
   end
   
   local logText = ""
   for i, log in ipairs(sessionLogs) do
      logText = logText .. string.format("[%s] %s (%s) - $%d\n", 
         log.time, log.fish, log.rarity, log.price)
   end
   
   LogsText:Set(logText)
end

--------------------------------------------------------------------------------
-- GAME HOOKS
--------------------------------------------------------------------------------
local function setupGameHooks()
   -- Find the network event for catching fish
   local function findFishingEvent()
      -- Try different locations
      local locations = {
         ReplicatedStorage,
         ReplicatedStorage:FindFirstChild("Packages"),
         ReplicatedStorage:FindFirstChild("Events"),
         ReplicatedStorage:FindFirstChild("Remotes"),
         ReplicatedStorage:FindFirstChild("Network"),
         game:GetService("Workspace")
      }
      
      for _, location in ipairs(locations) do
         if location then
            -- Look for fish-related events
            local events = location:GetDescendants()
            for _, event in ipairs(events) do
               if event:IsA("RemoteEvent") or event:IsA("BindableEvent") then
                  local name = event.Name:lower()
                  if name:find("fish") or name:find("catch") or name:find("obtain") then
                     return event
                  end
               end
            end
         end
      end
      
      return nil
   end
   
   -- Try to hook into existing event
   local fishingEvent = findFishingEvent()
   
   if fishingEvent and fishingEvent:IsA("RemoteEvent") then
      -- Hook into client event
      local oldFireServer = fishingEvent.FireServer
      fishingEvent.FireServer = function(self, ...)
         local args = {...}
         
         -- Try to extract fish data from args
         if args[1] then
            local fishId, variantId
            
            -- Check different argument patterns
            if type(args[1]) == "number" then
               fishId = args[1]
               variantId = args[2]
            elseif type(args[1]) == "table" then
               fishId = args[1].Id or args[1].ItemId
               variantId = args[1].Variant or args[1].VariantId
            end
            
            if fishId then
               -- Delay slightly to let game process first
               task.wait(0.5)
               processFish(fishId, variantId, false)
            end
         end
         
         return oldFireServer(self, ...)
      end
      
      if savedData.debugMode then
         print("Hooked into fishing event:", fishingEvent.Name)
      end
   else
      -- Fallback: Check leaderstats periodically
      if savedData.debugMode then
         print("Could not find fishing event, using fallback method")
      end
      
      local lastCaught = 0
      spawn(function()
         while true do
            task.wait(5) -- Check every 5 seconds
            local leaderstats = player:FindFirstChild("leaderstats")
            if leaderstats then
               local caught = leaderstats:FindFirstChild("Caught") or leaderstats:FindFirstChild("TotalCaught")
               if caught and caught.Value > lastCaught then
                  -- Player caught a fish since last check
                  lastCaught = caught.Value
                  if savedData.debugMode then
                     print("Fish detected via leaderstats")
                  end
                  -- Note: We can't get specific fish data this way
               end
            end
         end
      end)
   end
   
   -- Alternative method: Monitor chat for catch messages
   local function setupChatMonitor()
      local ChatEvents = game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents")
      if ChatEvents then
         local OnMessageDoneFiltering = ChatEvents:FindFirstChild("OnMessageDoneFiltering")
         if OnMessageDoneFiltering then
            OnMessageDoneFiltering.OnClientEvent:Connect(function(messageData)
               local message = messageData.Message:lower()
               local sender = Players:FindFirstChild(messageData.FromSpeaker)
               
               if sender == player and (message:find("caught") or message:find("fish") or message:find("reeled")) then
                  if savedData.debugMode then
                     print("Chat message detected:", message)
                  end
                  -- Could parse fish name from chat message here
               end
            end)
         end
      end
   end
   
   pcall(setupChatMonitor)
end

-- Start hooks when game is loaded
task.spawn(function()
   task.wait(3) -- Wait for game to fully load
   setupGameHooks()
   StatsLabel:Set("System Status: Monitoring Active")
end)

-- Initialize displays
updateStatsDisplay()
updateLogsDisplay()

-- Update session ID display
LogsTab:CreateLabel("Session ID: " .. savedData.sessionId)

-- Auto-save before leaving
game:BindToClose(function()
   if savedData.debugMode then
      print("Saving configuration before exit...")
   end
   saveConfig()
end)

Rayfield:Notify({
   Title = "SAHAL Tracker Loaded",
   Content = string.format("Connected as %s\nSession ID: %s", player.Name, savedData.sessionId),
   Duration = 5,
   Image = 7733963436
})

if savedData.debugMode then
   print("SAHAL Fish Tracker v2.0 Initialized")
   print("User ID:", savedData.userData.userId)
   print("Webhook URL:", savedData.webhookUrl)
   print("Session ID:", savedData.sessionId)
end
