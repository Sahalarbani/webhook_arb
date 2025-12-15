-- filename: 
-- version: lua51
-- line: [0, 0] id: 0
if game.PlaceId ~= 121864768012064 then
  game:GetService("Players").LocalPlayer:Kick("MengHub only works on Fish It brahhhhh!")
  return 
end
local r1_0 = game:GetService("Players")
local r2_0 = game:GetService("RunService")
local r3_0 = game:GetService("ReplicatedStorage")
local r4_0 = game:GetService("HttpService")
local r5_0 = game:GetService("VirtualUser")
local r6_0 = r1_0.LocalPlayer
local r7_0 = r3_0:WaitForChild("Controllers")
local r8_0 = workspace.CurrentCamera
local r9_0 = game:GetService("Players").LocalPlayer.PlayerGui
local r10_0 = game:GetService("VirtualInputManager")
local r11_0 = game:GetService("TeleportService")
local r12_0 = game:GetService("UserInputService")
local r13_0 = game:GetService("TweenService")
local r14_0 = {
  MerchantRoot = r9_0.Merchant.Main.Background,
  ItemsFrame = r9_0.Merchant.Main.Background.Items.ScrollingFrame,
  RefreshMerchant = r9_0.Merchant.Main.Background.RefreshLabel,
}
local r16_0 = (function()
  -- line: [0, 0] id: 69
  local r0_69 = r3_0.Packages._Index["sleitnick_net@0.2.0"].net
  return {
    RE_FishCaught = r0_69:WaitForChild("RE/FishCaught"),
    RE_Fishing = r0_69:WaitForChild("RE/FishingCompleted"),
    RF_Charge = r0_69:WaitForChild("RF/ChargeFishingRod"),
    RF_Minigame = r0_69:WaitForChild("RF/RequestFishingMinigameStarted"),
    RF_Cancel = r0_69:WaitForChild("RF/CancelFishingInputs"),
    RF_Sell = r0_69:WaitForChild("RF/SellAllItems"),
    RF_Weather = r0_69:WaitForChild("RF/PurchaseWeatherEvent"),
    RF_Radar = r0_69:WaitForChild("RF/UpdateFishingRadar"),
    RF_EquipDiving = r0_69:WaitForChild("RF/EquipOxygenTank"),
    RF_UnequipDiving = r0_69:WaitForChild("RF/UnequipOxygenTank"),
    RF_PurchaseRod = r0_69:WaitForChild("RF/PurchaseFishingRod"),
    RF_PurchaseBait = r0_69:WaitForChild("RF/PurchaseBait"),
    RF_PurchaseBoat = r0_69:WaitForChild("RF/PurchaseBoat"),
    RE_Cutscene = r0_69:WaitForChild("RE/ReplicateCutscene"),
    RE_StopCutscene = r0_69:WaitForChild("RE/StopCutscene"),
    RF_AutoFishing = r0_69:WaitForChild("RF/UpdateAutoFishingState"),
    RE_EquipItem = r0_69:WaitForChild("RE/EquipItem"),
    RE_Altar = r0_69:WaitForChild("RE/ActivateEnchantingAltar"),
    RE_Altar2 = r0_69:WaitForChild("RE/ActivateSecondEnchantingAltar"),
    RE_Equip = r0_69:WaitForChild("RE/EquipToolFromHotbar"),
    RE_Unequip = r0_69:WaitForChild("RE/UnequipToolFromHotbar"),
    RE_Favorite = r0_69:WaitForChild("RE/FavoriteItem"),
    RE_FavoriteChanged = r0_69:WaitForChild("RE/FavoriteStateChanged"),
    RE_ReplicateTextEffect = r0_69:WaitForChild("RE/ReplicateTextEffect"),
    RE_ObtainedNewFishNotification = r0_69:WaitForChild("RE/ObtainedNewFishNotification"),
    RE_FishingMinigameEvent = r0_69:WaitForChild("RE/FishingMinigameChanged"),
    RF_Trade = r0_69:WaitForChild("RF/InitiateTrade"),
  }
end)()
local r17_0 = require(r3_0.Packages.Replion)
local r18_0 = require(r3_0.Controllers.FishingController)
local r19_0 = require(r3_0.Controllers.ItemTradingController)
local r20_0 = require(r3_0.Shared.ItemUtility)
local r21_0 = require(r3_0.Shared.VendorUtility)
local r22_0 = require(r3_0.Shared.PlayerStatsUtility)
local r23_0 = r17_0.Client:WaitReplion("Data")
local r24_0 = r3_0:WaitForChild("Items")
local r25_0 = r20_0.GetItemDataFromItemType("Gears", "Diving Gear")
local r26_0 = {}
local r27_0 = {}
local r28_0 = nil
local r29_0 = false
local r30_0 = false
local r31_0 = false
local r32_0 = {}
local r33_0 = false
local r34_0 = nil
local r35_0 = false
local r36_0 = false
local r37_0 = 0.2
local r38_0 = false
local r39_0 = 1.9
local r40_0 = 1.1
local r41_0 = false
local r42_0 = true
local r43_0 = 0.1
local r44_0 = 0
local r45_0 = nil
local r46_0 = nil
local function r47_0()
  -- line: [0, 0] id: 210
  return tonumber((game.Players.LocalPlayer.PlayerGui:WaitForChild("Inventory"):WaitForChild("Main"):WaitForChild("Top"):WaitForChild("Options"):WaitForChild("Fish"):WaitForChild("Label"):WaitForChild("BagSize").Text or "0/???"):match("(%d+)/")) or 0
end
local r48_0 = 0.15
local r49_0 = false
local r50_0 = 0
local r51_0 = nil
local r52_0 = false
local r53_0 = false
local r54_0 = false
local r55_0 = nil
local r56_0 = false
local r57_0 = false
local r58_0 = 1
local r59_0 = 1
if not tonumber(AutoSellValue) then
  local r60_0 = 60
end
local r61_0 = SellMode or "Delay"
if not lastSellTick then
  local r62_0 = 0
end
local r63_0 = false
local r64_0 = {}
local r65_0 = false
local function r66_0(r0_144)
  -- line: [0, 0] id: 144
  if not r0_144 then
    return 
  end
  pcall(function()
    -- line: [0, 0] id: 145
    r16_0.RF_Weather:InvokeServer(r0_144)
  end)
end
local r67_0 = {
  ["Chrome Rod"] = {
    Id = 7,
    Price = 43700,
  },
  ["Lucky Rod"] = {
    Id = 4,
    Price = 15000,
  },
  ["Magma Rod"] = {
    Id = 3,
    Price = 0,
  },
  ["Starter Rod"] = {
    Id = 1,
    Price = 50,
  },
  ["Steampunk Rod"] = {
    Id = 6,
    Price = 215000,
  },
  ["Hyper Rod"] = {
    Id = 9,
    Price = 0,
  },
  ["Gold Rod"] = {
    Id = 8,
    Price = 0,
  },
  ["Lava Rod"] = {
    Id = 2,
    Price = 0,
  },
  ["Carbon Rod"] = {
    Id = 76,
    Price = 750,
  },
  ["Gingerbread Rod"] = {
    Id = 103,
    Price = 0,
  },
  ["Ice Rod"] = {
    Id = 78,
    Price = 5000,
  },
  ["Luck Rod"] = {
    Id = 79,
    Price = 325,
  },
  ["Midnight Rod"] = {
    Id = 80,
    Price = 50000,
  },
  ["Toy Rod"] = {
    Id = 84,
    Price = 0,
  },
  ["Grass Rod"] = {
    Id = 85,
    Price = 1500,
  },
  ["Candy Cane Rod"] = {
    Id = 100,
    Price = 0,
  },
  ["Christmas Tree Rod"] = {
    Id = 101,
    Price = 0,
  },
  ["Demascus Rod"] = {
    Id = 77,
    Price = 3000,
  },
  ["Frozen Rod"] = {
    Id = 102,
    Price = 0,
  },
  ["Cute Rod"] = {
    Id = 123,
    Price = 0,
  },
  ["Angelic Rod"] = {
    Id = 124,
    Price = 75000,
  },
  ["Astral Rod"] = {
    Id = 5,
    Price = 1000000,
  },
  ["Ares Rod"] = {
    Id = 126,
    Price = 3000000,
  },
  ["Ghoul Rod"] = {
    Id = 129,
    Price = 0,
  },
  ["Angler Rod"] = {
    Id = 168,
    Price = 8000000,
  },
  ["Ghostfinn Rod"] = {
    Id = 169,
    Price = 0,
  },
  ["Element Rod"] = {
    Id = 257,
    Price = 0,
  },
  ["Hazmat Rod"] = {
    Id = 256,
    Price = 0,
  },
  ["Fluorescent Rod"] = {
    Id = 255,
    Price = 715000,
  },
  ["Bamboo Rod"] = {
    Id = 258,
    Price = 12000000,
  },
  ["Studded Rod"] = {
    Id = 400,
    Price = 0,
  },
}
local r68_0 = {
  ["Starter Bait"] = {
    Id = 1,
    Price = 0,
  },
  ["Chroma Bait"] = {
    Id = 6,
    Price = 290000,
  },
  ["Gold Bait"] = {
    Id = 4,
    Price = 0,
  },
  ["Hyper Bait"] = {
    Id = 5,
    Price = 0,
  },
  ["Luck Bait"] = {
    Id = 2,
    Price = 1000,
  },
  ["Midnight Bait"] = {
    Id = 3,
    Price = 3000,
  },
  ["Bag-O-Gold Bait"] = {
    Id = 7,
    Price = 0,
  },
  ["Beach Ball Bait"] = {
    Id = 9,
    Price = 0,
  },
  ["Topwater Bait"] = {
    Id = 10,
    Price = 100,
  },
  ["Anchor Bait"] = {
    Id = 11,
    Price = 0,
  },
  ["Ornament Bait"] = {
    Id = 12,
    Price = 0,
  },
  ["Jolly Bait"] = {
    Id = 13,
    Price = 0,
  },
  ["Frozen Bait"] = {
    Id = 14,
    Price = 0,
  },
  ["Dark Matter Bait"] = {
    Id = 8,
    Price = 630000,
  },
  ["Nature Bait"] = {
    Id = 17,
    Price = 83500,
  },
  ["Aether Bait"] = {
    Id = 16,
    Price = 3700000,
  },
  ["Corrupt Bait"] = {
    Id = 15,
    Price = 1148484,
  },
  ["Singularity Bait"] = {
    Id = 18,
    Price = 0,
  },
  ["Royal Bait"] = {
    Id = 19,
    Price = 0,
  },
  ["Floral Bait"] = {
    Id = 20,
    Price = 4000000,
  },
  ["Radioactive Bait"] = {
    Id = 21,
    Price = 0,
  },
  ["Root Bait"] = {
    Id = 22,
    Price = 0,
  },
  ["Delayed Orb Bait"] = {
    Id = 23,
    Price = 0,
  },
  ["Pumpkin Bait"] = {
    Id = 24,
    Price = 0,
  },
  ["Purple Moon Bait"] = {
    Id = 25,
    Price = 0,
  },
  ["Corruption Crystal"] = {
    Id = 27,
    Price = 0,
  },
  ["Matrix Hologram"] = {
    Id = 26,
    Price = 0,
  },
  ["Binary Crystal"] = {
    Id = 28,
    Price = 0,
  },
  ["Wyvern Artifact"] = {
    Id = 29,
    Price = 0,
  },
}
local r69_0 = {
  ["Small Boat"] = {
    Id = 1,
    Price = 300,
  },
  Kayak = {
    Id = 2,
    Price = 1100,
  },
  Jetski = {
    Id = 3,
    Price = 7500,
  },
  ["Highfield Boat"] = {
    Id = 4,
    Price = 25000,
  },
  ["Speed Boat"] = {
    Id = 5,
    Price = 70000,
  },
  ["Fishing Boat"] = {
    Id = 6,
    Price = 180000,
  },
  ["Mini Yacht"] = {
    Id = 14,
    Price = 1200000,
  },
}
local r70_0 = {}
local r71_0 = {}
local function r72_0(r0_71)
  -- line: [0, 0] id: 71
  if r0_71 >= 1000000 then
    return string.format("%.1fM", r0_71 / 1000000)
  end
  if r0_71 >= 1000 then
    return string.format("%.0fK", r0_71 / 1000)
  end
  return tostring(r0_71)
end
local function r73_0(r0_50, r1_50)
  -- line: [0, 0] id: 50
  local r2_50 = {}
  local r3_50 = {}
  for r7_50, r8_50 in pairs(r0_50) do
    local r9_50 = string.format("%s (%s)", r7_50, r72_0(r8_50.Price))
    table.insert(r2_50, r9_50)
    r3_50[r9_50] = r8_50.Id
  end
  table.sort(r2_50)
  r70_0[r1_50] = r2_50
  r71_0[r1_50] = r3_50
end
r73_0(r67_0, "Rod")
r73_0(r68_0, "Bait")
r73_0(r69_0, "Boat")
local r74_0 = nil
local r75_0 = nil
local r76_0 = nil
local r77_0 = nil
local r78_0 = nil
local r79_0 = {}
game.Players.PlayerAdded:Connect(function(r0_13)
  -- line: [0, 0] id: 13
  table.insert(r79_0, r0_13.Name)
end)
game.Players.PlayerRemoving:Connect(function(r0_113)
  -- line: [0, 0] id: 113
  for r4_113, r5_113 in ipairs(r79_0) do
    if r5_113 == r0_113.Name then
      table.remove(r79_0, r4_113)
      break
    end
  end
end)
local function r80_0()
  -- line: [0, 0] id: 89
  return r79_0
end
for r84_0, r85_0 in pairs(game.Players:GetPlayers()) do
  table.insert(r79_0, r85_0.Name)
end
local r81_0 = {
  ["Ancient Jungle"] = Vector3.new(1272.5, 7.8, -191.5),
  ["Ancient Jungle Outside"] = Vector3.new(1488, 7.6, -392),
  ["Ancient Ruin"] = Vector3.new(6090, -585.9, 4634),
  ["Classic Event"] = Vector3.new(1173, 4, 2839),
  ["Classic Event River"] = Vector3.new(1439, 46, 2779),
  ["Coral Reefs SPOT 1"] = Vector3.new(-3031.9, 2.5, 2276.4),
  ["Coral Reefs SPOT 2"] = Vector3.new(-3270.9, 2.5, 2228.1),
  ["Coral Reefs SPOT 3"] = Vector3.new(-3136.1, 2.6, 2126.1),
  ["Creater Island Grounds"] = Vector3.new(1079.6, 3.6, 5080.4),
  ["Creater Island Top"] = Vector3.new(1011.3, 22.7, 5076.3),
  ["Crystaline Pessage"] = Vector3.new(6051, -538.9, 4386),
  ["Esotoric Deep"] = Vector3.new(3181, -1302.7, 1425),
  ["Fishermand Island"] = Vector3.new(33, 3.3, 2764),
  ["Iron Cafe"] = Vector3.new(-8642, -547.5, 162),
  ["Iron Cavern Left"] = Vector3.new(-8795, -585, 89),
  ["Iron Cavern Right"] = Vector3.new(-8792, -585, 223),
  Kohana = Vector3.new(-684.1, 3, 800.8),
  ["Kohana SPOT 1"] = Vector3.new(-367.8, 6.8, 521.9),
  ["Kohana SPOT 2"] = Vector3.new(-624, 19.3, 419.4),
  ["Kohana Volcano"] = Vector3.new(-561.8, 21.2, 156.7),
  ["Lost Shore"] = Vector3.new(-3738, 5.4, -854.7),
  ["Sacred Temple"] = Vector3.new(1475, -21.9, -632),
  ["Sisyphus Statue"] = Vector3.new(-3703.7, -135.6, -1017.2),
  ["Stingray Shores"] = Vector3.new(32.5, 24.8, 3039.4),
  ["Treasure Room"] = Vector3.new(-3602, -266.6, -1577.2),
  ["Tropical Grove"] = Vector3.new(-2018.9, 9, 3750.6),
  ["Tropical Grove Cafe 1"] = Vector3.new(-2151, 2.5, 3671),
  ["Tropical Grove Cafe 2"] = Vector3.new(-2018, 4.5, 3756),
  ["Tropical Grove Highground"] = Vector3.new(-2139, 53.5, 3624),
  ["Underground Cellar"] = Vector3.new(2136, -91.2, -699),
  ["Weather Machine"] = Vector3.new(-1524.9, 2.9, 1915.6),
}
local r82_0 = {
  "Ancient Jungle",
  "Ancient Jungle Outside",
  "Ancient Ruin",
  "Classic Event",
  "Classic Event River",
  "Coral Reefs SPOT 1",
  "Coral Reefs SPOT 2",
  "Coral Reefs SPOT 3",
  "Creater Island Grounds",
  "Creater Island Top",
  "Crystaline Pessage",
  "Esotoric Deep",
  "Fishermand Island",
  "Iron Cafe",
  "Iron Cavern Left",
  "Iron Cavern Right",
  "Kohana",
  "Kohana SPOT 1",
  "Kohana SPOT 2",
  "Kohana Volcano",
  "Lost Shore",
  "Sacred Temple",
  "Sisyphus Statue",
  "Stingray Shores",
  "Treasure Room",
  "Tropical Grove",
  "Tropical Grove Cafe 1",
  "Tropical Grove Cafe 2",
  "Tropical Grove Highground",
  "Underground Cellar",
  "Weather Machine"
}
local r83_0 = {}
local r84_0 = {
  Enabled = false,
  URL = "",
}
local r85_0 = false
local r86_0 = {}
local r87_0 = {}
local r88_0 = ""
local r89_0 = {}
local r90_0 = {
  [1] = "Common",
  [2] = "Uncommon",
  [3] = "Rare",
  [4] = "Epic",
  [5] = "Legendary",
  [6] = "Mythic",
  [7] = "Secret",
}
local function r92_0(r0_187)
  -- line: [0, 0] id: 187
  local r1_187 = r0_187:match("rbxassetid://(%d+)")
  if not r1_187 then
    return nil
  end
  local r2_187 = string.format("https://thumbnails.roblox.com/v1/assets?assetIds=%s&type=Asset&size=420x420&format=Png", r1_187)
  local r3_187, r4_187 = pcall(function()
    -- line: [0, 0] id: 188
    return r4_0:JSONDecode(game:HttpGet(r2_187))
  end)
  return r3_187 and r4_187 and r4_187.data and r4_187.data[1] and r4_187.data[1].imageUrl
end
local function r93_0(r0_155)
  -- line: [0, 0] id: 155
  local r1_155 = syn
  if r1_155 then
    r1_155 = syn.request
    if not r1_155 then
      ::label_7::
      r1_155 = http_request
      if not r1_155 then
        r1_155 = http
        if r1_155 then
          r1_155 = http.request
          if not r1_155 then
            ::label_17::
            r1_155 = fluxus
            if r1_155 then
              r1_155 = fluxus.request or request
            else
              goto label_24	-- block#7 is visited secondly
            end
          end
        else
          goto label_17	-- block#5 is visited secondly
        end
      end
    end
  else
    goto label_7	-- block#2 is visited secondly
  end
  if r1_155 then
    return r1_155(r0_155)
  end
  warn("Executor kamu tidak support http request")
  return nil
end
local function r94_0(r0_16, r1_16)
  -- line: [0, 0] id: 16
  if not r0_16 or r0_16 == "" then
    return 
  end
  if r89_0[r0_16] then
    return 
  end
  r89_0[r0_16] = true
  task.delay(0.25, function()
    -- line: [0, 0] id: 18
    r89_0[r0_16] = nil
  end)
  pcall(function()
    -- line: [0, 0] id: 17
    r93_0({
      Url = r0_16,
      Method = "POST",
      Headers = {
        ["Content-Type"] = "application/json",
      },
      Body = r4_0:JSONEncode(r1_16),
    })
  end)
end
local function r95_0(r0_51)
  -- line: [0, 0] id: 51
  if not r84_0.Enabled then
    return 
  end
  local r1_51 = r84_0.URL
  if not r1_51 or not r1_51:match("discord.com/api/webhooks") then
    return 
  end
  local r2_51 = r83_0[r0_51.Id]
  if not r2_51 then
    return 
  end
  local r3_51 = r90_0[r2_51.Tier] or "Unknown"
  if 0 < #r86_0 and not table.find(r86_0, r3_51) then
    return 
  end
  if 0 < #r87_0 and not table.find(r87_0, r2_51.Name) then
    return 
  end
  local r4_51 = r0_51.Metadata
  if r4_51 then
    r4_51 = r0_51.Metadata.Weight and (string.format("%.2f Kg", r0_51.Metadata.Weight) or "N/A")
  else
    goto label_66	-- block#18 is visited secondly
  end
  local r5_51 = r0_51.Metadata
  if r5_51 then
    r5_51 = r0_51.Metadata.VariantId and (tostring(r0_51.Metadata.VariantId) or "None")
  else
    goto label_80	-- block#22 is visited secondly
  end
  local r6_51 = r2_51.SellPrice
  if r6_51 then
    r6_51 = "$" .. string.format("%d", r2_51.SellPrice):reverse():gsub("(%d%d%d)", "%1,"):reverse():gsub("^,", "") or "N/A"
  else
    goto label_105	-- block#25 is visited secondly
  end
  local r7_51 = {
    username = "Meng Hub Notification!",
    avatar_url = "https://i.imgur.com/ly3iUKn.jpeg",
  }
  local r8_51 = {}
  local r9_51 = {}
  local r10_51 = string.format
  local r11_51 = "Congratulations **%s**! You just caught a **%s** fish!"
  local r12_51 = r88_0
  if r12_51 ~= "" then
    r12_51 = r88_0 or r6_0.Name
  else
    goto label_120	-- block#28 is visited secondly
  end
  r9_51.description = r10_51(r11_51, r12_51, r3_51)
  r9_51.color = 16738740
  r9_51.author = {
    name = "MengHub Webhook | Fish Caught",
  }
  r10_51 = {}
  r10_51.url = r92_0(r2_51.Icon) or "https://i.imgur.com/ly3iUKn.jpeg"
  r9_51.image = r10_51
  r9_51.fields = {
    {
      name = "��� Fish Name",
      value = "```❯ " .. r2_51.Name .. "```",
    },
    {
      name = "��� Tier",
      value = "```❯ " .. r3_51 .. "```",
    },
    {
      name = "��� Weight",
      value = "```❯ " .. r4_51 .. "```",
    },
    {
      name = "��� Mutation",
      value = "```❯ " .. r5_51 .. "```",
    },
    {
      name = "��� Sell Price",
      value = "```❯ " .. r6_51 .. "```",
    },
    {
      name = "��� Caught At",
      value = "```❯ " .. os.date("%Y-%m-%d %H:%M:%S") .. "```",
    }
  }
  r9_51.footer = {
    text = "Powered by MengHub",
    icon_url = "https://i.imgur.com/ly3iUKn.jpeg",
  }
  r9_51.timestamp = os.date("!%Y-%m-%dT%H:%M:%S.000Z")
  -- setlist for #8 failed
  r7_51.embeds = r8_51
  r94_0(r1_51, r7_51)
end
(function()
  -- line: [0, 0] id: 154
  if not r24_0 then
    return 
  end
  for r3_154, r4_154 in ipairs(r24_0:GetChildren()) do
    if r4_154:IsA("ModuleScript") then
      local r5_154, r6_154 = pcall(require, r4_154)
      if r5_154 and r6_154 and r6_154.Data and r6_154.Data.Type == "Fish" then
        r83_0[r6_154.Data.Id] = {
          Name = r6_154.Data.Name,
          Tier = r6_154.Data.Tier,
          Icon = r6_154.Data.Icon,
          SellPrice = r6_154.SellPrice,
        }
      end
    end
  end
end)()
local r96_0 = {}
for r100_0, r101_0 in pairs(r83_0) do
  table.insert(r96_0, r101_0.Name)
end
table.sort(r96_0)
task.spawn(function()
  -- line: [0, 0] id: 91
  repeat
    task.wait(1)
  until r16_0.RE_ObtainedNewFishNotification
  if not FishWebhookConnected then
    FishWebhookConnected = true
    r16_0.RE_ObtainedNewFishNotification.OnClientEvent:Connect(function(r0_92, r1_92)
      -- line: [0, 0] id: 92
      if r85_0 then
        r95_0({
          Id = r0_92,
          Metadata = r1_92,
        })
      end
    end)
  end
end)
local r97_0 = getconnections or get_signal_cons
if r97_0 then
  for r101_0, r102_0 in pairs(r97_0(r6_0.Idled)) do
    local r103_0 = r102_0.Disable
    if r103_0 then
      local r105_0 = "Disable"
      r102_0:[r105_0]()
    else
      r103_0 = r102_0.Disconnect
      if r103_0 then
        local r105_0 = "Disconnect"
        r102_0:[r105_0]()
      end
    end
  end
end
local r98_0 = cloneref
if r98_0 then
  r98_0 = cloneref(game:GetService("VirtualUser")) or game:GetService("VirtualUser")
else
  goto label_887	-- block#25 is visited secondly
end
r6_0.Idled:Connect(function()
  -- line: [0, 0] id: 139
  r98_0:CaptureController()
  r98_0:ClickButton2(Vector2.new())
end)
local r99_0 = false
local r100_0 = {}
local r101_0 = nil
local r102_0 = nil
local r103_0 = {
  Cloudy = true,
  Day = true,
  ["Increased Luck"] = true,
  Mutated = true,
  Night = true,
  Snow = true,
  ["Sparkling Cove"] = true,
  Storm = true,
  Wind = true,
  UIListLayout = true,
  ["Admin - Shocked"] = true,
  ["Admin - Super Mutated"] = true,
  Radiant = true,
}
offs = {
  ["Worm Hunt"] = 25,
}
local function r104_0(r0_118)
  -- line: [0, 0] id: 118
  return r0_118 and (r0_118:FindFirstChild("HumanoidRootPart") or r0_118:FindFirstChildWhichIsA("BasePart"))
end
local r105_0 = nil
local r106_0 = nil
local function r107_0(r0_168, r1_168, r2_168)
  -- line: [0, 0] id: 168
  if r106_0 then
    r106_0:Disconnect()
    r106_0 = nil
  end
  r105_0 = r2_168
  if r2_168 then
    local r3_168 = r0_168:FindFirstChild("FloatPart") or Instance.new("Part")
    r3_168.Name = "FloatPart"
    r3_168.Size = Vector3.new(3, 0.2, 3)
    r3_168.CanCollide = true
    r3_168.Anchored = true
    r3_168.Transparency = 1
    r3_168.Parent = r0_168
    r106_0 = r2_0.Heartbeat:Connect(function()
      -- line: [0, 0] id: 169
      if r3_168 and r1_168 then
        r3_168.CFrame = r1_168.CFrame * CFrame.new(0, -3.1, 0)
      end
    end)
    -- close: r3_168
  else
    local r3_168 = r0_168:FindFirstChild("FloatPart")
    if r3_168 then
      r3_168:Destroy()
    end
  end
end
local function r108_0()
  -- line: [0, 0] id: 67
  local r0_67 = {}
  local r2_67 = r6_0:WaitForChild("PlayerGui"):FindFirstChild("Events")
  if r2_67 and r2_67:FindFirstChild("Frame") then
    local r3_67 = r2_67.Frame:FindFirstChild("Events")
    if r3_67 then
      for r7_67, r8_67 in ipairs(r3_67:GetChildren()) do
        local r9_67 = r8_67:FindFirstChild("DisplayName")
        if r9_67 then
          r9_67 = r8_67.DisplayName.Text or r8_67.Name
        else
          goto label_35	-- block#6 is visited secondly
        end
        if type(r9_67) == "string" and r9_67 ~= "" and not r103_0[r9_67] then
          table.insert(r0_67, r9_67:gsub("^Admin %- ", ""))
        end
      end
    end
  end
  return r0_67
end
local function r109_0(r0_121)
  -- line: [0, 0] id: 121
  if not r0_121 then
    return 
  end
  if r0_121 == "Megalodon Hunt" then
    local r1_121 = workspace:FindFirstChild("!!! MENU RINGS")
    if not r1_121 then
      return 
    end
    for r5_121, r6_121 in ipairs(r1_121:GetChildren()) do
      local r7_121 = r6_121:FindFirstChild("Megalodon Hunt")
      local r8_121 = r7_121 and r7_121:FindFirstChild("Megalodon Hunt")
      if r8_121 and r8_121:IsA("BasePart") then
        return r8_121
      end
    end
    return 
  end
  local r1_121 = {
    workspace:FindFirstChild("Props")
  }
  local r2_121 = workspace:FindFirstChild("!!! MENU RINGS")
  if r2_121 then
    for r6_121, r7_121 in ipairs(r2_121:GetChildren()) do
      if r7_121.Name:match("^Props") then
        table.insert(r1_121, r7_121)
      end
    end
  end
  for r6_121, r7_121 in ipairs(r1_121) do
    for r11_121, r12_121 in ipairs(r7_121:GetChildren()) do
      for r16_121, r17_121 in ipairs(r12_121:GetDescendants()) do
        if r17_121:IsA("TextLabel") and r17_121.Name == "DisplayName" then
          local r18_121 = r17_121.ContentText
          if r18_121 ~= "" then
            r18_121 = r17_121.ContentText or r17_121.Text
          else
            goto label_94	-- block#25 is visited secondly
          end
          local r19_121 = r18_121:lower()
          local r20_121 = r0_121:lower()
          if r19_121 == r20_121 then
            r19_121 = r17_121:FindFirstAncestorOfClass("Model")
            if r19_121 then
              r20_121 = r19_121:FindFirstChild("Part") or r12_121:FindFirstChild("Part")
            else
              goto label_111	-- block#29 is visited secondly
            end
            if r20_121 and r20_121:IsA("BasePart") then
              return r20_121
            end
          end
        end
      end
    end
  end
end
local r110_0 = nil
local function r111_0(r0_224)
  -- line: [0, 0] id: 224
  if r110_0 ~= r0_224 then
    WindUI:Notify({
      Title = r0_224,
      Duration = 2.5,
    })
    r110_0 = r0_224
  end
end
function EventLoop()
  -- line: [0, 0] id: 122
  while r99_0 do
    local r0_122 = nil
    local r1_122 = nil
    if r100_0 then
      r0_122 = r109_0(r100_0)
      if r0_122 then
        r1_122 = r100_0 or nil
      else
        goto label_16	-- block#4 is visited secondly
      end
    end
    local r2_122 = r104_0(r6_0.Character)
    if r0_122 and r2_122 then
      if not r102_0 then
        r102_0 = r2_122.CFrame
      end
      if (r2_122.Position - r0_122.Position).Magnitude > 40 then
        r101_0 = r0_122.CFrame + Vector3.new(0, (offs[r1_122] or 7), 0)
        r6_0.Character:PivotTo(r101_0)
        task.wait(1)
        r111_0("Event! " .. r1_122)
      end
    else
      if r102_0 and r2_122 and r101_0 then
        r6_0.Character:PivotTo(r102_0)
      end
      r101_0 = nil
      r102_0 = nil
      r111_0("Idle")
    end
    task.wait(0.2)
  end
  if r102_0 and r6_0.Character then
    r6_0.Character:PivotTo(r102_0)
  end
  r111_0("Auto Event off")
  r102_0 = nil
  r101_0 = nil
end
r6_0.CharacterAdded:Connect(function(r0_197)
  -- line: [0, 0] id: 197
  if r99_0 then
    task.spawn(function()
      -- line: [0, 0] id: 198
      local r0_198 = r0_197:WaitForChild("HumanoidRootPart", 5)
      task.wait(0.3)
      if r0_198 then
        if r101_0 then
          r0_197:PivotTo(r101_0)
          task.wait(0.5)
        elseif r102_0 then
          r0_197:PivotTo(r102_0)
        end
      end
    end)
  end
end)
local r112_0 = {
  "Galaxy",
  "Corrupt",
  "Gemstone",
  "Ghost",
  "Lightning",
  "Fairy Dust",
  "Gold",
  "Midnight",
  "Radioactive",
  "Stone",
  "Holographic",
  "Albino",
  "Bloodmoon",
  "Sandy",
  "Acidic",
  "Color Burn",
  "Festive",
  "Frozen"
}
function toSet(r0_185)
  -- line: [0, 0] id: 185
  local r1_185 = {}
  if type(r0_185) == "table" then
    for r5_185, r6_185 in ipairs(r0_185) do
      r1_185[r6_185] = true
    end
    for r5_185, r6_185 in pairs(r0_185) do
      if r6_185 then
        r1_185[r5_185] = true
      end
    end
  end
  return r1_185
end
local r113_0 = {
  auto = false,
  name = {},
  rarity = {},
  variant = {},
}
local r114_0 = {}
r16_0.RE_FavoriteChanged.OnClientEvent:Connect(function(r0_44, r1_44)
  -- line: [0, 0] id: 44
  rawset(r114_0, r0_44, r1_44)
end)
function checkAndFavorite(r0_146)
  -- line: [0, 0] id: 146
  if not r113_0.auto then
    return 
  end
  local r1_146 = r20_0.GetItemDataFromItemType("Items", r0_146.Id)
  if not r1_146 or r1_146.Data.Type ~= "Fish" then
    return 
  end
  local r2_146 = r90_0[r1_146.Data.Tier]
  local r3_146 = r1_146.Data.Name
  local r4_146 = r0_146.Metadata
  if r4_146 then
    r4_146 = r0_146.Metadata.VariantId or "None"
  else
    goto label_30	-- block#7 is visited secondly
  end
  local r5_146 = r113_0.name[r3_146]
  local r6_146 = r113_0.rarity[r2_146]
  local r7_146 = r113_0.variant[r4_146]
  local r8_146 = rawget(r114_0, r0_146.UUID)
  if r8_146 == nil then
    r8_146 = r0_146.Favorited
  end
  local r9_146 = false
  if next(r113_0.variant) ~= nil and next(r113_0.name) ~= nil then
    r9_146 = r5_146 and r7_146
  else
    r9_146 = r5_146 or r6_146
  end
  if r9_146 and not r8_146 then
    r16_0.RE_Favorite:FireServer(r0_146.UUID)
    rawset(r114_0, r0_146.UUID, true)
  end
end
function scanInventory()
  -- line: [0, 0] id: 166
  if not r113_0.auto then
    return 
  end
  for r3_166, r4_166 in ipairs(r23_0:GetExpect({
    "Inventory",
    "Items"
  })) do
    checkAndFavorite(r4_166)
  end
end
local r118_0 = "HttpGet"
r118_0 = "https://raw.githubusercontent.com/zhidanptrsyh/MengHub/refs/heads/main/main.lua"
local r115_0 = loadstring(game:[r118_0](r118_0))()
r118_0 = "CreateWindow"
r118_0 = {
  Title = "MengHub - Fish It",
  Icon = "rbxassetid://78018573702743",
  Author = "Freemium",
  Folder = "MengHub",
  Size = UDim2.fromOffset(380, 260),
  MinSize = Vector2.new(560, 350),
  MaxSize = Vector2.new(850, 560),
  Transparent = true,
  Theme = "Dark",
  Resizable = true,
  SideBarWidth = 200,
  BackgroundImageTransparency = 0.42,
  HideSearchBar = true,
  ScrollBarEnabled = false,
}
local r116_0 = r115_0:[r118_0](r118_0)
local r119_0 = "Tag"
r119_0 = {
  Title = "v1.0.1",
  Icon = "cone",
  Color = Color3.fromHex("#FF88E3"),
  Radius = 12,
}
r116_0:[r119_0](r119_0)
r119_0 = "EditOpenButton"
r119_0 = {
  Title = "Open Example UI",
  OnlyMobile = false,
  Enabled = false,
  Draggable = false,
}
r116_0:[r119_0](r119_0)
r119_0 = "AddTheme"
r119_0 = {
  Name = "Dark Theme",
  Accent = Color3.fromHex("#1c1c1e"),
  Background = Color3.fromHex("#121212"),
  Outline = Color3.fromHex("#2c2c2c"),
  Text = Color3.fromHex("#e0e0e0"),
  Placeholder = Color3.fromHex("#7a7a7a"),
  Button = Color3.fromHex("#2a2a2a"),
  Icon = Color3.fromHex("#c1c1c1"),
}
r115_0:[r119_0](r119_0)
r119_0 = "AddTheme"
r119_0 = {
  Name = "Light Theme",
  Accent = Color3.fromHex("#1abc9c"),
  Background = Color3.fromHex("#e5e5e5"),
  Outline = Color3.fromHex("#c0c0c0"),
  Text = Color3.fromHex("#2c2c2c"),
  Placeholder = Color3.fromHex("#7a7a7a"),
  Button = Color3.fromHex("#2fac7c"),
  Icon = Color3.fromHex("#e91e63"),
}
r115_0:[r119_0](r119_0)
local r120_0 = "CreateConfig"
r120_0 = "MengXHubConfig"
r118_0 = r116_0.ConfigManager:[r120_0](r120_0)
({
  ToggleUI = function(r0_212)
    -- line: [0, 0] id: 212
    local r1_212 = Instance.new("ScreenGui")
    r1_212.Parent = game:GetService("CoreGui")
    r1_212.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
    r1_212.Name = "ToggleUIButton"
    local r2_212 = Instance.new("ImageLabel")
    r2_212.Parent = r1_212
    r2_212.Size = UDim2.new(0, 40, 0, 40)
    r2_212.Position = UDim2.new(0, 20, 0, 100)
    r2_212.BackgroundTransparency = 1
    r2_212.Image = "rbxassetid://78018573702743"
    r2_212.ScaleType = Enum.ScaleType.Fit
    local r3_212 = Instance.new("UICorner")
    r3_212.CornerRadius = UDim.new(0, 6)
    r3_212.Parent = r2_212
    local r4_212 = Instance.new("TextButton")
    r4_212.Parent = r2_212
    r4_212.Size = UDim2.new(1, 0, 1, 0)
    r4_212.BackgroundTransparency = 1
    r4_212.Text = ""
    r4_212.MouseButton1Click:Connect(function()
      -- line: [0, 0] id: 217
      r116_0:Toggle()
    end)
    local r5_212 = false
    local r6_212 = nil
    local r7_212 = nil
    local function r8_212(r0_215)
      -- line: [0, 0] id: 215
      local r1_215 = r0_215.Position - r6_212
      r2_212.Position = UDim2.new(r7_212.X.Scale, r7_212.X.Offset + r1_215.X, r7_212.Y.Scale, r7_212.Y.Offset + r1_215.Y)
    end
    r4_212.InputBegan:Connect(function(r0_213)
      -- line: [0, 0] id: 213
      if r0_213.UserInputType == Enum.UserInputType.MouseButton1 or r0_213.UserInputType == Enum.UserInputType.Touch then
        r5_212 = true
        r6_212 = r0_213.Position
        r7_212 = r2_212.Position
        r0_213.Changed:Connect(function()
          -- line: [0, 0] id: 214
          if r0_213.UserInputState == Enum.UserInputState.End then
            r5_212 = false
          end
        end)
      end
    end)
    game:GetService("UserInputService").InputChanged:Connect(function(r0_216)
      -- line: [0, 0] id: 216
      if r5_212 and (r0_216.UserInputType == Enum.UserInputType.MouseMovement or r0_216.UserInputType == Enum.UserInputType.Touch) then
        r8_212(r0_216)
      end
    end)
  end,
}):ToggleUI()
local r122_0 = "SetToggleKey"
r122_0 = Enum.KeyCode.F3
r116_0:[r122_0](r122_0)
r122_0 = "IsResizable"
r122_0 = true
r116_0:[r122_0](r122_0)
r122_0 = "Tab"
r122_0 = {
  Title = "Info",
  Icon = "info",
}
r120_0 = r116_0:[r122_0](r122_0)
local r123_0 = "Tab"
r123_0 = {
  Title = "Player",
  Icon = "users",
}
local r121_0 = r116_0:[r123_0](r123_0)
local r124_0 = "Tab"
r124_0 = {
  Title = "Fishing",
  Icon = "rbxassetid://103247953194129",
}
r122_0 = r116_0:[r124_0](r124_0)
local r125_0 = "Tab"
r125_0 = {
  Title = "Automatic",
  Icon = "rbxassetid://12662718374",
}
r123_0 = r116_0:[r125_0](r125_0)
local r126_0 = "Tab"
r126_0 = {
  Title = "Weebhook",
  Icon = "rbxassetid://137601480983962",
}
r124_0 = r116_0:[r126_0](r126_0)
local r127_0 = "Tab"
r127_0 = {
  Title = "Quest",
  Icon = "rbxassetid://114127804740858",
}
r125_0 = r116_0:[r127_0](r127_0)
local r128_0 = "Tab"
r128_0 = {
  Title = "Utilities",
  Icon = "box",
}
r126_0 = r116_0:[r128_0](r128_0)
local r129_0 = "Tab"
r129_0 = {
  Title = "Shop",
  Icon = "shopping-cart",
}
r127_0 = r116_0:[r129_0](r129_0)
local r130_0 = "Tab"
r130_0 = {
  Title = "Teleport",
  Icon = "map",
}
r128_0 = r116_0:[r130_0](r130_0)
local r131_0 = "Paragraph"
r131_0 = {
  Title = "MengHub Alert!",
  Desc = "This script is still under development!\nThere is a possibility it may get detected if used in public servers!\nIf you have suggestions or found bugs, please report them to <font color=\"#00AAFF\">Discord Meng Hub</font>!\n<b>Use at your own risk!</b>",
  Color = "Green",
  Image = "rbxassetid://17313330026",
  ImageSize = 30,
}
r120_0:[r131_0](r131_0)
r131_0 = "Button"
r131_0 = {
  Title = "Need Help?",
  Desc = "Click This To Copy Discord Link.\nJoin to <font color=\"#FF90E3\">Discord Meng Hub</font>!",
  Callback = function()
    -- line: [0, 0] id: 70
    if setclipboard then
      setclipboard("discord.gg/menghub")
      r115_0:Notify({
        Title = "Success",
        Content = "Link Discord berhasil disalin ke clipboard!",
        Duration = 3,
        Icon = "laptop-minimal-check",
      })
    else
      r115_0:Notify({
        Title = "Error",
        Content = "Executor tidak support salin clipboard!",
        Duration = 3,
        Icon = "circle-x",
      })
    end
  end,
}
r120_0:[r131_0](r131_0)
r120_0:Space()
function r129_0()
  -- line: [0, 0] id: 180
  if r6_0 then
    r11_0:Teleport(game.PlaceId, r6_0)
  end
end
function r130_0()
  -- line: [0, 0] id: 14
  local r0_14 = game.PlaceId
  local r1_14 = {}
  local r2_14 = nil
  while true do
    local r3_14 = "https://games.roblox.com/v1/games/" .. r0_14 .. "/servers/Public?sortOrder=Asc&limit=100"
    if r2_14 then
      local r4_14 = r3_14
      local r5_14 = "&cursor="
      r3_14 = r4_14 .. r5_14 .. r2_14
    end
    local r4_14, r5_14 = pcall(function()
      -- line: [0, 0] id: 15
      return r4_0:JSONDecode(game:HttpGet(r3_14))
    end)
    if r4_14 and r5_14 and r5_14.data then
      for r9_14, r10_14 in pairs(r5_14.data) do
        if r10_14.playing < r10_14.maxPlayers and r10_14.id ~= game.JobId then
          table.insert(r1_14, r10_14.id)
        end
      end
      r2_14 = r5_14.nextPageCursor
      if not r2_14 then
        -- close: r3_14
        break
      else
        -- close: r3_14
      end
    else
      -- close: r3_14
      break
    end
  end
  if #r1_14 > 0 then
    r11_0:TeleportToPlaceInstance(r0_14, r1_14[math.random(1, #r1_14)], r6_0)
  else
    r115_0:Notify({
      Title = "Error",
      Content = "No servers available or all are full",
      Duration = 2.5,
      Icon = "circle-x",
    })
  end
end
local r133_0 = "Button"
r133_0 = {
  Title = "Rejoin Server",
  Callback = function()
    -- line: [0, 0] id: 201
    r129_0()
  end,
}
r120_0:[r133_0](r133_0)
r133_0 = "Button"
r133_0 = {
  Title = "Server Hop",
  Desc = "Join a new server",
  Callback = function()
    -- line: [0, 0] id: 193
    r130_0()
  end,
}
r120_0:[r133_0](r133_0)
r133_0 = "Section"
r133_0 = {
  Title = "User Interface",
}
InterfaceSection = r121_0:[r133_0](r133_0)
r133_0 = "Toggle"
r133_0 = {
  Title = "Change Theme",
  Desc = "Dark = OFF | Light = ON",
  Value = false,
  Callback = function(r0_151)
    -- line: [0, 0] id: 151
    if r0_151 then
      r115_0:SetTheme("Light Theme")
    else
      r115_0:SetTheme("Dark Theme")
    end
  end,
}
r131_0 = InterfaceSection:[r133_0](r133_0)
local r134_0 = "Register"
r134_0 = "themeToggle"
r118_0:[r134_0](r134_0, r131_0)
r134_0 = "Section"
r134_0 = {
  Title = "Movement",
}
MovementSection = r121_0:[r134_0](r134_0)
r134_0 = "Slider"
r134_0 = {
  Title = "WalkSpeed",
  Desc = "",
  Step = 1,
  Value = {
    Min = 16,
    Max = 200,
    Default = 16,
  },
  Callback = function(r0_49)
    -- line: [0, 0] id: 49
    r6_0.Character.Humanoid.WalkSpeed = r0_49
  end,
}
local r132_0 = MovementSection:[r134_0](r134_0)
local r135_0 = "Slider"
r135_0 = {
  Title = "JumpPower",
  Desc = "",
  Step = 1,
  Value = {
    Min = 50,
    Max = 500,
    Default = 50,
  },
  Callback = function(r0_129)
    -- line: [0, 0] id: 129
    r6_0.Character.Humanoid.JumpPower = r0_129
  end,
}
r133_0 = MovementSection:[r135_0](r135_0)
local r136_0 = "Button"
r136_0 = {
  Title = "Reset Speed And Jump",
  Callback = function()
    -- line: [0, 0] id: 150
    r6_0.Character.Humanoid.WalkSpeed = 16
    r6_0.Character.Humanoid.JumpPower = 50
    r132_0:Set(16)
    r133_0:Set(50)
    r115_0:Notify({
      Title = "Success",
      Content = "Berhasil mereset jump and speed",
      Duration = 2.5,
      Icon = "laptop-minimal-check",
    })
  end,
}
MovementSection:[r136_0](r136_0)
MovementSection:Divider()
r134_0 = false
r135_0 = true
r136_0 = 1
local r137_0 = nil
local r138_0 = nil
local function r139_0(r0_20)
  -- line: [0, 0] id: 20
  return r0_20:FindFirstChild("HumanoidRootPart") or r0_20:FindFirstChild("Torso") or r0_20:FindFirstChild("UpperTorso")
end
local function r140_0()
  -- line: [0, 0] id: 74
  r134_0 = false
  local r0_74 = r6_0.Character
  if r0_74 then
    local r1_74 = r0_74:FindFirstChildOfClass("Humanoid")
    if r1_74 then
      r1_74.PlatformStand = false
    end
    local r2_74 = r0_74:FindFirstChild("HumanoidRootPart")
    if r2_74 then
      for r6_74, r7_74 in pairs(r2_74:GetChildren()) do
        if r7_74:IsA("BodyGyro") or r7_74:IsA("BodyVelocity") then
          r7_74:Destroy()
        end
      end
    end
  end
end
local function r141_0(r0_175)
  -- line: [0, 0] id: 175
  local r1_175 = r6_0
  local r2_175 = r1_175.Character or r1_175.CharacterAdded:Wait()
  local r3_175 = r2_175:FindFirstChildOfClass("Humanoid") or r2_175:WaitForChild("Humanoid")
  local r4_175 = r139_0(r2_175)
  local r5_175 = {
    F = 0,
    B = 0,
    L = 0,
    R = 0,
    Q = 0,
    E = 0,
  }
  local r6_175 = {
    F = 0,
    B = 0,
    L = 0,
    R = 0,
    Q = 0,
    E = 0,
  }
  local r7_175 = 0
  if r137_0 then
    r137_0:Disconnect()
  end
  if r138_0 then
    r138_0:Disconnect()
  end
  r137_0 = r12_0.InputBegan:Connect(function(r0_177)
    -- line: [0, 0] id: 177
    local r1_177 = r0_177.KeyCode
    if r1_177 == Enum.KeyCode.W then
      r5_175.F = 1
    elseif r1_177 == Enum.KeyCode.S then
      r5_175.B = -1
    elseif r1_177 == Enum.KeyCode.A then
      r5_175.L = -1
    elseif r1_177 == Enum.KeyCode.D then
      r5_175.R = 1
    elseif r1_177 == Enum.KeyCode.E and r135_0 then
      r5_175.Q = 1
    elseif r1_177 == Enum.KeyCode.Q and r135_0 then
      r5_175.E = -1
    end
  end)
  r138_0 = r12_0.InputEnded:Connect(function(r0_176)
    -- line: [0, 0] id: 176
    local r1_176 = r0_176.KeyCode
    if r1_176 == Enum.KeyCode.W then
      r5_175.F = 0
    elseif r1_176 == Enum.KeyCode.S then
      r5_175.B = 0
    elseif r1_176 == Enum.KeyCode.A then
      r5_175.L = 0
    elseif r1_176 == Enum.KeyCode.D then
      r5_175.R = 0
    elseif r1_176 == Enum.KeyCode.E then
      r5_175.Q = 0
    elseif r1_176 == Enum.KeyCode.Q then
      r5_175.E = 0
    end
  end)
  (function()
    -- line: [0, 0] id: 178
    r134_0 = true
    local r0_178 = Instance.new("BodyGyro")
    local r1_178 = Instance.new("BodyVelocity")
    r0_178.MaxTorque = Vector3.new(9000000000, 9000000000, 9000000000)
    r0_178.P = 90000
    r1_178.Parent = r4_175
    r0_178.Parent = r4_175
    r0_178.CFrame = r4_175.CFrame
    r1_178.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
    task.spawn(function()
      -- line: [0, 0] id: 179
      repeat
        task.wait()
        local r0_179 = workspace.CurrentCamera
        if not r0_175 then
          local r1_179 = r3_175
          r1_179.PlatformStand = true
        end
        local r1_179 = r5_175.L + r5_175.R
        if r1_179 == 0 then
          r1_179 = r5_175.F + r5_175.B
          if r1_179 == 0 then
            r1_179 = r5_175.Q + r5_175.E
            if r1_179 ~= 0 then
              ::label_31::
              r1_179 = r136_0 * 50 or 0
            else
              goto label_35	-- block#6 is visited secondly
            end
          end
        else
          goto label_31	-- block#5 is visited secondly
        end
        r7_175 = r1_179
        r1_179 = r7_175
        if r1_179 ~= 0 then
          r1_178.Velocity = (r0_179.CFrame.LookVector * (r5_175.F + r5_175.B) + r0_179.CFrame * CFrame.new((r5_175.L + r5_175.R), (r5_175.F + r5_175.B + r5_175.Q + r5_175.E) * 0.2, 0).p - r0_179.CFrame.p) * r7_175
          r1_179 = {}
          r1_179.F = r5_175.F
          r1_179.B = r5_175.B
          r1_179.L = r5_175.L
          r1_179.R = r5_175.R
          r6_175 = r1_179
        else
          r1_179 = r1_178
          r1_179.Velocity = Vector3.zero
        end
        r0_178.CFrame = r0_179.CFrame
        r1_179 = r134_0
      until not r1_179
      r0_178:Destroy()
      r1_178:Destroy()
      r3_175.PlatformStand = false
    end)
  end)()
end
local function r142_0(r0_152)
  -- line: [0, 0] id: 152
  r134_0 = true
  local r1_152 = r0_152.Character or r0_152.CharacterAdded:Wait()
  local r2_152 = r1_152:WaitForChild("HumanoidRootPart")
  local r3_152 = r1_152:FindFirstChildOfClass("Humanoid")
  local r4_152 = workspace.CurrentCamera
  local r5_152 = require(r0_152:WaitForChild("PlayerScripts"):WaitForChild("PlayerModule"):WaitForChild("ControlModule"))
  local r6_152 = Instance.new("BodyVelocity")
  local r7_152 = Instance.new("BodyGyro")
  r6_152.MaxForce = Vector3.new(9000000000, 9000000000, 9000000000)
  local r8_152 = Vector3.new(9000000000, 9000000000, 9000000000)
  r7_152.D = 50
  r7_152.P = 1000
  r7_152.MaxTorque = r8_152
  r7_152.Parent = r2_152
  r6_152.Parent = r2_152
  r3_152.PlatformStand = true
  task.spawn(function()
    -- line: [0, 0] id: 153
    while r134_0 do
      local r0_153 = task.wait()
      if r0_153 then
        r0_153 = r5_152:GetMoveVector()
        r7_152.CFrame = r4_152.CFrame
        r6_152.Velocity = (r4_152.CFrame.RightVector * r0_153.X + r4_152.CFrame.LookVector * -r0_153.Z) * r136_0 * 50
      else
        break
      end
    end
    r3_152.PlatformStand = false
    r6_152:Destroy()
    r7_152:Destroy()
  end)
end
local r145_0 = "Slider"
r145_0 = {
  Title = "Fly Speed",
  Step = 1,
  Value = {
    Min = 1,
    Max = 10,
    Default = 1,
  },
  Callback = function(r0_223)
    -- line: [0, 0] id: 223
    r136_0 = r0_223
  end,
}
local r143_0 = MovementSection:[r145_0](r145_0)
local r146_0 = "Toggle"
r146_0 = {
  Title = "Enable Fly",
  Value = false,
  Callback = function(r0_114)
    -- line: [0, 0] id: 114
    if r0_114 then
      if r12_0.TouchEnabled then
        r142_0(r6_0)
      else
        r141_0()
      end
    else
      r140_0()
    end
  end,
}
MovementSection:[r146_0](r146_0)
r146_0 = "Section"
r146_0 = {
  Title = "Modes",
}
ModesSection = r121_0:[r146_0](r146_0)
r146_0 = "Toggle"
r146_0 = {
  Title = "No Animations",
  Value = false,
  Callback = function(r0_59)
    -- line: [0, 0] id: 59
    local r3_59 = (r6_0.Character or r6_0.CharacterAdded:Wait()):WaitForChild("Humanoid"):FindFirstChildOfClass("Animator")
    if not r3_59 then
      return 
    end
    if r0_59 then
      r33_0 = true
      for r7_59, r8_59 in ipairs(r3_59:GetPlayingAnimationTracks()) do
        r8_59:Stop(0)
      end
      r34_0 = r3_59.AnimationPlayed:Connect(function(r0_60)
        -- line: [0, 0] id: 60
        if r33_0 then
          task.defer(function()
            -- line: [0, 0] id: 61
            pcall(function()
              -- line: [0, 0] id: 62
              r0_60:Stop(0)
            end)
          end)
        end
      end)
    else
      r33_0 = false
      if r34_0 then
        r34_0:Disconnect()
        r34_0 = nil
      end
    end
  end,
}
local r144_0 = ModesSection:[r146_0](r146_0)
local r147_0 = "Register"
r147_0 = "noAnimationToggle"
r118_0:[r147_0](r147_0, r144_0)
r147_0 = "Toggle"
r147_0 = {
  Title = "Hide Rod On Hand",
  Desc = "This feature irivisible! and hide other player too",
  Value = false,
  Callback = function(r0_181)
    -- line: [0, 0] id: 181
    r35_0 = r0_181
    if r0_181 then
      task.spawn(function()
        -- line: [0, 0] id: 182
        while r35_0 do
          local r0_182 = ipairs
          for r3_182, r4_182 in r0_182(workspace.Characters:GetChildren()) do
            local r5_182 = r4_182:FindFirstChild("!!!EQUIPPED_TOOL!!!")
            if r5_182 then
              r5_182:Destroy()
            end
          end
          task.wait(1)
        end
      end)
    end
  end,
}
ModesSection:[r147_0](r147_0)
ModesSection:Divider()
r147_0 = "Toggle"
r147_0 = {
  Title = "Infinite Jump",
  Value = false,
  Callback = function(r0_202)
    -- line: [0, 0] id: 202
    r52_0 = r0_202
  end,
}
ModesSection:[r147_0](r147_0)
r12_0.JumpRequest:Connect(function()
  -- line: [0, 0] id: 161
  if r52_0 and r6_0.Character and r6_0.Character:FindFirstChild("Humanoid") then
    r6_0.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
  end
end)
r147_0 = "Toggle"
r147_0 = {
  Title = "Noclip",
  Value = false,
  Callback = function(r0_75)
    -- line: [0, 0] id: 75
    r53_0 = r0_75
    if r53_0 then
      r115_0:Notify({
        Title = "Success",
        Content = "Anda mengaktifkan Noclip",
        Duration = 2.5,
        Icon = "laptop-minimal-check",
      })
    end
    local r1_75 = r6_0.Character
    if r1_75 then
      for r5_75, r6_75 in pairs(r1_75:GetDescendants()) do
        if r6_75:IsA("BasePart") then
          r6_75.CanCollide = true
        end
      end
    end
  end,
}
ModesSection:[r147_0](r147_0)
r2_0.Stepped:Connect(function()
  -- line: [0, 0] id: 126
  if r53_0 and r6_0.Character then
    for r3_126, r4_126 in pairs(r6_0.Character:GetDescendants()) do
      if r4_126:IsA("BasePart") and r4_126.CanCollide then
        r4_126.CanCollide = false
      end
    end
  end
end)
function autoPerfection(r0_222)
  -- line: [0, 0] id: 222
  if type(_G.__APRF) == "function" then
    _G.__APRF(r0_222)
  end
end
r145_0 = r18_0.RequestChargeFishingRod
r146_0 = false
function _G.__APRF(r0_42)
  -- line: [0, 0] id: 42
  r146_0 = r0_42
  r16_0.RF_AutoFishing:InvokeServer(r0_42)
  if r0_42 then
    r18_0.RequestChargeFishingRod = function()
      -- line: [0, 0] id: 43
      local r1_43 = nil	-- notice: implicit variable refs by block#[0]
      return r1_43
    end
    print("AutoFishing UI: ON | Auto mechanics: DISABLED ?")
  else
    r18_0.RequestChargeFishingRod = r145_0
    print("AutoFishing UI: OFF | Auto mechanics restored ?")
  end
end
-- close: r145_0
function r145_0(r0_47)
  -- line: [0, 0] id: 47
  if type(_G.__WALKFN) == "function" then
    _G.__WALKFN(r0_47)
  end
end
SetWalkOnWater = r145_0
r145_0 = false
r146_0 = nil
r147_0 = nil
function _G.__WALKFN(r0_136)
  -- line: [0, 0] id: 136
  r145_0 = r0_136
  if r0_136 then
    r146_0 = Instance.new("Part")
    r146_0.Name = "WW_Part"
    r146_0.Size = Vector3.new(20, 1, 20)
    r146_0.Transparency = 1
    r146_0.Anchored = true
    r146_0.CanCollide = true
    r146_0.Parent = Workspace
    r147_0 = r2_0.Heartbeat:Connect(function()
      -- line: [0, 0] id: 137
      if not r145_0 or not r146_0 then
        return 
      end
      local r0_137 = r139_0(r6_0.Character)
      if not r0_137 then
        return 
      end
      r146_0.CFrame = CFrame.new(r0_137.Position.X, -1.8, r0_137.Position.Z)
    end)
  else
    if r147_0 then
      r147_0:Disconnect()
      r147_0 = nil
    end
    if r146_0 then
      r146_0:Destroy()
      r146_0 = nil
    end
  end
end
local r150_0 = "Toggle"
r150_0 = {
  Title = "Walk On Water",
  Value = false,
  Callback = function(r0_46)
    -- line: [0, 0] id: 46
    SetWalkOnWater(r0_46)
  end,
}
ModesSection:[r150_0](r150_0)
-- close: r145_0
r145_0 = 128
r146_0 = nil
r147_0 = ModesSection
local r149_0 = "Toggle"
r149_0 = {
  Title = "Max Zoom 1000",
  Desc = "Increase max camera distance",
  Value = false,
  Callback = function(r0_11)
    -- line: [0, 0] id: 11
    if r146_0 then
      r146_0:Disconnect()
      r146_0 = nil
    end
    if r0_11 then
      r6_0.CameraMaxZoomDistance = 1000
      r6_0.CameraMinZoomDistance = 0.5
      r146_0 = r6_0.CharacterAdded:Connect(function()
        -- line: [0, 0] id: 12
        task.wait(0.3)
        r6_0.CameraMaxZoomDistance = 1000
        r6_0.CameraMinZoomDistance = 0.5
      end)
    else
      r6_0.CameraMaxZoomDistance = r145_0
      r6_0.CameraMinZoomDistance = 0.5
    end
  end,
}
r147_0:[r149_0](r149_0)
r149_0 = "Section"
r149_0 = {
  Title = "Boost Player",
}
r147_0 = r121_0:[r149_0](r149_0)
BoostSection = r147_0
function r147_0(r0_76)
  -- line: [0, 0] id: 76
  r31_0 = r0_76
  local r1_76, r2_76 = pcall(function()
    -- line: [0, 0] id: 77
    return require(r3_0.Controllers:WaitForChild("VFXController"))
  end)
  if r1_76 and r2_76 then
    for r6_76, r7_76 in pairs(r2_76) do
      if typeof(r7_76) == "function" then
        if r0_76 then
          if not r32_0[r6_76] then
            r32_0[r6_76] = r7_76
          end
          r2_76[r6_76] = function()
            -- line: [0, 0] id: 78
          end
        elseif r32_0[r6_76] then
          r2_76[r6_76] = r32_0[r6_76]
        end
      end
    end
    print("[MengXHub] Rod VFX Disabled:", r0_76)
  end
end
r150_0 = "Toggle"
r150_0 = {
  Title = "Disable VFX",
  Value = false,
  Callback = function(r0_19)
    -- line: [0, 0] id: 19
    r147_0(r0_19)
  end,
}
BoostSection:[r150_0](r150_0)
l_LocalPlayer_5 = nil
v979 = nil
v980 = nil
v981, v982 = pcall(function()
  -- line: [0, 0] id: 48
  return require(r3_0.Controllers.CutsceneController)
end)
if v981 and v982 then
  l_LocalPlayer_5 = v982
  v979 = l_LocalPlayer_5.Play
  v980 = l_LocalPlayer_5.Stop
end
local function r148_0()
  -- line: [0, 0] id: 22
  if r16_0.RE_Cutscene then
    r16_0.RE_Cutscene.OnClientEvent:Connect(function(...)
      -- line: [0, 0] id: 23
      warn("[CELESTIAL] Cutscene blocked (ReplicateCutscene)", ...)
    end)
  end
  if r16_0.RE_StopCutscene then
    r16_0.RE_StopCutscene.OnClientEvent:Connect(function()
      -- line: [0, 0] id: 24
      warn("[CELESTIAL] Cutscene blocked (stopCutscene)")
    end)
  end
  if l_LocalPlayer_5 then
    function l_LocalPlayer_5.Play()
      -- line: [0, 0] id: 25
      warn("[CELESTIAL] Cutscene skipped!")
    end
    function l_LocalPlayer_5.Stop()
      -- line: [0, 0] id: 26
      warn("[CELESTIAL] Cutscene stop skipped!")
    end
  end
end
function r149_0()
  -- line: [0, 0] id: 45
  if l_LocalPlayer_5 and v979 and v980 then
    l_LocalPlayer_5.Play = v979
    l_LocalPlayer_5.Stop = v980
    warn("[CELESTIAL] Cutscene restored to default")
  end
end
local r152_0 = "Toggle"
r152_0 = {
  Title = "Disable Cutscene",
  Value = false,
  Callback = function(r0_142)
    -- line: [0, 0] id: 142
    local r1_142 = r0_142
    if r0_142 then
      r148_0()
    else
      r149_0()
    end
  end,
}
r150_0 = BoostSection:[r152_0](r152_0)
local r153_0 = "Register"
r153_0 = "cutsceneToggle"
r118_0:[r153_0](r153_0, r150_0)
r153_0 = "Toggle"
r153_0 = {
  Title = "Disable Obtained Fish",
  Value = false,
  Callback = function(r0_133)
    -- line: [0, 0] id: 133
    local r1_133 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Small Notification")
    if r1_133 and r1_133:FindFirstChild("Display") then
      r1_133.Display.Visible = not r0_133
    end
  end,
}
local r151_0 = BoostSection:[r153_0](r153_0)
local r154_0 = "Register"
r154_0 = "obtainedFishToggle"
r118_0:[r154_0](r154_0, r151_0)
r154_0 = "Section"
r154_0 = {
  Title = "Rendering",
}
RenderSection = r121_0:[r154_0](r154_0)
r154_0 = "Toggle"
r154_0 = {
  Title = "Reduce Map",
  Desc = "Dont turn on this with Disable 3D Render",
  Value = false,
  Callback = function(r0_110)
    -- line: [0, 0] id: 110
    if r0_110 then
      for r4_110, r5_110 in ipairs(workspace:GetDescendants()) do
        if r6_0.Character and r5_110:IsDescendantOf(r6_0.Character) then
          return 
        end
        if r5_110:IsA("BasePart") then
          r5_110.Material = Enum.Material.Plastic
          r5_110.CastShadow = false
          r5_110.Reflectance = 0
        elseif r5_110:IsA("Decal") or r5_110:IsA("Texture") then
          r5_110.Transparency = 1
        elseif r5_110:IsA("ParticleEmitter") or r5_110:IsA("Trail") or r5_110:IsA("Beam") or r5_110:IsA("Smoke") or r5_110:IsA("Fire") or r5_110:IsA("Sparkles") then
          r5_110.Enabled = false
        elseif r5_110:IsA("Highlight") then
          r5_110:Destroy()
        elseif r5_110:IsA("MeshPart") then
          r5_110.MeshId = ""
          r5_110.TextureID = ""
        elseif r5_110:IsA("SpecialMesh") then
          r5_110.MeshId = ""
          r5_110.TextureId = ""
        end
      end
      local r1_110 = game:GetService("Lighting")
      for r5_110, r6_110 in ipairs(r1_110:GetChildren()) do
        if r6_110:IsA("BloomEffect") or r6_110:IsA("DepthOfFieldEffect") or r6_110:IsA("ColorCorrectionEffect") or r6_110:IsA("SunRaysEffect") then
          r6_110.Enabled = false
        end
      end
      r1_110.GlobalShadows = false
      r1_110.FogStart = 9000000000
      r1_110.FogEnd = 9000000000
      r1_110.Brightness = 1
      if workspace:FindFirstChild("Terrain") then
        local r2_110 = workspace.Terrain
        r2_110.WaterWaveSize = 0
        r2_110.WaterWaveSpeed = 0
        r2_110.WaterReflectance = 0
        r2_110.WaterTransparency = 1
      end
    end
  end,
}
RenderSection:[r154_0](r154_0)
r154_0 = "Toggle"
r154_0 = {
  Title = "Disable 3D Rendering",
  Value = false,
  Callback = function(r0_143)
    -- line: [0, 0] id: 143
    r2_0:Set3dRenderingEnabled(not r0_143)
    local r1_143 = r115_0
    local r3_143 = {}
    local r4_143 = nil	-- notice: implicit variable refs by block#[3, 6, 9]
    if r0_143 then
      r4_143 = "Disabled"
      if not r4_143 then
        ::label_12::
        r4_143 = "Enabled"
      end
    else
      goto label_12	-- block#2 is visited secondly
    end
    r3_143.Title = r4_143
    if r0_143 then
      r4_143 = "3D Render Dimatikan"
      if not r4_143 then
        ::label_19::
        r4_143 = "3D Render Diaktifkan"
      end
    else
      goto label_19	-- block#5 is visited secondly
    end
    r3_143.Content = r4_143
    r3_143.Duration = 2.5
    if r0_143 then
      r4_143 = "circle-x"
      if not r4_143 then
        ::label_27::
        r4_143 = "laptop-minimal-check"
      end
    else
      goto label_27	-- block#8 is visited secondly
    end
    r3_143.Icon = r4_143
    r1_143:Notify(r3_143)
  end,
}
RenderSection:[r154_0](r154_0)
ESP_Enabled = false
ESP_Objects = {}
function CreateESP(r0_112)
  -- line: [0, 0] id: 112
  local r1_112 = r0_112.Character
  if not r1_112 then
    return 
  end
  local r2_112 = r1_112:FindFirstChild("Head")
  if not r2_112 then
    return 
  end
  if rawget(ESP_Objects, r0_112) then
    return 
  end
  local r3_112 = Instance.new("BillboardGui")
  r3_112.Name = "ESP_" .. r0_112.Name
  r3_112.Size = UDim2.new(0, 200, 0, 40)
  r3_112.AlwaysOnTop = true
  r3_112.MaxDistance = 3000
  r3_112.Adornee = r2_112
  r3_112.Parent = r2_112
  local r4_112 = Instance.new("TextLabel")
  r4_112.Name = "LBL"
  r4_112.BackgroundTransparency = 1
  r4_112.Size = UDim2.new(1, 0, 1, 0)
  r4_112.Font = Enum.Font.SourceSansBold
  r4_112.TextColor3 = Color3.fromRGB(255, 255, 255)
  r4_112.TextStrokeTransparency = 0.3
  r4_112.TextSize = 14
  r4_112.Text = r0_112.Name
  r4_112.Parent = r3_112
  rawset(ESP_Objects, r0_112, r3_112)
end
function UpdateESP()
  -- line: [0, 0] id: 83
  local r0_83 = r1_0:GetPlayers()
  for r4_83 = 1, #r0_83, 1 do
    local r5_83 = r0_83[r4_83]
    if r5_83 ~= r6_0 then
      CreateESP(r5_83)
      local r6_83 = rawget(ESP_Objects, r5_83)
      if r6_83 then
        local r7_83 = r6_83:FindFirstChild("LBL")
        if r7_83 then
          local r8_83 = r5_83.Character
          local r9_83 = r8_83 and r8_83:FindFirstChild("HumanoidRootPart")
          local r10_83 = r6_0.Character
          local r11_83 = r10_83 and r10_83:FindFirstChild("HumanoidRootPart")
          if r9_83 and r11_83 then
            r7_83.Text = r5_83.Name .. "\n(" .. math.floor((r9_83.Position - r11_83.Position).Magnitude) .. " M)"
          end
        end
      end
    end
  end
end
function EnableESP()
  -- line: [0, 0] id: 158
  if ESP_Enabled then
    return 
  end
  ESP_Enabled = true
  task.spawn(function()
    -- line: [0, 0] id: 159
    while ESP_Enabled do
      UpdateESP()
      task.wait(0.2)
    end
  end)
end
function DisableESP()
  -- line: [0, 0] id: 135
  ESP_Enabled = false
  for r3_135, r4_135 in pairs(ESP_Objects) do
    if r4_135 then
      r4_135:Destroy()
    end
  end
  ESP_Objects = {}
end
r154_0 = "Toggle"
r154_0 = {
  Title = "Player ESP",
  Value = false,
  Callback = function(r0_163)
    -- line: [0, 0] id: 163
    if r0_163 then
      EnableESP()
    else
      DisableESP()
    end
  end,
}
r152_0 = RenderSection:[r154_0](r154_0)
local r155_0 = "Section"
r155_0 = {
  Title = "Identity",
}
HideIdentSection = r121_0:[r155_0](r155_0)
function r153_0()
  -- line: [0, 0] id: 195
  local r2_195 = (r6_0.Character or r6_0.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart"):WaitForChild("Overhead")
  r26_0.Title = r2_195.TitleContainer:WaitForChild("Label")
  r26_0.Header = r2_195.Content:WaitForChild("Header")
  r26_0.Level = r2_195.LevelContainer:WaitForChild("Label")
  r26_0.Grad = r26_0.Title:FindFirstChildOfClass("UIGradient") or Instance.new("UIGradient", r26_0.Title)
  r26_0.Watermark = r2_195:FindFirstChild("MengHubWatermark")
  if not r26_0.Watermark then
    r26_0.Watermark = Instance.new("TextLabel")
    r26_0.Watermark.Name = "MengHubWatermark"
    r26_0.Watermark.Parent = r2_195
    r26_0.Watermark.Text = "[MengHub]"
    r26_0.Watermark.TextColor3 = Color3.fromRGB(255, 105, 180)
    r26_0.Watermark.TextScaled = true
    r26_0.Watermark.TextSize = 30
    r26_0.Watermark.Font = Enum.Font.SourceSansBold
    r26_0.Watermark.BackgroundTransparency = 1
    r26_0.Watermark.Size = UDim2.new(1, 0, 0.25, 0)
    r26_0.Watermark.Position = UDim2.new(0, 0, 0, 0)
    r26_0.Watermark.ZIndex = 3
    r26_0.Watermark.Visible = false
  end
  r27_0.Title = r26_0.Title.Text
  r27_0.Header = r26_0.Header.Text
  r27_0.Level = r26_0.Level.Text
  r27_0.Grad = r26_0.Grad.Color
  r27_0.Rotation = r26_0.Grad.Rotation
  r27_0.WatermarkVisible = r26_0.Watermark.Visible
end
function r154_0()
  -- line: [0, 0] id: 123
  if not r26_0.Title then
    return 
  end
  r26_0.Title.Text = "Meng Hub"
  r26_0.Header.Text = r27_0.NewHeader or r27_0.Header
  r26_0.Level.Text = r27_0.NewLevel or r27_0.Level
  r26_0.Grad.Color = ColorSequence.new({
    ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 85, 255)),
    ColorSequenceKeypoint.new(0.5, Color3.fromRGB(136, 200, 255)),
    ColorSequenceKeypoint.new(1, Color3.fromRGB(136, 243, 255))
  })
  r26_0.Grad.Rotation = 0
  if r26_0.Watermark then
    r26_0.Watermark.Visible = true
  end
end
function r155_0()
  -- line: [0, 0] id: 172
  if not r26_0.Title then
    return 
  end
  r26_0.Title.Text = r27_0.Title
  r26_0.Header.Text = r27_0.Header
  r26_0.Level.Text = r27_0.Level
  r26_0.Grad.Color = r27_0.Grad
  r26_0.Grad.Rotation = r27_0.Rotation
  if r26_0.Watermark then
    r26_0.Watermark.Visible = false
  end
end
local function r156_0()
  -- line: [0, 0] id: 124
  if r28_0 then
    task.cancel(r28_0)
  end
  r28_0 = task.spawn(function()
    -- line: [0, 0] id: 125
    -- notice: unreachable block#1
    while true do
      r154_0()
      task.wait(1)
    end
    goto label_7	-- block#1 is visited secondly
  end)
end
local function r157_0()
  -- line: [0, 0] id: 225
  if r28_0 then
    task.cancel(r28_0)
  end
  r28_0 = nil
end
r153_0()
local r160_0 = "Input"
r160_0 = {
  Title = "Name Changer",
  Value = "",
  Placeholder = "Meng Hub",
  Callback = function(r0_72)
    -- line: [0, 0] id: 72
    r27_0.NewHeader = r0_72
  end,
}
local r158_0 = HideIdentSection:[r160_0](r160_0)
local r161_0 = "Register"
r161_0 = "nameChangerInput"
r118_0:[r161_0](r161_0, r158_0)
r161_0 = "Input"
r161_0 = {
  Title = "Level Changer",
  Value = "",
  Placeholder = "Lvl: ",
  Callback = function(r0_2)
    -- line: [0, 0] id: 2
    r27_0.NewLevel = r0_2
  end,
}
local r159_0 = HideIdentSection:[r161_0](r161_0)
local r162_0 = "Register"
r162_0 = "levelChangerInput"
r118_0:[r162_0](r162_0, r159_0)
r162_0 = "Toggle"
r162_0 = {
  Title = "Start Hide Identity",
  Value = false,
  Callback = function(r0_94)
    -- line: [0, 0] id: 94
    r27_0.ToggleState = r0_94
    if r0_94 then
      r154_0()
      r156_0()
    else
      r157_0()
      r155_0()
    end
  end,
}
r160_0 = HideIdentSection:[r162_0](r162_0)
local r163_0 = "Register"
r163_0 = "startIdentityToggle"
r118_0:[r163_0](r163_0, r160_0)
r6_0.CharacterAdded:Connect(function()
  -- line: [0, 0] id: 109
  task.wait(0.1)
  r153_0()
  if r27_0.ToggleState then
    r154_0()
    r156_0()
  end
end)
r163_0 = "Button"
r163_0 = {
  Title = "Reset Character In Place",
  Callback = function()
    -- line: [0, 0] id: 167
    local r0_167 = r6_0.Character
    if not r0_167 then
      return 
    end
    local r1_167 = r0_167:FindFirstChild("HumanoidRootPart")
    if not r1_167 then
      return 
    end
    local r2_167 = r1_167.CFrame
    r0_167:BreakJoints()
    r6_0.CharacterAdded:Wait()
    task.wait(0.2)
    r6_0.Character:WaitForChild("HumanoidRootPart").CFrame = r2_167
    r115_0:Notify({
      Title = "Success",
      Content = "Character berhasil direset di lokasi yang sama!",
      Duration = 2.5,
      Icon = "laptop-minimal-check",
    })
  end,
}
HideIdentSection:[r163_0](r163_0)
r163_0 = "Section"
r163_0 = {
  Title = "Auto Fishing",
}
r122_0:[r163_0](r163_0)
r163_0 = "Input"
r163_0 = {
  Title = "Legit Delay",
  Desc = "Delay complete fishing!",
  Value = "",
  Placeholder = "Default: 0.2",
  Callback = function(r0_8)
    -- line: [0, 0] id: 8
    local r1_8 = tonumber(r0_8)
    if r1_8 and 0 < r1_8 then
      r37_0 = r1_8
      task.spawn(function()
        -- line: [0, 0] id: 9
        -- notice: unreachable block#13
        print("Started")
        while true do
          if r18_0 then
            local r0_9 = r18_0._autoLoop
            if r0_9 then
              r0_9 = r18_0
              if r0_9:GetCurrentGUID() then
                print("Waiting", r37_0)
                task.wait(r37_0)
                while true do
                  local r1_9, r2_9 = pcall(function()
                    -- line: [0, 0] id: 10
                    r16_0.RE_Fishing:FireServer()
                  end)
                  if r1_9 then
                    print("Successfully")
                  else
                    warn("Failed to fire RE_Fishing", r2_9)
                  end
                  task.wait(0.05)
                  if r0_9:GetCurrentGUID() and r0_9._autoLoop then
                    goto label_45	-- block#9 is visited secondly
                  else
                    break
                  end
                end
                print("Loop ended")
              end
            end
          end
          task.wait(0.05)
        end
      end)
    else
      warn("Invalid fishing delay input")
    end
  end,
}
r161_0 = r122_0:[r163_0](r163_0)
local r164_0 = "Register"
r164_0 = "legitInput"
r118_0:[r164_0](r164_0, r161_0)
r164_0 = "Input"
r164_0 = {
  Title = "Shake Delay",
  Value = "",
  Placeholder = "Default: 0.15",
  Callback = function(r0_219)
    -- line: [0, 0] id: 219
    local r1_219 = tonumber(r0_219)
    if r1_219 and 0 < r1_219 then
      r48_0 = r1_219
    end
  end,
}
r162_0 = r122_0:[r164_0](r164_0)
local r165_0 = "Register"
r165_0 = "shakeInput"
r118_0:[r165_0](r165_0, r162_0)
userId = tostring(r6_0.UserId)
r163_0 = nil
local r164_0, r165_0 = pcall(function()
  -- line: [0, 0] id: 165
  return workspace:FindFirstChild("CosmeticFolder")
end)
if r164_0 and r165_0 then
  r163_0 = r165_0
end
local function r166_0()
  -- line: [0, 0] id: 228
  local r0_228 = r9_0
  local r1_228 = r8_0
  local r2_228 = r10_0
  local r3_228 = game:GetService("Players").LocalPlayer
  local r4_228 = Vector2.new(r1_228.ViewportSize.X / 2, r1_228.ViewportSize.Y / 2)
  local r5_228 = nil
  while r18_0._autoLoop do
    local r6_228 = r18_0:GetCurrentGUID()
    if r6_228 then
      task.wait(0.05)
    else
      r2_228:SendMouseButtonEvent(r4_228.X, r4_228.Y, 0, true, game, 1)
      task.wait(0.05)
      r6_228 = r0_228:WaitForChild("Charge")
      r6_228 = r6_228:WaitForChild("Main")
      r6_228 = r6_228:WaitForChild("CanvasGroup")
      r6_228 = r6_228:WaitForChild("Bar")
      local r7_228 = tick()
      while r6_228:IsDescendantOf(r0_228) do
        local r8_228 = r6_228.Size.Y.Scale
        if r8_228 < 0.95 then
          task.wait(0.001)
          r8_228 = tick() - r7_228
          if r8_228 > 1 then
            goto label_77	-- block#8 is visited secondly
          end
        else
          break
        end
      end
      r2_228:SendMouseButtonEvent(r4_228.X, r4_228.Y, 0, false, game, 1)
      local r8_228 = tick()
      local r9_228 = false
      while tick() - r8_228 < 3 do
        local r10_228 = r18_0:GetCurrentGUID()
        if r10_228 and r10_228 ~= r5_228 then
          r9_228 = true
          break
        else
          task.wait(0.05)
        end
      end
      if r9_228 then
        local r10_228 = r3_228.leaderstats
        if r10_228 then
          r10_228 = r3_228.leaderstats.Caught.Value or 0
        else
          goto label_119	-- block#19 is visited secondly
        end
        local r11_228 = tick()
        while tick() - r11_228 < 8 do
          local r12_228 = r3_228.leaderstats
          if r12_228 then
            r12_228 = r3_228.leaderstats.Caught.Value
            if r12_228 <= r10_228 then
              ::label_135::
              r12_228 = r18_0:GetCurrentGUID()
              if r12_228 then
                task.wait(0.1)
              else
                break
              end
            else
              break
            end
          else
            goto label_135	-- block#24 is visited secondly
          end
        end
        while r18_0:GetCurrentGUID() do
          task.wait(0.05)
        end
        task.wait(1.3)
      end
    end
    task.wait(0.05)
  end
end
local r169_0 = "Toggle"
r169_0 = {
  Title = "Legit Fishing",
  Value = false,
  Callback = function(r0_189)
    -- line: [0, 0] id: 189
    local r1_189 = r18_0
    local r2_189 = r163_0
    local r3_189 = userId
    local r4_189 = r0_189
    r1_189._autoLoop = r0_189
    if r0_189 then
      task.spawn(function()
        -- line: [0, 0] id: 190
        -- notice: unreachable block#15
        local r0_190 = false
        while r4_189 do
          local r1_190 = r1_189._autoLoop
          if r1_190 then
            r1_190 = r2_189:FindFirstChild(r3_189)
            if not r1_190 then
              while true do
                r166_0()
                task.wait(0.1)
                r1_190 = r2_189:FindFirstChild(r3_189)
                if r1_190 then
                  r1_190 = r1_189._autoLoop
                  if r1_190 then
                    break
                  end
                end
              end
            end
            while true do
              r1_190 = r2_189:FindFirstChild(r3_189)
              if r1_190 then
                r1_190 = r1_189._autoLoop
                if r1_190 then
                  r1_190 = r1_189:GetCurrentGUID()
                  if r1_190 then
                    r1_190 = tick()
                    while r1_189:GetCurrentGUID() do
                      local r2_190 = r1_189._autoLoop
                      if r2_190 then
                        pcall(function()
                          -- line: [0, 0] id: 191
                          r1_189:RequestFishingMinigameClick()
                        end)
                        r2_190 = tick() - r1_190
                        if r37_0 <= r2_190 then
                          task.wait(r37_0)
                          pcall(function()
                            -- line: [0, 0] id: 192
                            r16_0.RE_Fishing:FireServer()
                          end)
                          task.wait(0.05)
                          r2_190 = r1_189:GetCurrentGUID()
                          if r2_190 then
                            r2_190 = r1_189._autoLoop
                            r0_190 = not r2_190
                          else
                            r0_190 = true
                          end
                          if not r0_190 then
                            ::label_91::
                            task.wait()
                          end
                        else
                          goto label_91	-- block#18 is visited secondly
                        end
                        if r0_190 then
                          break
                        end
                      else
                        break
                      end
                    end
                  end
                  r0_190 = false
                  task.wait(0.2)
                else
                  break
                end
              else
                break
              end
            end
            repeat
              task.wait(0.1)
              r1_190 = r2_189
              r1_190 = r1_190:FindFirstChild(r3_189 or not r1_189._autoLoop)
            until not r1_190
            r1_190 = r1_189._autoLoop
            if r1_190 then
              task.wait(0.2)
              r166_0()
            end
            task.wait(0.2)
          else
            break
          end
        end
      end)
    else
      r1_189._autoLoop = false
      if r1_189._oldGetPower then
        r1_189._getPower = r1_189._oldGetPower
        r1_189._oldGetPower = nil
      end
    end
  end,
}
local r167_0 = r122_0:[r169_0](r169_0)
local r170_0 = "Register"
r170_0 = "LegitFishingToggle"
r118_0:[r170_0](r170_0, r167_0)
r170_0 = "Toggle"
r170_0 = {
  Title = "Auto Shake",
  Desc = "Spam click during fishing (only legit)",
  Value = false,
  Callback = function(r0_31)
    -- line: [0, 0] id: 31
    AutoShake = r0_31
    local r1_31 = game.Players.LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("!!! Click Effect")
    if r1_31 then
      r1_31.Enabled = not r0_31
    end
    if r0_31 then
      task.spawn(function()
        -- line: [0, 0] id: 32
        while AutoShake do
          pcall(function()
            -- line: [0, 0] id: 33
            r18_0:RequestFishingMinigameClick()
          end)
          task.wait(r48_0)
        end
      end)
    end
  end,
}
local r168_0 = r122_0:[r170_0](r170_0)
local r171_0 = "Register"
r171_0 = "autoShakeToggle"
r118_0:[r171_0](r171_0, r168_0)
r171_0 = "Section"
r171_0 = {
  Title = "Instant Fishing",
}
r122_0:[r171_0](r171_0)
r171_0 = "Paragraph"
r171_0 = {
  Title = "Instant Fishing Settings",
  Desc = "For instant fishing, you must first set the completion delay. The default is 0.1.",
  Color = "Green",
  Image = "rbxassetid://103247953194129",
  ImageSize = 30,
}
r122_0:[r171_0](r171_0)
r171_0 = "Input"
r171_0 = {
  Title = "Delay Complete",
  Value = "",
  Placeholder = "Default: 0.1",
  Callback = function(r0_196)
    -- line: [0, 0] id: 196
    local r1_196 = tonumber(r0_196)
    if r1_196 and 0 < r1_196 then
      r43_0 = r1_196
      print("?? Instant Fishing Delay diatur ke: " .. r43_0 .. "s")
    end
  end,
}
r169_0 = r122_0:[r171_0](r171_0)
local r172_0 = "Register"
r172_0 = "instantDelayCompleteValue"
r118_0:[r172_0](r172_0, r169_0)
r172_0 = "Toggle"
r172_0 = {
  Title = "Instant Fishing",
  Desc = "Auto instantly catch fish",
  Value = false,
  Callback = function(r0_84)
    -- line: [0, 0] id: 84
    r41_0 = r0_84
    autoPerfection(r0_84)
    if r0_84 then
      r44_0 = r47_0()
      task.spawn(function()
        -- line: [0, 0] id: 85
        while r41_0 do
          local r0_85 = r42_0
          if r0_85 then
            r42_0 = false
            local r0_85, r1_85, r2_85 = pcall(function()
              -- line: [0, 0] id: 87
              return r16_0.RF_Charge:InvokeServer(workspace:GetServerTimeNow())
            end)
            if r0_85 and typeof(r2_85) == "number" then
              task.wait(0.3)
              pcall(function()
                -- line: [0, 0] id: 86
                r16_0.RF_Minigame:InvokeServer(-1, 0.999, r2_85)
              end)
              local r3_85 = tick()
              while true do
                task.wait(0.05)
                if r45_0 then
                  local r4_85 = r45_0.LastShift
                  if not r4_85 then
                    ::label_41::
                    r4_85 = tick() - r3_85
                    if r4_85 > 1 then
                      break
                    end
                  else
                    break
                  end
                else
                  goto label_41	-- block#7 is visited secondly
                end
              end
              task.wait(delayComplete)
              pcall(function()
                -- line: [0, 0] id: 88
                r16_0.RE_Fishing:FireServer()
              end)
              local r4_85 = r47_0()
              local r5_85 = tick()
              while true do
                task.wait(0.05)
                if r4_85 >= r47_0() then
                  local r6_85 = tick() - r5_85
                  if r6_85 > 1 then
                    break
                  end
                else
                  break
                end
              end
            end
            r42_0 = true
            -- close: r0_85
          end
          task.wait(0.05)
        end
      end)
    end
  end,
}
r170_0 = r122_0:[r172_0](r172_0)
local r173_0 = "Register"
r173_0 = "instantToggle"
r118_0:[r173_0](r173_0, r170_0)
if RE_FishingMinigameEvent then
  if r46_0 then
    r46_0:Disconnect()
  end
  r46_0 = RE_FishingMinigameEvent.OnClientEvent:Connect(function(r0_203, r1_203)
    -- line: [0, 0] id: 203
    if r1_203 then
      r45_0 = r1_203
    end
  end)
end
r173_0 = "Toggle"
r173_0 = {
  Title = "Talon Fishing",
  Desc = "Auto In Game Fishing + Auto Shake",
  Value = false,
  Callback = function(r0_207)
    -- line: [0, 0] id: 207
    AutoShake = r0_207
    local r1_207 = r9_0:FindFirstChild("!!! Click Effect")
    r16_0.RF_AutoFishing:InvokeServer(r0_207)
    if r0_207 then
      if r1_207 then
        r1_207.Enabled = false
      end
      task.spawn(function()
        -- line: [0, 0] id: 208
        while AutoShake do
          pcall(function()
            -- line: [0, 0] id: 209
            r18_0:RequestFishingMinigameClick()
          end)
          task.wait(0.15)
        end
      end)
    elseif r1_207 then
      r1_207.Enabled = true
    end
  end,
}
r122_0:[r173_0](r173_0)
r173_0 = "Section"
r173_0 = {
  Title = "Blatant Features",
}
r122_0:[r173_0](r173_0)
r173_0 = "Input"
r173_0 = {
  Title = "Delay Reel",
  Desc = "Reel Timing (e.g. 1.9)",
  Value = "",
  Placeholder = "Default: 1.9",
  Callback = function(r0_95)
    -- line: [0, 0] id: 95
    local r1_95 = tonumber(r0_95)
    if r1_95 and 0 < r1_95 then
      r39_0 = r1_95
    end
  end,
}
r171_0 = r122_0:[r173_0](r173_0)
local r174_0 = "Register"
r174_0 = "blatantReelInput"
r118_0:[r174_0](r174_0, r171_0)
r174_0 = "Input"
r174_0 = {
  Title = "Delay Fishing",
  Desc = "Fishing Timing (e.g. 1.1)",
  Value = "",
  Placeholder = "Default: 1.1",
  Callback = function(r0_160)
    -- line: [0, 0] id: 160
    local r1_160 = tonumber(r0_160)
    if r1_160 and 0 < r1_160 then
      r40_0 = r1_160
    end
  end,
}
r172_0 = r122_0:[r174_0](r174_0)
local r175_0 = "Register"
r175_0 = "blatantFishInput"
r118_0:[r175_0](r175_0, r172_0)
function r173_0()
  -- line: [0, 0] id: 36
  task.spawn(function()
    -- line: [0, 0] id: 37
    pcall(function()
      -- line: [0, 0] id: 41
      r16_0.RF_Cancel:InvokeServer()
    end)
    pcall(function()
      -- line: [0, 0] id: 39
      r16_0.RF_Charge:InvokeServer(workspace:GetServerTimeNow())
    end)
    pcall(function()
      -- line: [0, 0] id: 40
      r16_0.RF_Minigame:InvokeServer(-1, 0.999)
    end)
    task.wait(r40_0)
    pcall(function()
      -- line: [0, 0] id: 38
      r16_0.RE_Fishing:FireServer()
    end)
  end)
end
local r176_0 = "Toggle"
r176_0 = {
  Title = "Blatant Fishing",
  Value = false,
  Callback = function(r0_147)
    -- line: [0, 0] id: 147
    r38_0 = r0_147
    autoPerfection(r0_147)
    if r0_147 then
      task.spawn(function()
        -- line: [0, 0] id: 148
        while r38_0 do
          r173_0()
          task.wait(r39_0)
        end
      end)
    end
  end,
}
r174_0 = r122_0:[r176_0](r176_0)
local r177_0 = "Register"
r177_0 = "blatantToggle"
r118_0:[r177_0](r177_0, r174_0)
r177_0 = "Button"
r177_0 = {
  Title = "Recovery Fishing",
  Callback = function()
    -- line: [0, 0] id: 30
    r16_0.RF_Cancel:InvokeServer()
  end,
}
r122_0:[r177_0](r177_0)
r177_0 = "Section"
r177_0 = {
  Title = "Auto Sell",
}
SellSection = r123_0:[r177_0](r177_0)
r175_0 = SellSection
r177_0 = "Dropdown"
r177_0 = {
  Title = "Select Sell Mode",
  Values = {
    "Delay",
    "Count"
  },
  Value = "Delay",
  Callback = function(r0_200)
    -- line: [0, 0] id: 200
    r61_0 = tostring(r0_200 or r61_0)
  end,
}
r175_0:[r177_0](r177_0)
r177_0 = "Input"
r177_0 = {
  Title = "Sell Value",
  Desc = "Delay = Minute | Count = Fish Count",
  Value = "60",
  Callback = function(r0_120)
    -- line: [0, 0] id: 120
    local r1_120 = tonumber(r0_120) or 1
    if r61_0 == "Delay" then
      r58_0 = r1_120
    else
      r59_0 = r1_120
    end
  end,
}
SellSection:[r177_0](r177_0)
r177_0 = "Toggle"
r177_0 = {
  Title = "Auto Sell All",
  Value = false,
  Callback = function(r0_226)
    -- line: [0, 0] id: 226
    r57_0 = r0_226
    if r0_226 then
      task.spawn(function()
        -- line: [0, 0] id: 227
        while r57_0 do
          local r0_227 = r6_0:WaitForChild("PlayerGui")
          r0_227 = r0_227:WaitForChild("Inventory").Main.Top.Options.Fish.Label:FindFirstChild("BagSize")
          local r1_227 = 0
          local r2_227 = 0
          if r0_227 and r0_227:IsA("TextLabel") then
            local r3_227, r4_227 = (r0_227.Text or ""):match("(%d+)%s*/%s*(%d+)")
            local r5_227 = tonumber(r3_227) or 0
            r2_227 = tonumber(r4_227) or 0
            r1_227 = r5_227
          end
          if r61_0 == "Delay" then
            r16_0.RF_Sell:InvokeServer()
            task.wait(r58_0)
          elseif r61_0 == "Count" then
            if (tonumber(r59_0) or r2_227) <= r1_227 then
              r16_0.RF_Sell:InvokeServer()
              task.wait(0)
            else
              task.wait(0)
            end
          end
        end
      end)
    end
  end,
}
SellSection:[r177_0](r177_0)
r177_0 = "Section"
r177_0 = {
  Title = "Auto Buy Weather",
}
WeatherSection = r123_0:[r177_0](r177_0)
r175_0 = WeatherSection
r177_0 = "Dropdown"
r177_0 = {
  Title = "Select Weather",
  Desc = "",
  Values = {
    "Cloudy ($10,000)",
    "Wind ($10,000)",
    "Snow ($15,000)",
    "Storm ($35,000)",
    "Radiant ($50,000)",
    "Shark Hunt ($300,000)"
  },
  Multi = true,
  AllowNone = true,
  Callback = function(r0_229)
    -- line: [0, 0] id: 229
    r64_0 = {}
    if type(r0_229) == "table" then
      for r4_229, r5_229 in ipairs(r0_229) do
        table.insert(r64_0, r5_229:match("^(.-) %(") or r5_229)
      end
    end
  end,
}
r175_0 = r175_0:[r177_0](r177_0)
local r178_0 = "Register"
r178_0 = "weatherDropdown"
r118_0:[r178_0](r178_0, r175_0)
r178_0 = "Toggle"
r178_0 = {
  Title = "Auto Buy Weather",
  Value = false,
  Callback = function(r0_53)
    -- line: [0, 0] id: 53
    r65_0 = r0_53
    if not r16_0.RF_Weather then
      return 
    end
    if r0_53 then
      task.spawn(function()
        -- line: [0, 0] id: 54
        while r65_0 do
          local r0_54 = r64_0
          if #r0_54 > 0 then
            local r1_54 = {}
            local r2_54 = workspace:FindFirstChild("Weather")
            if r2_54 then
              for r6_54, r7_54 in ipairs(r2_54:GetChildren()) do
                table.insert(r1_54, string.lower(r7_54.Name))
              end
            end
            for r6_54, r7_54 in ipairs(r0_54) do
              if not table.find(r1_54, string.lower(r7_54)) then
                pcall(function()
                  -- line: [0, 0] id: 55
                  r16_0.RF_Weather:InvokeServer(r7_54)
                end)
                task.wait(0.1)
              end
              -- close: r6_54
            end
          end
          task.wait(0.1)
        end
      end)
    end
  end,
}
r176_0 = WeatherSection:[r178_0](r178_0)
local r179_0 = "Register"
r179_0 = "weatherToggle"
r118_0:[r179_0](r179_0, r176_0)
r179_0 = "Section"
r179_0 = {
  Title = "Event Features",
}
EventSection = r123_0:[r179_0](r179_0)
r177_0 = EventSection
r179_0 = "Dropdown"
r179_0 = {
  Title = "Select Event",
  Values = r108_0() or {},
  Callback = function(r0_140)
    -- line: [0, 0] id: 140
    r100_0 = r0_140
  end,
}
r177_0:[r179_0](r179_0)
r179_0 = "Toggle"
r179_0 = {
  Title = "Auto Event",
  Value = false,
  Callback = function(r0_141)
    -- line: [0, 0] id: 141
    r99_0 = r0_141
    SetWalkOnWater(r0_141)
    if r0_141 and r100_0 then
      r102_0 = r102_0 and r104_0(r6_0.Character).CFrame
      task.spawn(EventLoop)
    else
      if r102_0 then
        r6_0.Character:PivotTo(r102_0)
        r115_0:Notify({
          Title = "Auto Event Off",
          Duration = 2.5,
        })
      end
      r101_0 = nil
      r102_0 = nil
    end
  end,
}
EventSection:[r179_0](r179_0)
EventSection:Divider()
r179_0 = "Paragraph"
r179_0 = {
  Title = "Ancient Lochness Monster Countdown",
  Desc = "<font color=\'#FF4D4D\'><b>waiting for ... for joined event!</b></font>",
}
countdownParagraph = EventSection:[r179_0](r179_0)
r27_0.FarmPosition = r27_0.FarmPosition or nil
r27_0.autoCountdownUpdate = false
r179_0 = "Toggle"
r179_0 = {
  Title = "Auto Admin Event",
  Value = false,
  Callback = function(r0_98)
    -- line: [0, 0] id: 98
    r27_0.autoCountdownUpdate = r0_98
    function getLabel()
      -- line: [0, 0] id: 99
      local r0_99, r1_99 = pcall(function()
        -- line: [0, 0] id: 100
        return workspace["!!! MENU RINGS"]["Event Tracker"].Main.Gui.Content.Items.Countdown.Label
      end)
      local r2_99 = nil	-- notice: implicit variable refs by block#[3]
      if r0_99 then
        r2_99 = r1_99
        if r2_99 then
          ::label_7::
          r2_99 = nil
        end
      else
        goto label_7	-- block#2 is visited secondly
      end
      return r2_99
    end
    function toEvent(r0_104)
      -- line: [0, 0] id: 104
      r0_104.CFrame = CFrame.new(Vector3.new(6063, -586, 4715))
    end
    function backEvent(r0_101)
      -- line: [0, 0] id: 101
      if r27_0.FarmPosition then
        r0_101.CFrame = r27_0.FarmPosition
        countdownParagraph:SetDesc("<font color=\'#00FF99\'><b> Returned to saved farm position!</b></font>")
      else
        countdownParagraph:SetDesc("<font color=\'#FF4D4D\'><b> No saved farm position found!</b></font>")
      end
    end
    local r3_98 = nil	-- notice: implicit variable refs by block#[10, 11]
    if r0_98 then
      local r1_98 = (r6_0.Character or r6_0.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5)
      if r1_98 then
        r27_0.FarmPosition = r1_98.CFrame
        countdownParagraph:SetDesc(string.format("<font color=\'#00ff99\'><b>Farm position saved!</b></font>"))
      end
      local r2_98 = getLabel()
      if not r2_98 then
        countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Label not found!</b></font>")
        return 
      end
      r3_98 = r2_98
      task.spawn(function()
        -- line: [0, 0] id: 102
        local r0_102 = false
        while r27_0.autoCountdownUpdate do
          task.wait(1)
          local r1_102 = ""
          local r2_102 = r1_102
          pcall(function()
            -- line: [0, 0] id: 103
            r2_102 = r3_98.Text or ""
          end)
          if r2_102 == "" then
            countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Waiting for countdown...</b></font>")
          else
            countdownParagraph:SetDesc(string.format("<font color=\'#4AFFE7\'><b>Timer: %s</b></font>", r2_102))
            local r3_102 = (r6_0.Character or r6_0.CharacterAdded:Wait()):WaitForChild("HumanoidRootPart", 5)
            if not r3_102 then
              countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>⚠️ HRP not found, retrying...</b></font>")
            else
              local r4_102, r5_102, r6_102 = r2_102:match("(%d+)H%s*(%d+)M%s*(%d+)S")
              local r7_102 = tonumber(r4_102)
              local r8_102 = tonumber(r5_102)
              r6_102 = tonumber(r6_102)
              r5_102 = r8_102
              r4_102 = r7_102
              if r4_102 == 3 and r5_102 == 59 and r6_102 == 59 and not r0_102 then
                countdownParagraph:SetDesc("<font color=\'#00ff99\'><b>Event started! Teleporting...</b></font>")
                toEvent(r3_102)
                r0_102 = true
              elseif r4_102 == 3 and r5_102 == 49 and r6_102 == 59 and r0_102 then
                countdownParagraph:SetDesc("<font color=\'#ffaa00\'><b>Event ended! Returning...</b></font>")
                backEvent(r3_102)
                r0_102 = false
              end
            end
          end
          if not r3_98 or not r3_98.Parent then
            r3_98 = getLabel()
            if not r3_98 then
              countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Label lost. Reconnecting...</b></font>")
              task.wait(2)
              r3_98 = getLabel()
            end
          end
          -- close: r2_102
        end
      end)
      -- close: r3_98
    else
      local r1_98 = r6_0.Character or r6_0.CharacterAdded:Wait()
      r3_98 = "HumanoidRootPart"
      r1_98 = r1_98:WaitForChild(r3_98, 5)
      if r1_98 then
        r3_98 = r1_98
        backEvent(r3_98)
      end
      countdownParagraph:SetDesc("<font color=\'#ff4d4d\'><b>Auto Admin Event disabled.</b></font>")
    end
  end,
}
EventSection:[r179_0](r179_0)
r179_0 = "Section"
r179_0 = {
  Title = "Favorite Features",
}
FavoriteSection = r123_0:[r179_0](r179_0)
r177_0 = FavoriteSection
r179_0 = "Dropdown"
r179_0 = {
  Title = "Name",
  Desc = "Favorite By Name Fish (Recommended)",
  Values = {
    "No Fish Found"
  },
  Multi = true,
  AllowNone = true,
  Callback = function(r0_52)
    -- line: [0, 0] id: 52
    r113_0.name = toSet(r0_52)
  end,
}
r177_0 = r177_0:[r179_0](r179_0)
local r180_0 = "Button"
r180_0 = {
  Title = "Refresh Fish",
  Callback = function()
    -- line: [0, 0] id: 171
    r177_0:Refresh(r96_0)
  end,
}
FavoriteSection:[r180_0](r180_0)
r178_0 = FavoriteSection
r180_0 = "Dropdown"
r180_0 = {
  Title = "Rarity",
  Desc = "Favorite By Rarity (Optional)",
  Values = {
    "Common",
    "Uncommon",
    "Rare",
    "Epic",
    "Legendary",
    "Mythic",
    "Secret"
  },
  Multi = true,
  AllowNone = true,
  Callback = function(r0_64)
    -- line: [0, 0] id: 64
    r113_0.rarity = toSet(r0_64)
  end,
}
r178_0:[r180_0](r180_0)
r180_0 = "Dropdown"
r180_0 = {
  Title = "Variant",
  Desc = "Favorite By Variant (Only works with Name)",
  Values = r112_0,
  Multi = true,
  AllowNone = true,
  Callback = function(r0_128)
    -- line: [0, 0] id: 128
    if next(r113_0.name) ~= nil then
      r113_0.variant = toSet(r0_128)
    else
      r113_0.variant = {}
      warn("Pilih Name Dulu Sebelum Variant!")
    end
  end,
}
FavoriteSection:[r180_0](r180_0)
r180_0 = "Toggle"
r180_0 = {
  Title = "Auto Favorite",
  Value = false,
  Callback = function(r0_73)
    -- line: [0, 0] id: 73
    r113_0.auto = r0_73
    if r0_73 then
      scanInventory()
      r23_0:OnChange({
        "Inventory",
        "Items"
      }, scanInventory)
    end
  end,
}
FavoriteSection:[r180_0](r180_0)
r180_0 = "Button"
r180_0 = {
  Title = "Unfavorite All",
  Callback = function()
    -- line: [0, 0] id: 221
    for r3_221, r4_221 in ipairs(r23_0:GetExpect({
      "Inventory",
      "Items"
    })) do
      local r5_221 = rawget(r114_0, r4_221.UUID)
      if r5_221 == nil then
        r5_221 = r4_221.Favorited
      end
      if r5_221 then
        r16_0.RE_Favorite:FireServer(r4_221.UUID)
        rawset(r114_0, r4_221.UUID, false)
      end
    end
  end,
}
FavoriteSection:[r180_0](r180_0)
function SavePosition(r0_34)
  -- line: [0, 0] id: 34
  writefile("Meng Hub/FishIt" .. "/Position.json", r4_0:JSONEncode({
    r0_34:GetComponents()
  }))
end
function LoadPosition()
  -- line: [0, 0] id: 96
  if isfile("Meng Hub/FishIt" .. "/Position.json") then
    local r0_96, r1_96 = pcall(function()
      -- line: [0, 0] id: 97
      return r4_0:JSONDecode(readfile("Meng Hub/FishIt" .. "/Position.json"))
    end)
    if r0_96 and typeof(r1_96) == "table" then
      return CFrame.new(unpack(r1_96))
    end
  end
  return nil
end
function TeleportLastPos(r0_79)
  -- line: [0, 0] id: 79
  task.spawn(function()
    -- line: [0, 0] id: 80
    local r0_80 = r6_0.Character:WaitForChild("HumanoidRootPart")
    local r1_80 = LoadPosition()
    if r1_80 then
      task.wait(2)
      r0_80.CFrame = r1_80
      r115_0:Notify({
        Title = "Teleported to your last position...",
      })
    end
  end)
end
r6_0.CharacterAdded:Connect(TeleportLastPos)
if r6_0.Character then
  TeleportLastPos(r6_0.Character)
end
r180_0 = "Section"
r180_0 = {
  Title = "Save Position Features",
}
SPSection = r123_0:[r180_0](r180_0)
r180_0 = "Paragraph"
r180_0 = {
  Title = "Guide Teleport",
  Desc = "\r\n<b><font color=\"rgb(0,162,255)\">AUTO TELEPORT?</font></b>\r\nClick <b><font color=\"rgb(0,162,255)\">Save Position</font></b> to save your current position!\r\n\r\n<b><font color=\"rgb(0,162,255)\">HOW TO LOAD?</font></b>\r\nThis feature will auto-sync your last position when executed, so you will teleport automatically!\r\n\r\n<b><font color=\"rgb(0,162,255)\">HOW TO RESET?</font></b>\r\nClick <b><font color=\"rgb(0,162,255)\">Reset Position</font></b> to clear your saved position.\r\n    ",
}
SPSection:[r180_0](r180_0)
r180_0 = "Button"
r180_0 = {
  Title = "Save Position",
  Callback = function()
    -- line: [0, 0] id: 134
    local r0_134 = r6_0.Character and r6_0.Character:FindFirstChild("HumanoidRootPart")
    if r0_134 then
      SavePosition(r0_134.CFrame)
      r115_0:Notify({
        Title = "Position saved successfully!",
      })
    end
  end,
}
SPSection:[r180_0](r180_0)
r180_0 = "Button"
r180_0 = {
  Title = "Reset Position",
  Callback = function()
    -- line: [0, 0] id: 220
    if isfile("Meng Hub/FishIt" .. "/Position.json") then
      delfile("Meng Hub/FishIt" .. "/Position.json")
    end
    r115_0:Notify({
      Title = "Last position has been reset!",
    })
  end,
}
SPSection:[r180_0](r180_0)
r180_0 = "Section"
r180_0 = {
  Title = "Enchant Features",
}
EnchantSection = r123_0:[r180_0](r180_0)
function r178_0(r0_194)
  -- line: [0, 0] id: 194
  local r1_194 = false
  local r2_194 = "None"
  local r3_194 = "None"
  local r4_194 = 0
  local r5_194 = {}
  local r6_194 = r23_0:Get("EquippedItems") or {}
  local r7_194 = r23_0:Get({
    "Inventory",
    "Fishing Rods"
  }) or {}
  for r11_194, r12_194 in pairs(r6_194) do
    for r16_194, r17_194 in ipairs(r7_194) do
      if r17_194.UUID == r12_194 then
        local r18_194 = r20_0:GetItemData(r17_194.Id)
        if r18_194 then
          r2_194 = r18_194.Data.Name or r17_194.ItemName or "None"
        else
          goto label_43	-- block#9 is visited secondly
        end
        if r17_194.Metadata and r17_194.Metadata.EnchantId then
          local r19_194 = r20_0:GetEnchantData(r17_194.Metadata.EnchantId)
          if r19_194 then
            local r20_194 = r19_194.Data.Name
            if r20_194 then
              r3_194 = r20_194
              r1_194 = true
            end
          end
          if not r1_194 then
            r3_194 = "None"
          end
        end
      end
      r1_194 = false
    end
  end
  for r11_194, r12_194 in pairs(r23_0:GetExpect({
    "Inventory",
    "Items"
  })) do
    local r13_194 = r20_0:GetItemData(r12_194.Id)
    if r13_194 and r13_194.Data.Type == "Enchant Stones" and r12_194.Id == r0_194 then
      r4_194 = r4_194 + 1
      table.insert(r5_194, r12_194.UUID)
    end
  end
  return r2_194, r3_194, r4_194, r5_194
end
local r181_0 = "Paragraph"
r181_0 = {
  Title = "Enchant Status",
  Desc = "Current Rod : None\nCurrent Enchant : None\nEnchant Stones Left : 0",
}
r179_0 = EnchantSection:[r181_0](r181_0)
local r182_0 = "Button"
r182_0 = {
  Title = "Click Enchant",
  Callback = function()
    -- line: [0, 0] id: 81
    task.spawn(function()
      -- line: [0, 0] id: 82
      local r0_82, r1_82, r2_82, r3_82 = r178_0(10)
      if r0_82 == "None" or r2_82 <= 0 then
        r179_0:SetDesc(("Current Rod : <font color=\'rgb(0,170,255)\'>%s</font>\nCurrent Enchant : <font color=\'rgb(0,170,255)\'>%s</font>\nEnchant Stones Left : <font color=\'rgb(0,170,255)\'>%d</font>"):format(r0_82, r1_82, r2_82))
        return 
      end
      local r4_82 = nil
      local r5_82 = tick()
      while tick() - r5_82 < 5 do
        local r6_82 = pairs
        for r11_82, r12_82 in r6_82(r23_0:Get("EquippedItems") or {}) do
          if r12_82 == r3_82[1] then
            r4_82 = r11_82
          end
        end
        if not r4_82 then
          r16_0.RE_EquipItem:FireServer(r3_82[1], "Enchant Stones")
          task.wait(0.3)
        else
          break
        end
      end
      if not r4_82 then
        return 
      end
      r16_0.RE_Equip:FireServer(r4_82)
      task.wait(0.2)
      r16_0.RE_Altar:FireServer()
      task.wait(1.5)
      local r6_82, r7_82 = r178_0(10)
      r179_0:SetDesc(("Current Rod : <font color=\'rgb(0,170,255)\'>%s</font>\nCurrent Enchant : <font color=\'rgb(0,170,255)\'>%s</font>\nEnchant Stones Left : <font color=\'rgb(0,170,255)\'>%d</font>"):format(r0_82, r7_82, r2_82 - 1))
    end)
  end,
}
EnchantSection:[r182_0](r182_0)
r182_0 = "Button"
r182_0 = {
  Title = "Teleport Enchant Altar",
  Callback = function()
    -- line: [0, 0] id: 21
    local r0_21 = r6_0.Character or r6_0.CharacterAdded:Wait()
    local r1_21 = r0_21:FindFirstChild("HumanoidRootPart")
    local r2_21 = r0_21:FindFirstChildOfClass("Humanoid")
    if r1_21 and r2_21 then
      r1_21.CFrame = CFrame.new(Vector3.new(3258, -1301, 1391))
      r2_21:ChangeState(Enum.HumanoidStateType.Physics)
      task.wait(0.1)
      r2_21:ChangeState(Enum.HumanoidStateType.Running)
    end
  end,
}
EnchantSection:[r182_0](r182_0)
EnchantSection:Divider()
r182_0 = "Button"
r182_0 = {
  Title = "Click Double Enchant",
  Desc = "Starting Double Enchanting",
  Callback = function()
    -- line: [0, 0] id: 65
    task.spawn(function()
      -- line: [0, 0] id: 66
      local r0_66, r1_66, r2_66, r3_66 = r178_0(246)
      if r0_66 == "None" or r2_66 <= 0 then
        r179_0:SetDesc(("Current Rod : <font color=\'rgb(0,170,255)\'>%s</font>\nCurrent Enchant : <font color=\'rgb(0,170,255)\'>%s</font>\nEnchant Stones Left : <font color=\'rgb(0,170,255)\'>%d</font>"):format(r0_66, r1_66, r2_66))
        return 
      end
      local r4_66 = nil
      local r5_66 = tick()
      while tick() - r5_66 < 5 do
        local r6_66 = pairs
        for r11_66, r12_66 in r6_66(r23_0:Get("EquippedItems") or {}) do
          if r12_66 == r3_66[1] then
            r4_66 = r11_66
          end
        end
        if not r4_66 then
          r16_0.RE_EquipItem:FireServer(r3_66[1], "Enchant Stones")
          task.wait(0.3)
        else
          break
        end
      end
      if not r4_66 then
        return 
      end
      r16_0.RE_Equip:FireServer(r4_66)
      task.wait(0.2)
      r16_0.RE_Altar2:FireServer()
      task.wait(1.5)
      local r6_66, r7_66 = r178_0(246)
      r179_0:SetDesc(("Current Rod : <font color=\'rgb(0,170,255)\'>%s</font>\nCurrent Enchant : <font color=\'rgb(0,170,255)\'>%s</font>\nEnchant Stones Left : <font color=\'rgb(0,170,255)\'>%d</font>"):format(r0_66, r7_66, r2_66 - 1))
    end)
  end,
}
EnchantSection:[r182_0](r182_0)
r182_0 = "Button"
r182_0 = {
  Title = "Teleport Second Enchant Altar",
  Callback = function()
    -- line: [0, 0] id: 127
    local r0_127 = r6_0.Character or r6_0.CharacterAdded:Wait()
    local r1_127 = r0_127:FindFirstChild("HumanoidRootPart")
    local r2_127 = r0_127:FindFirstChildOfClass("Humanoid")
    if r1_127 and r2_127 then
      r1_127.CFrame = CFrame.new(Vector3.new(1480, 128, -593))
      r2_127:ChangeState(Enum.HumanoidStateType.Physics)
      task.wait(0.1)
      r2_127:ChangeState(Enum.HumanoidStateType.Running)
    end
  end,
}
EnchantSection:[r182_0](r182_0)
r182_0 = "Section"
r182_0 = {
  Title = "Webhook Fish Caught",
}
r124_0:[r182_0](r182_0)
r182_0 = "Input"
r182_0 = {
  Title = "Webhook URL",
  Value = "",
  Placeholder = "Input Here",
  Callback = function(r0_115)
    -- line: [0, 0] id: 115
    r84_0.URL = r0_115
  end,
}
r180_0 = r124_0:[r182_0](r182_0)
local r183_0 = "Register"
r183_0 = "webhookURLInput"
r118_0:[r183_0](r183_0, r180_0)
r183_0 = "Dropdown"
r183_0 = {
  Title = "Tier Filter",
  Values = {
    "Common",
    "Uncommon",
    "Rare",
    "Epic",
    "Legendary",
    "Mythic",
    "Secret"
  },
  Value = {
    "Mythic",
    "Secret"
  },
  Multi = true,
  AllowNone = true,
  Callback = function(r0_35)
    -- line: [0, 0] id: 35
    r86_0 = r0_35
  end,
}
r124_0:[r183_0](r183_0)
r183_0 = "Dropdown"
r183_0 = {
  Title = "Name Filter",
  Values = {
    "No Fish Found"
  },
  Multi = true,
  AllowNone = true,
  Callback = function(r0_164)
    -- line: [0, 0] id: 164
    r87_0 = r0_164
  end,
}
r181_0 = r124_0:[r183_0](r183_0)
local r184_0 = "Button"
r184_0 = {
  Title = "Refresh Fish",
  Callback = function()
    -- line: [0, 0] id: 173
    r181_0:Refresh(r96_0)
  end,
}
r124_0:[r184_0](r184_0)
r184_0 = "Input"
r184_0 = {
  Title = "Hide Identity",
  Value = "",
  Placeholder = "Input Here",
  Callback = function(r0_107)
    -- line: [0, 0] id: 107
    r88_0 = r0_107
  end,
}
r182_0 = r124_0:[r184_0](r184_0)
local r185_0 = "Register"
r185_0 = "webhookNameInput"
r118_0:[r185_0](r185_0, r182_0)
r185_0 = "Toggle"
r185_0 = {
  Title = "Send Fish Webhook",
  Value = false,
  Callback = function(r0_130)
    -- line: [0, 0] id: 130
    r84_0.Enabled = r0_130
    r85_0 = r0_130
  end,
}
r183_0 = r124_0:[r185_0](r185_0)
local r186_0 = "Register"
r186_0 = "webhookToggle"
r118_0:[r186_0](r186_0, r183_0)
r124_0:Divider()
r186_0 = "Button"
r186_0 = {
  Title = "Test Webhook Connection",
  Callback = function()
    -- line: [0, 0] id: 3
    local r0_3 = r84_0.URL
    if not r0_3 or not r0_3:match("discord.com/api/webhooks") then
      warn("[Webhook Test] ? Invalid or missing webhook URL.")
      return 
    end
    local r1_3 = {
      content = nil,
      embeds = {
        {
          color = 44543,
          author = {
            name = "Webhook is connected :3",
          },
          image = {
            url = "https://i.imgur.com/xl9yLMN.gif",
          },
        }
      },
      username = "Meng Hub Notification!",
      avatar_url = "https://i.imgur.com/ly3iUKn.jpeg",
      attachments = {},
    }
    local function r2_3(r0_6)
      -- line: [0, 0] id: 6
      local r1_6 = syn
      if r1_6 then
        r1_6 = syn.request
        if not r1_6 then
          ::label_7::
          r1_6 = http_request
          if not r1_6 then
            r1_6 = http
            if r1_6 then
              r1_6 = http.request
              if not r1_6 then
                ::label_17::
                r1_6 = fluxus
                if r1_6 then
                  r1_6 = fluxus.request or request
                else
                  goto label_24	-- block#7 is visited secondly
                end
              end
            else
              goto label_17	-- block#5 is visited secondly
            end
          end
        end
      else
        goto label_7	-- block#2 is visited secondly
      end
      if r1_6 then
        return r1_6(r0_6)
      end
      warn("Executor kamu tidak support http request")
      return nil
    end
    task.spawn(function()
      -- line: [0, 0] id: 4
      local r0_4, r1_4 = pcall(function()
        -- line: [0, 0] id: 5
        r2_3({
          Url = r0_3,
          Method = "POST",
          Headers = {
            ["Content-Type"] = "application/json",
          },
          Body = r4_0:JSONEncode(r1_3),
        })
      end)
      if r0_4 then
        mengnotif("? Successfully sent test message!")
      else
        mengnotif("? Failed to send webhook:", r1_4)
      end
    end)
  end,
}
r124_0:[r186_0](r186_0)
function r184_0(r0_68, r1_68, r2_68, r3_68)
  -- line: [0, 0] id: 68
  local r5_68 = (r6_0.Character or r6_0.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
  if r5_68 then
    local r6_68 = CFrame.new(r0_68, r1_68, r2_68)
    local r7_68 = nil	-- notice: implicit variable refs by block#[6]
    if r3_68 then
      r7_68 = CFrame.Angles(0, math.rad(r3_68), 0)
      if not r7_68 then
        ::label_32::
        r7_68 = CFrame.new()
      end
    else
      goto label_32	-- block#5 is visited secondly
    end
    r5_68.CFrame = r6_68 * r7_68
  end
end
function r185_0(r0_218)
  -- line: [0, 0] id: 218
  local r1_218 = workspace:FindFirstChild("!!! MENU RINGS") and workspace["!!! MENU RINGS"]:FindFirstChild(r0_218)
  if not r1_218 then
    return ""
  end
  local r2_218 = r1_218:FindFirstChild("Board") and r1_218.Board:FindFirstChild("Gui") and r1_218.Board.Gui:FindFirstChild("Content")
  if not r2_218 then
    return ""
  end
  local r3_218 = {}
  local r4_218 = 1
  for r8_218, r9_218 in ipairs(r2_218:GetChildren()) do
    if r9_218:IsA("TextLabel") and r9_218.Name ~= "Header" then
      table.insert(r3_218, r4_218 .. ". " .. r9_218.Text)
      r4_218 = r4_218 + 1
    end
  end
  return table.concat(r3_218, "\n")
end
local r188_0 = "Section"
r188_0 = {
  Title = "Sisyphus State Quest",
}
r186_0 = r125_0:[r188_0](r188_0)
local r189_0 = "Paragraph"
r189_0 = {
  Title = "Deep Sea Panel",
  Desc = "Loading...",
}
local r187_0 = r186_0:[r189_0](r189_0)
local r190_0 = "Toggle"
r190_0 = {
  Title = "Auto Deep Sea Quest",
  Desc = "Automatically complete Deep Sea Quest!",
  Value = false,
  Callback = function(r0_116)
    -- line: [0, 0] id: 116
    r29_0 = r0_116
    task.spawn(function()
      -- line: [0, 0] id: 117
      while r29_0 do
        local r0_117 = r185_0("Deep Sea Tracker"):lower()
        if r0_117 ~= "" then
          if string.find(r0_117, "100%%") then
            r184_0(-3763, -135, -995, 180)
          else
            r184_0(-3599, -276, -1641)
          end
        end
        task.wait(1)
      end
    end)
  end,
}
r186_0:[r190_0](r190_0)
r190_0 = "Button"
r190_0 = {
  Title = "Treasure Room",
  Callback = function()
    -- line: [0, 0] id: 93
    r184_0(-3601, -283, -1611)
  end,
}
r186_0:[r190_0](r190_0)
r190_0 = "Button"
r190_0 = {
  Title = "Sisyphus Statue",
  Callback = function()
    -- line: [0, 0] id: 119
    r184_0(-3698, -135, -1008)
  end,
}
r186_0:[r190_0](r190_0)
r190_0 = "Section"
r190_0 = {
  Title = "Element Quest",
}
r188_0 = r125_0:[r190_0](r190_0)
local r191_0 = "Paragraph"
r191_0 = {
  Title = "Element Panel",
  Desc = "Loading...",
}
r189_0 = r188_0:[r191_0](r191_0)
local r192_0 = "Toggle"
r192_0 = {
  Title = "Auto Element Quest",
  Desc = "Automatically teleport through Element Quest Stages!",
  Value = false,
  Callback = function(r0_57)
    -- line: [0, 0] id: 57
    r30_0 = r0_57
    task.spawn(function()
      -- line: [0, 0] id: 58
      local r0_58 = false
      while r30_0 and not r0_58 do
        local r1_58 = r185_0("Element Tracker")
        local r2_58 = {}
        for r6_58 in r1_58:gmatch("[^\n]+") do
          table.insert(r2_58, r6_58:lower())
        end
        if r6_0.Character and r6_0.Character:FindFirstChild("HumanoidRootPart") and 4 <= #r2_58 then
          local r4_58 = r2_58[2]
          local r5_58 = r2_58[4]
          if not string.find(r5_58, "100%%") then
            r184_0(1484, 3, -336, 180)
          elseif string.find(r5_58, "100%%") and not string.find(r4_58, "100%%") then
            r184_0(1453, -22, -636)
          elseif string.find(r4_58, "100%%") then
            r184_0(1480, 128, -593)
            r0_58 = true
            r30_0 = false
            r189_0:SetDesc("Element Quest Completed!")
          end
        end
        task.wait(2)
      end
    end)
  end,
}
r188_0:[r192_0](r192_0)
r192_0 = "Button"
r192_0 = {
  Title = "Secred Tample",
  Callback = function()
    -- line: [0, 0] id: 27
    r184_0(1453, -22, -636)
  end,
}
r188_0:[r192_0](r192_0)
r192_0 = "Button"
r192_0 = {
  Title = "Underground Cellar",
  Callback = function()
    -- line: [0, 0] id: 183
    r184_0(2136, -91, -701)
  end,
}
r188_0:[r192_0](r192_0)
r192_0 = "Button"
r192_0 = {
  Title = "Transcended Stones",
  Callback = function()
    -- line: [0, 0] id: 204
    r184_0(1480, 128, -593)
  end,
}
r188_0:[r192_0](r192_0)
task.spawn(function()
  -- line: [0, 0] id: 170
  while task.wait(2) do
    r187_0:SetDesc(r185_0("Deep Sea Tracker"))
    r189_0:SetDesc(r185_0("Element Tracker"))
  end
end)
r192_0 = "Section"
r192_0 = {
  Title = "Server Utility",
}
r126_0:[r192_0](r192_0)
r192_0 = "Toggle"
r192_0 = {
  Title = "Anti Staff",
  Desc = "Auto kick if staff/developer joins the server",
  Value = false,
  Callback = function(r0_205)
    -- line: [0, 0] id: 205
    r36_0 = r0_205
    local r1_205 = 35102746
    local r2_205 = {
      [2] = "OG",
      [3] = "Tester",
      [4] = "Moderator",
      [75] = "Community Staff",
      [79] = "Analytics",
      [145] = "Divers / Artist",
      [250] = "Devs",
      [252] = "Partner",
      [254] = "Talon",
      [255] = "Wildes",
      [55] = "Swimmer",
      [30] = "Contrib",
      [35] = "Contrib 2",
      [100] = "Scuba",
      [76] = "CC",
    }
    if r0_205 then
      task.spawn(function()
        -- line: [0, 0] id: 206
        while r36_0 do
          local r0_206 = ipairs
          for r3_206, r4_206 in r0_206(game.Players:GetPlayers()) do
            if r4_206 ~= game.Players.LocalPlayer and r2_205[r4_206:GetRankInGroup(r1_205)] then
              game.Players.LocalPlayer:Kick("MengHub Detected Staff, Automatically Kicked!")
              return 
            end
          end
          task.wait(1)
        end
      end)
    end
  end,
}
r190_0 = r126_0:[r192_0](r192_0)
local r193_0 = "Register"
r193_0 = "antiStaffToggle"
r118_0:[r193_0](r193_0, r190_0)
r191_0 = {
  CurrencyCounter = r9_0:WaitForChild("Events"):WaitForChild("Frame"):WaitForChild("CurrencyCounter"):WaitForChild("Counter").Text,
  Location = r9_0:WaitForChild("Events"):WaitForChild("Frame"):WaitForChild("Location"):WaitForChild("Label").Text,
}
r192_0 = {}
for r196_0, r197_0 in ipairs(r6_0.Character:GetDescendants()) do
  local r200_0 = "IsA"
  r200_0 = "BasePart"
  if r197_0:[r200_0](r200_0) then
    r192_0[r197_0] = r197_0.Transparency
  end
end
local r195_0 = "Toggle"
r195_0 = {
  Title = "Streamer Mode",
  Desc = "This will hide the location, character, and coins.",
  Value = false,
  Callback = function(r0_211)
    -- line: [0, 0] id: 211
    if r0_211 then
      r9_0:WaitForChild("Events"):WaitForChild("Frame").CurrencyCounter.Counter.Text = "SENSORED"
      r9_0:WaitForChild("Events"):WaitForChild("Frame").Location.Label.Text = "SENSORED"
      for r4_211, r5_211 in pairs(r192_0) do
        r4_211.Transparency = 1
      end
    else
      r9_0:WaitForChild("Events"):WaitForChild("Frame").CurrencyCounter.Counter.Text = r191_0.CurrencyCounter
      r9_0:WaitForChild("Events"):WaitForChild("Frame").Location.Label.Text = r191_0.Location
      for r4_211, r5_211 in pairs(r192_0) do
        r4_211.Transparency = r5_211
      end
    end
  end,
}
r193_0 = r126_0:[r195_0](r195_0)
local r196_0 = "Register"
r196_0 = "streamerModeToggle"
r118_0:[r196_0](r196_0, r193_0)
r126_0:Divider()
r196_0 = "Toggle"
r196_0 = {
  Title = "Bypass Radar",
  Value = false,
  Callback = function(r0_105)
    -- line: [0, 0] id: 105
    pcall(function()
      -- line: [0, 0] id: 106
      r16_0.RF_Radar:InvokeServer(r0_105)
    end)
  end,
}
local r194_0 = r126_0:[r196_0](r196_0)
local r197_0 = "Register"
r197_0 = "radarToggle"
r118_0:[r197_0](r197_0, r194_0)
r197_0 = "Toggle"
r197_0 = {
  Title = "Bypass Diving Gear",
  Value = false,
  Callback = function(r0_186)
    -- line: [0, 0] id: 186
    if not r0_186 then
      print("Diving Gear Disabled (manual unequip)")
      r16_0.RF_UnequipDiving:InvokeServer()
      return 
    end
    local r1_186 = r17_0.Client:GetReplion("Data")
    if not r1_186 then
      warn("Data Replion tidak ditemukan")
      return 
    end
    if r1_186:Get("EquippedOxygenTankId") == r25_0.Data.Id then
      r16_0.RF_UnequipDiving:InvokeServer()
      print("Diving Gear: OFF")
    else
      r16_0.RF_EquipDiving:InvokeServer(r25_0.Data.Id)
      print("Diving Gear: ON")
    end
  end,
}
r195_0 = r126_0:[r197_0](r197_0)
local r198_0 = "Register"
r198_0 = "divingGearToggle"
r118_0:[r198_0](r198_0, r195_0)
r198_0 = "Section"
r198_0 = {
  Title = "Merchant Shop",
}
r127_0:[r198_0](r198_0)
r198_0 = "Paragraph"
r198_0 = {
  Title = "MERCHANT STOK PANEL",
  Desc = "Loading...",
}
r196_0 = r127_0:[r198_0](r198_0)
local r199_0 = "Button"
r199_0 = {
  Title = "Open/Close Merchant",
  Callback = function()
    -- line: [0, 0] id: 174
    local r0_174 = r9_0:FindFirstChild("Merchant")
    if not r0_174 then
      return 
    end
    if r0_174:IsA("ScreenGui") then
      r0_174.Enabled = not r0_174.Enabled
      return 
    end
    if r0_174:IsA("Frame") then
      r0_174.Visible = not r0_174.Visible
      return 
    end
    local r1_174 = r0_174:FindFirstChild("Main")
    if r1_174 and r1_174:IsA("Frame") then
      r1_174.Visible = not r1_174.Visible
    end
  end,
}
r127_0:[r199_0](r199_0)
function UPX()
  -- line: [0, 0] id: 184
  local r0_184 = {}
  for r4_184, r5_184 in ipairs(r14_0.ItemsFrame:GetChildren()) do
    if r5_184:IsA("ImageLabel") and r5_184.Name ~= "Frame" then
      local r6_184 = r5_184:FindFirstChild("Frame")
      if r6_184 and r6_184:FindFirstChild("ItemName") then
        local r7_184 = r6_184.ItemName.Text
        if not string.find(r7_184, "Mystery") then
          table.insert(r0_184, "- " .. r7_184)
        end
      end
    end
  end
  if #r0_184 == 0 then
    r196_0:SetDesc("No items found\n" .. r14_0.RefreshMerchant.Text)
  else
    r196_0:SetDesc(table.concat(r0_184, "\n") .. "\n\n" .. r14_0.RefreshMerchant.Text)
  end
end
task.spawn(function()
  -- line: [0, 0] id: 138
  while task.wait(1) do
    pcall(UPX)
  end
end)
r199_0 = "Button"
r199_0 = {
  Title = "Teleport To Merchant",
  Callback = function()
    -- line: [0, 0] id: 1
    local r0_1 = game.Players.LocalPlayer
    local r2_1 = (r0_1.Character or r0_1.CharacterAdded:Wait()):FindFirstChild("HumanoidRootPart")
    if r2_1 then
      r2_1.CFrame = CFrame.new(-135.96412658691406, 3.143953323364258, 2766.11083984375)
    end
  end,
}
r127_0:[r199_0](r199_0)
r199_0 = "Section"
r199_0 = {
  Title = "Purchase Rod",
}
r127_0:[r199_0](r199_0)
r199_0 = "Dropdown"
r199_0 = {
  Title = "Select Rod",
  Values = r70_0.Rod or {},
  Callback = function(r0_108)
    -- line: [0, 0] id: 108
    r74_0 = r0_108
  end,
}
r127_0:[r199_0](r199_0)
r199_0 = "Button"
r199_0 = {
  Title = "Purchase",
  Callback = function()
    -- line: [0, 0] id: 28
    if not r74_0 then
      r115_0:Notify({
        Title = "Error",
        Content = "Select Rod First!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    local r0_28 = RodLookupList[r74_0]
    if not r0_28 then
      r115_0:Notify({
        Title = "Error",
        Content = "Rod ID Not Found!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    pcall(function()
      -- line: [0, 0] id: 29
      r16_0.RF_PurchaseRod:InvokeServer(r0_28)
    end)
  end,
}
r127_0:[r199_0](r199_0)
r199_0 = "Section"
r199_0 = {
  Title = "Purchase Bait",
}
r127_0:[r199_0](r199_0)
r199_0 = "Dropdown"
r199_0 = {
  Title = "Select Bait",
  Values = r70_0.Bait or {},
  Callback = function(r0_63)
    -- line: [0, 0] id: 63
    r75_0 = r0_63
  end,
}
r127_0:[r199_0](r199_0)
r199_0 = "Button"
r199_0 = {
  Title = "Purchase",
  Callback = function()
    -- line: [0, 0] id: 156
    if not r75_0 then
      r115_0:Notify({
        Title = "Error",
        Content = "Select Bait First!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    local r0_156 = BaitLookupList[r75_0]
    if not r0_156 then
      r115_0:Notify({
        Title = "Error",
        Content = "Bait ID Not Found!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    pcall(function()
      -- line: [0, 0] id: 157
      r16_0.RF_PurchaseBait:InvokeServer(r0_156)
    end)
  end,
}
r127_0:[r199_0](r199_0)
r199_0 = "Section"
r199_0 = {
  Title = "Purchase Boat",
}
r127_0:[r199_0](r199_0)
r199_0 = "Dropdown"
r199_0 = {
  Title = "Select Boat",
  Values = r70_0.Boat,
  Callback = function(r0_111)
    -- line: [0, 0] id: 111
    r76_0 = r0_111
    print("Selected Boat: " .. tostring(r0_111))
  end,
}
r127_0:[r199_0](r199_0)
r199_0 = "Button"
r199_0 = {
  Title = "Purchase",
  Callback = function()
    -- line: [0, 0] id: 131
    if not r76_0 then
      r115_0:Notify({
        Title = "Error",
        Content = "Select Boat First!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    local r0_131 = BaitLookupList[r76_0]
    if not r0_131 then
      r115_0:Notify({
        Title = "Error",
        Content = "Boat ID Not Found!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    pcall(function()
      -- line: [0, 0] id: 132
      r16_0.RF_PurchaseBoat:InvokeServer(r0_131)
    end)
  end,
}
r127_0:[r199_0](r199_0)
r199_0 = "Section"
r199_0 = {
  Title = "Location",
}
r128_0:[r199_0](r199_0)
r199_0 = "Dropdown"
r199_0 = {
  Title = "Choose Location",
  Values = r82_0,
  Value = "Ancient Jungle",
  Callback = function(r0_199)
    -- line: [0, 0] id: 199
    r78_0 = r0_199
  end,
}
r197_0 = r128_0:[r199_0](r199_0)
local r200_0 = "Register"
r200_0 = "tpLocationDropdown"
r118_0:[r200_0](r200_0, r197_0)
r200_0 = "Button"
r200_0 = {
  Title = "Teleport",
  Callback = function()
    -- line: [0, 0] id: 56
    if not r78_0 then
      r115_0:Notify({
        Title = "Error",
        Content = "Select location first!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    local r0_56 = r81_0[r78_0]
    if not r0_56 then
      return 
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(r0_56) + Vector3.new(0, 3, 0)
  end,
}
r128_0:[r200_0](r200_0)
r200_0 = "Section"
r200_0 = {
  Title = "Player",
}
r128_0:[r200_0](r200_0)
r200_0 = "Dropdown"
r200_0 = {
  Title = "Select Player",
  Values = r80_0(),
  Callback = function(r0_7)
    -- line: [0, 0] id: 7
    r77_0 = r0_7
  end,
}
r198_0 = r128_0:[r200_0](r200_0)
local r201_0 = "Button"
r201_0 = {
  Title = "Refresh",
  Callback = function()
    -- line: [0, 0] id: 149
    r198_0:Refresh(r80_0())
    r115_0:Notify({
      Title = "Success",
      Content = "Berhasil me-refresh player list",
      Duration = 2.5,
      Icon = "laptop-minimal-check",
    })
  end,
}
r128_0:[r201_0](r201_0)
r201_0 = "Button"
r201_0 = {
  Title = "Go",
  Callback = function()
    -- line: [0, 0] id: 90
    if not r77_0 then
      r115_0:Notify({
        Title = "Error",
        Content = "Select player first!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    local r0_90 = game.Players:FindFirstChild(r77_0)
    if not r0_90 or not r0_90.Character or not r0_90.Character:FindFirstChild("HumanoidRootPart") then
      r115_0:Notify({
        Title = "Error",
        Content = "Invalid player!",
        Duration = 2.5,
        Icon = "circle-x",
      })
      return 
    end
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = r0_90.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
  end,
}
r128_0:[r201_0](r201_0)
r201_0 = "OnDestroy"
function r201_0()
  -- line: [0, 0] id: 162
  r118_0:Save()
  if r167_0 then
    r167_0:Set(false)
  end
  if r168_0 then
    r168_0:Set(false)
  end
  if r170_0 then
    r170_0:Set(false)
  end
  if r174_0 then
    r174_0:Set(false)
  end
  if r176_0 then
    r176_0:Set(false)
  end
  if r183_0 then
    r183_0:Set(false)
  end
  if game.CoreGui:FindFirstChild("ToggleUIButton") then
    game.CoreGui.ToggleUIButton:Destroy()
  end
  if r190_0 then
    r190_0:Set(false)
  end
  r194_0:Set(false)
  r195_0:Set(false)
  r6_0.Character.Humanoid.WalkSpeed = 16
  r6_0.Character.Humanoid.JumpPower = 50
  r132_0:Set(16)
  r133_0:Set(50)
  r160_0:Set(false)
  if r52_0 then
    r52_0 = false
  end
  r193_0:Set(false)
  if r99_0 then
    r99_0 = false
    SetWalkOnWater(false)
    if r102_0 then
      r6_0.Character:PivotTo(r102_0)
      r115_0:Notify({
        Title = "Auto Event Off",
        Duration = 2.5,
      })
    end
    r101_0 = nil
    r102_0 = nil
  else
    SetWalkOnWater(false)
  end
  if r27_0.autoCountdownUpdate then
    r27_0.autoCountdownUpdate = false
  end
  r6_0.CameraMaxZoomDistance = 128
  r6_0.CameraMinZoomDistance = 0.5
  if r53_0 then
    r53_0 = false
    local r0_162 = r6_0.Character
    if r0_162 then
      for r4_162, r5_162 in pairs(r0_162:GetDescendants()) do
        if r5_162:IsA("BasePart") then
          r5_162.CanCollide = true
        end
      end
    end
  end
  r149_0()
  if r31_0 then
    r31_0 = false
    r147_0(r31_0)
  end
  local r0_162 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):FindFirstChild("Small Notification")
  if r0_162 and r0_162:FindFirstChild("Display") then
    r0_162.Display.Visible = true
  end
  if ESP_Enabled then
    r152_0:Set(false)
  end
  r136_0 = 1
  r143_0:Set(1)
  r140_0()
  r144_0:Set(false)
  if r35_0 then
    r35_0 = false
  end
end
r116_0:[r201_0](r201_0)
r118_0:Load()
print("?? MengHub Berhasil Dimuat...")
print("?? Happy Got Sikisss Brotherrrrr...")
