local Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()

local Window = Rayfield:CreateWindow({
   Name = "SAHAL ARB - Multi Account Manager",
   LoadingTitle = "SAHAL ARB SYSTEM",
   LoadingSubtitle = "Vercel Webhook Edition",
   ConfigurationSaving = { Enabled = true, FolderName = "SAHAL_ARB", FileName = "Config" }
})

local MainTab = Window:CreateTab("Dashboard", 4483362458)
local WebhookTab = Window:CreateTab("Webhook Settings", 4483362458)

-- Services
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer

-- Variables
local savedData = { webhookUrl = "", selectedRarities = {"Secret", "Legendary", "Mythic"} }
local rarityMap = {
    [1] = "Common", [2] = "Uncommon", [3] = "Rare",
    [4] = "Epic", [5] = "Legendary", [6] = "Mythic", [7] = "Secret"
}
-- Load Fish Data (Simplified for brevity, logic remains same as before)
local FishDataById, VariantsByName = {}, {}
pcall(function()
    for _, item in ipairs(ReplicatedStorage.Items:GetChildren()) do
        local ok, data = pcall(require, item)
        if ok and data.Data and data.Data.Type == "Fishes" then
            FishDataById[data.Data.Id] = { Name = data.Data.Name, SellPrice = data.SellPrice or 0, Tier = data.Data.Tier, Icon = data.IconId or data.Data.Icon }
        end
    end
    for _, v in ipairs(ReplicatedStorage.Variants:GetChildren()) do
        local ok, data = pcall(require, v)
        if ok and data.Data and data.Data.Type == "Variant" then VariantsByName[data.Data.Name] = data.SellMultiplier or 1 end
    end
end)

--------------------------------------------------------------------------------
-- WEBHOOK LOGIC
--------------------------------------------------------------------------------
local function saveConfig()
    if writefile then writefile("ruinz_vercel.json", HttpService:JSONEncode(savedData)) end
end

local function loadConfig()
    if isfile and isfile("ruinz_vercel.json") then
        local s, d = pcall(function() return HttpService:JSONDecode(readfile("ruinz_vercel.json")) end)
        if s and type(d) == "table" then savedData = d end
    end
end
loadConfig()

WebhookTab:CreateInput({
    Name = "Vercel API URL",
    PlaceholderText = "https://your-project.vercel.app/api/webhook",
    CurrentValue = savedData.webhookUrl,
    RemoveTextAfterFocusLost = false,
    Callback = function(text)
        savedData.webhookUrl = text
        saveConfig()
    end
})

WebhookTab:CreateDropdown({
    Name = "Filter Rarity (Yang dikirim)",
    Options = {"Secret", "Legendary", "Mythic", "Epic", "Rare", "Uncommon", "Common"},
    CurrentOption = savedData.selectedRarities,
    MultipleOptions = true,
    Callback = function(selected)
        savedData.selectedRarities = selected
        saveConfig()
    end
})

local function sendPayload(data)
    if not savedData.webhookUrl or savedData.webhookUrl == "" then return end
    
    local requestFunc = syn and syn.request or http and http.request or http_request or request or fluxus and fluxus.request
    if requestFunc then
        requestFunc({
            Url = savedData.webhookUrl,
            Method = "POST",
            Headers = { ["Content-Type"] = "application/json" },
            Body = HttpService:JSONEncode(data)
        })
    end
end

local function GetRobloxImage(assetId)
    if not assetId then return "" end
    -- Fallback logic for image
    return "https://thumbnails.roblox.com/v1/assets?assetIds=" .. assetId .. "&size=420x420&format=Png&isCircular=false"
end

-- Fungsi Kirim Utama
local function processFish(fishName, rarityText, assetId, itemId, variantId, isTest)
    -- Filter Check
    local isAllowed = false
    if isTest then 
        isAllowed = true 
    else
        for _, r in pairs(savedData.selectedRarities) do
            if r == rarityText then isAllowed = true; break end
        end
    end

    if not isAllowed then return end

    local basePrice = (FishDataById[itemId] and FishDataById[itemId].SellPrice or 0) * (VariantsByName[variantId] or 1)
    local caught = player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Caught")
    
    -- Request Image URL (Async workaround)
    local imgApi = GetRobloxImage(assetId)
    local finalImg = ""
    pcall(function()
        local res = game:HttpGet(imgApi)
        local d = HttpService:JSONDecode(res)
        if d and d.data and d.data[1] then finalImg = d.data[1].imageUrl end
    end)

    local payload = {
        type = isTest and "test" or "catch",
        account = {
            username = player.Name,
            display_name = player.DisplayName,
            user_id = player.UserId,
            hwid = game:GetService("RbxAnalyticsService"):GetClientId() -- Optional: Untuk tracking unik device
        },
        server = {
            job_id = game.JobId,
            place_id = game.PlaceId
        },
        fish = {
            name = fishName,
            rarity = rarityText,
            price = basePrice,
            image = finalImg,
            variant = variantId or "Normal"
        },
        stats = {
            total_caught = caught and caught.Value or 0
        },
        timestamp = os.time()
    }
    
    sendPayload(payload)
    if isTest then Rayfield:Notify({Title="Sent", Content="Test data dikirim!", Duration=3}) end
end

-- Test Button
WebhookTab:CreateButton({
    Name = "Test Webhook Connection",
    Callback = function()
        processFish("Test Fish", "Secret", "12345", 0, nil, true)
    end
})

-- Listener
local function getNet()
    local p = ReplicatedStorage:WaitForChild("Packages"):FindFirstChild("_Index")
    if p then
        for _,c in pairs(p:GetChildren()) do if c.Name:match("net@") then return c:FindFirstChild("net") end end
    end
    return ReplicatedStorage:FindFirstChild("net")
end

local net = getNet()
if net then
    local notif = net:FindFirstChild("RE/ObtainedNewFishNotification")
    if notif then
        notif.OnClientEvent:Connect(function(itemId, _, eventData)
            pcall(function()
                local fData = FishDataById[itemId]
                if not fData then return end
                local rarity = rarityMap[fData.Tier] or "Common"
                local assetId = string.match(fData.Icon or "", "%d+")
                local variant = eventData and eventData.InventoryItem and eventData.InventoryItem.Metadata and eventData.InventoryItem.Metadata.VariantId
                
                processFish(fData.Name, rarity, assetId, itemId, variant, false)
            end)
        end)
    end
end

Rayfield:Notify({Title="Ready", Content="Multi-Account Script Loaded", Duration=3})
