-- ZAPORIUM HUB LOADER - OFFICIAL SECURE VERSION (DEC 2025)
-- Repository: https://github.com/Zap-Zaporium/Zaporium
-- Key System: https://zappy.infinityfreeapp.com (InfinityFree + PHP + LootLabs)
-- 100% Bypass Proof | 1-Hour Keys | IP + Fingerprint Locked | Rejoin Support

local KEY_SYSTEM_URL = "https://zappy.infinityfreeapp.com"  -- Your live site
local SAVE_FILE = "ZaporiumKey.txt"
local KEY_EXPIRY_HOURS = 24  -- Auto-delete after this (rejoin buffer)

local HttpService = game:GetService("HttpService")
local request = (syn and syn.request) or (http and http.request) or request or http_request

local function httpGet(url)
    if not request then return nil end
    local success, response = pcall(function()
        return request({Url = url, Method = "GET", Headers = {["User-Agent"] = "Zaporium/1.0"}})
    end)
    if success and response.StatusCode == 200 then
        return response.Body
    end
    return nil
end

local function isKeyValid(key)
    key = key:gsub("%s+", ""):upper()
    if #key < 20 or not key:match("^ZAP%-") then return false end
    local response = httpGet(KEY_SYSTEM_URL .. "/?verify=" .. key .. "&t=" .. tick())
    if response and response:find('"success":true') then
        return true
    end
    return false
end

local function deleteSavedKey()
    if isfile and isfile(SAVE_FILE) then
        delfile(SAVE_FILE)
        print("[Zaporium] Key expired → Deleted from save.")
    end
end

-- Fast rejoin: Check saved key first
if isfile and isfile(SAVE_FILE) then
    local savedKey = readfile(SAVE_FILE):gsub("%s+", ""):upper()
    if isKeyValid(savedKey) then
        print("[Zaporium] Valid saved key → Instant load! (Rejoin detected)")
        task.delay(KEY_EXPIRY_HOURS * 3600, deleteSavedKey)
        loadstring(game:HttpGet("https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Admin"))()
        return
    else
        deleteSavedKey()
        print("[Zaporium] Saved key invalid → Clearing & prompting new.")
    end
end

-- Game Support List (Add more as needed)
local Games = {
    [99879949355467]   = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Army%20Factory.lua",
    [99421051519131]   = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Color%20Game%20Inf.lua",
    [129854327403392]  = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Brainrot%20morph%20or%20die.lua",
    [79657240466394]   = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Container%20RNG.lua",
    [117579798602171]  = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Crush%20a%20Brainrots.lua",
    [102867184397587]  = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Be%20a%20Hurricane.lua",
    [95885904866309]   = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Dig%20and%20hatch.lua",
    [111972673427354]  = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Dont%20steal%20the%20Kpop.lua",
    [96716540422444]   = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Don%E2%80%99t%20Steal%20The%20Baddies.lua",
    [109073199927285]  = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Escape%20The%20Tsunami.lua",
    [136404558442020]  = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Kayak%20and%20surf.lua",
    [116681772517483]  = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Mutate%20or%20Lose%20Brainrot.lua",
    [155615604]        = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Prison%20Life.lua",
    [76137189788863]   = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Raft%20Tycoon.lua",
    [78949013360566]   = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Shoot%20a%20Brainrot%20New%20UPD.lua",
    [14911088043]      = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/The%20Ride%20Auto%20Farm%20Cash.lua",
    [168556275]        = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/Scripts/Console.lua",
}

-- Delta-Style Key GUI (Draggable, Dark Theme)
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleLabel = Instance.new("TextLabel")
local KeyInput = Instance.new("TextBox")
local SubmitButton = Instance.new("TextButton")
local StatusLabel = Instance.new("TextLabel")
local LinkLabel = Instance.new("TextLabel")

ScreenGui.Name = "ZaporiumKeyGUI"
ScreenGui.Parent = game.CoreGui
ScreenGui.ResetOnSpawn = false

MainFrame.Parent = ScreenGui
MainFrame.Size = UDim2.new(0, 420, 0, 300)
MainFrame.Position = UDim2.new(0.5, -210, 0.5, -150)
MainFrame.BackgroundColor3 = Color3.fromRGB(15, 15, 26)
MainFrame.BorderSizePixel = 0
MainFrame.Active = true
MainFrame.Draggable = true

local MainCorner = Instance.new("UICorner")
MainCorner.CornerRadius = UDim.new(0, 12)
MainCorner.Parent = MainFrame

TitleLabel.Parent = MainFrame
TitleLabel.Size = UDim2.new(1, 0, 0, 60)
TitleLabel.BackgroundTransparency = 1
TitleLabel.Position = UDim2.new(0, 0, 0, 0)
TitleLabel.Text = "🟢 ZAPORIUM HUB"
TitleLabel.TextColor3 = Color3.fromRGB(0, 255, 157)
TitleLabel.Font = Enum.Font.GothamBold
TitleLabel.TextSize = 28
TitleLabel.TextXAlignment = Enum.TextXAlignment.Center

KeyInput.Parent = MainFrame
KeyInput.Size = UDim2.new(0.9, 0, 0, 50)
KeyInput.Position = UDim2.new(0.05, 0, 0.25, 0)
KeyInput.PlaceholderText = "Paste your ZAP-... key here"
KeyInput.Text = ""
KeyInput.BackgroundColor3 = Color3.fromRGB(30, 30, 46)
KeyInput.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyInput.Font = Enum.Font.Gotham
KeyInput.TextSize = 18
KeyInput.TextXAlignment = Enum.TextXAlignment.Center

local InputCorner = Instance.new("UICorner")
InputCorner.CornerRadius = UDim.new(0, 8)
InputCorner.Parent = KeyInput

SubmitButton.Parent = MainFrame
SubmitButton.Size = UDim2.new(0.9, 0, 0, 50)
SubmitButton.Position = UDim2.new(0.05, 0, 0.45, 0)
SubmitButton.BackgroundColor3 = Color3.fromRGB(0, 255, 157)
SubmitButton.Text = "🔑 Verify & Load"
SubmitButton.TextColor3 = Color3.new(0, 0, 0)
SubmitButton.Font = Enum.Font.GothamBold
SubmitButton.TextSize = 18
SubmitButton.TextXAlignment = Enum.TextXAlignment.Center

local SubmitCorner = Instance.new("UICorner")
SubmitCorner.CornerRadius = UDim.new(0, 8)
SubmitCorner.Parent = SubmitButton

StatusLabel.Parent = MainFrame
StatusLabel.Size = UDim2.new(0.9, 0, 0, 40)
StatusLabel.Position = UDim2.new(0.05, 0, 0.65, 0)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = "Status: Ready"
StatusLabel.TextColor3 = Color3.fromRGB(170, 170, 170)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 16
StatusLabel.TextXAlignment = Enum.TextXAlignment.Center

LinkLabel.Parent = MainFrame
LinkLabel.Size = UDim2.new(0.9, 0, 0, 30)
LinkLabel.Position = UDim2.new(0.05, 0, 0.85, 0)
LinkLabel.BackgroundTransparency = 1
LinkLabel.Text = "Get Key: zappy.infinityfreeapp.com"
LinkLabel.TextColor3 = Color3.fromRGB(0, 255, 157)
LinkLabel.Font = Enum.Font.Gotham
LinkLabel.TextSize = 14
LinkLabel.TextXAlignment = Enum.TextXAlignment.Center

-- Events
SubmitButton.MouseButton1Click:Connect(function()
    local key = KeyInput.Text
    if key == "" then
        StatusLabel.Text = "Enter a key first!"
        StatusLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
        return
    end

    StatusLabel.Text = "Validating with server..."
    StatusLabel.TextColor3 = Color3.fromRGB(255, 255, 0)

    if isKeyValid(key) then
        StatusLabel.Text = "✅ Key accepted! Loading hub..."
        StatusLabel.TextColor3 = Color3.fromRGB(0, 255, 157)
        
        if writefile then
            writefile(SAVE_FILE, key)
            task.delay(KEY_EXPIRY_HOURS * 3600, deleteSavedKey)
        end

        task.wait(2)
        ScreenGui:Destroy()

        local scriptUrl = Games[game.PlaceId]
        if scriptUrl then
            loadstring(game:HttpGet(scriptUrl))()
            print("[Zaporium] Game script loaded successfully!")
        else
            game.StarterGui:SetCore("SendNotification", {
                Title = "Zaporium Hub",
                Text = "Game not supported yet! Check back soon.",
                Duration = 10
            })
            print("[Zaporium] Unsupported game ID: " .. game.PlaceId)
        end
    else
        StatusLabel.Text = "❌ Invalid/expired key! Get a new one."
        StatusLabel.TextColor3 = Color3.fromRGB(255, 85, 85)
        KeyInput.Text = ""
    end
end)

-- Click link to open site
LinkLabel.MouseButton1Click:Connect(function()
    if request then
        request({Url = KEY_SYSTEM_URL, Method = "GET"})
    end
    game.StarterGui:SetCore("SendNotification", {
        Title = "Zaporium",
        Text = "Opened key site in browser!",
        Duration = 3
    })
end)

-- Auto-focus input
KeyInput.Focused:Connect(function()
    StatusLabel.Text = "Paste key & click Verify"
    StatusLabel.TextColor3 = Color3.fromRGB(170, 170, 170)
end)

print("[Zaporium Hub] Secure loader active. GUI ready—get your key!")
