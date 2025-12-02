-- ZAPORIUM HUB LOADER - OFFICIAL FINAL VERSION (Rejoin Works Perfectly)
-- New Repository: https://github.com/Zap-Zaporium/Zaporium
-- Key System: Loaded from /Admin (ZaporiumKeySystem.lua)

local ZaporiumKeySystem = loadstring(game:HttpGet("https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/main/Admin"))()

local VALIDATION_URL = "https://raw.githubusercontent.com/Zap-Zaporium/Zaporium/refs/heads/main/validate.txt"
local SAVE_FILE = "ZaporiumKeySave.txt"

local function isKeyValid(key)
    key = key:gsub("%s+", ""):upper()
    if #key < 10 then return false end
    local success, response = pcall(function()
        return game:HttpGet(VALIDATION_URL .. "?key=" .. key .. "&t=" .. tick()) -- cache buster
    end)
    if not success then return false end
    return response:find("VALID") ~= nil
end

local function scheduleDeleteAfter24h()
    task.delay(24 * 60 * 60, function()
        if isfile and isfile(SAVE_FILE) then
            delfile(SAVE_FILE)
            print("[Zaporium] 24h key expired → saved key deleted")
        end
    end)
end

-- Try saved key first (instant load if valid)
if isfile and isfile(SAVE_FILE) then
    local savedKey = readfile(SAVE_FILE):gsub("%s+", ""):upper()
    if isKeyValid(savedKey) then
        print("[Zaporium] Saved key valid → Instant loading...")
        scheduleDeleteAfter24h()

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

        local link = Games[game.PlaceId]
        if link then
            loadstring(game:HttpGet(link))()
        else
            game.StarterGui:SetCore("SendNotification", {Title = "Zaporium Hub", Text = "Game not supported yet!", Duration = 8})
        end
        return -- Prevent GUI from showing
    else
        if isfile(SAVE_FILE) then delfile(SAVE_FILE) end
    end
end

-- Show Key System if no valid saved key
ZaporiumKeySystem.new({
    Title = "ZAPORIUM HUB",
    ValidateKey = function(key)
        local valid = isKeyValid(key)
        if valid and writefile then
            writefile(SAVE_FILE, key:gsub("%s+", ""):upper())
            scheduleDeleteAfter24h()
        end
        return valid
    end,
    OnSuccess = function()
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

        local link = Games[game.PlaceId]
        if link then
            loadstring(game:HttpGet(link))()
        else
            game.StarterGui:SetCore("SendNotification", {Title = "Zaporium Hub", Text = "Game not supported yet!", Duration = 8})
        end
    end
})
