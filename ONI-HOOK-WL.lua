repeat wait() until game:IsLoaded()


local time = os.clock()
COREGUI = game:GetService("CoreGui")
if not game:IsLoaded() then
	local notLoaded = Instance.new("Message")
	notLoaded.Parent = COREGUI
	notLoaded.Text = 'Onihub is waiting for the game to load'
	game.Loaded:Wait()
	notLoaded:Destroy()
end

if game.PlaceId ~= 5712833750 then
    return
end

local breakit = false
while true do
    local success, error = pcall(function()
        --print(game.Players.LocalPlayer:FindFirstChild("leaderstats"))
        task.wait()
        if game.Players.LocalPlayer:FindFirstChild("leaderstats") then
            breakit = true
        end
    end)

    if error then
        --print(success, error)
    end

    if breakit then
        break
    end
end

Player = game.Players.LocalPlayer
Character = Player.Character or Player.CharacterAdded:Wait()



local Webhook = {
    ["lIDexvoIl"] = 'https://discord.com/api/webhooks/1055656513693302784/bSIfDjvWZAkoWu98eN7uWDghD9wDuWyhk1cTvRfaNN4LYogt2Tgp1fQ1ooUnzrMltomU',
    ["lIDexvoAlt1Il"] = 'https://discord.com/api/webhooks/1046519750282453042/f0lEWnfzq8ZWyiDOg0RsTt6rmup6OpWRmPwTWaGe4Kb2EJRjH2N8cT5sIt5IzvNMFZnH',
    ["IIWNTERII"] = 'https://discord.com/api/webhooks/1037957688174317578/341tfbdIvOnJWI3-KR5J2nmfVshCpnn6hMrtFWMXGa-QUc0w2mhFpaeJQNex4zmuQ1Bn',
    ["Lewdu"] = 'https://discord.com/api/webhooks/1051795413281284117/3IhmtR2PqI5zUon5eVSdjD6CLKUcx7mHUGpzrffFDu2P0x0hbIs1KY5Zx_ZChzNoQ8LH',
    ["Xentars"] = 'https://discord.com/api/webhooks/1051795413281284117/3IhmtR2PqI5zUon5eVSdjD6CLKUcx7mHUGpzrffFDu2P0x0hbIs1KY5Zx_ZChzNoQ8LH',
    ["lVoixl"] = 'https://discord.com/api/webhooks/1051478801906933780/UXwz0sBhkt1dbhKbGcwtWavv1XRXVuh80-jvx7PyMkZI3MdDffyQR3qrrkuNKdBkkiLE',
    ["IVoixI"] = 'https://discord.com/api/webhooks/1055665591077310535/Yesmz9zC837YuP9-W619-zJUa-N5wozBwA6TffNdT9lTDq5t9CYfRSVK28C_wLpsloeD',
    ["xqo1ox"] = 'https://discord.com/api/webhooks/1051306285989113916/PYM5cUiGeML2-6dKXc9mL7qAIu56XHIQVT2GOQRIA-Qa3ZfRzHAR3FYrLg2Sfttdlf89',
}

if Webhook[game.Players.LocalPlayer.Name] then
    _G.LocalWebhookId = Webhook[game.Players.LocalPlayer.Name]
end

--ID OBSFUCATION--
local factor = 1401
local take = 40120
------------------

-- [[ Whitelist ]]
local data = {}
local file = game:HttpGet("https://raw.githubusercontent.com/VoixGIT/ONIHUB/main/Whitelist.txt", true)
local file = file:gsub("\n", "\0")


for line in file:gmatch("%Z+") do

    ----print(line)
    local id = line:match("ID = (.-),")
    local Note = line:match("Note = (.-),")
    local vip = line:match("VIP = (.-),")
    local obf = line:match("Obf = (.-),")

    ----print(id, Note, vip, obf)

    if obf == 'true' then
        id = tonumber(id)
        id -= take
        id = math.round(id * factor)
    end

    PlayerTable = {Name = name, ID = tonumber(id), VIP = vip}
    table.insert(data, PlayerTable)
end


Access = false
VIP = false
for i,v in pairs(data) do
    if game.Players.LocalPlayer.UserId == v.ID then
        Access = true

        if v.VIP == 'true' then
            VIP = true
        end
    end
end



function RemoveGUI()
    local success, error = pcall(function()
        if game.Players.LocalPlayer.PlayerGui:FindFirstChild("newRewardGui") then
            game.Players.LocalPlayer.PlayerGui.newRewardGui:Destroy()
            breakit = true
        end
    end)
end

function RemoveAddedCooldown()
    Character.ChildAdded:connect(function(child)
        if child.Name == "justFound" or child.Name == "Deb" or child.Name == "FireballDeb" then
            wait()
            child:Destroy()
        else
            --print(child.Name, "Added")
        end
    end)
end


teleport = false
local CharacterAlive
if Character:FindFirstChild("Humanoid").Health > 0 then
    CharacterAlive = true
    teleport = true

    RemoveAddedCooldown()
    RemoveGUI()

    Character:WaitForChild("Humanoid").Died:Connect(function()
        CharacterAlive = false
    end)
else
    CharacterAlive = false
end

game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
    Character = newCharacter
    Character:WaitForChild("Humanoid")
    CharacterAlive = true
    teleport = true

    RemoveAddedCooldown()
    RemoveGUI()

    Character:WaitForChild("Humanoid").Died:Connect(function()
        --print("Character Dead")
        CharacterAlive = false
    end)
end)






-- [[ Whitelist Groups ]] --

-- [[ Comma Function ]]
function commaValue(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end


-- [[ Webhook Setup ]]
local ExecutionWebhook = 'https://discord.com/api/webhooks/1010886865374679040/7PQt81D4f1mTYV_VIiPivNCwnEB8u_-LHqIAWPg-rlRTOENYjZrQ40rH5GwVhBXb8eDI'
local ExecutorType = identifyexecutor() or "Unknown"
local BotUserName = 'ONIxAPI'
local BotPhotoURL = 'https://media.discordapp.net/attachments/856034478408728576/1009394204193067058/oniii.jpg'
local Red = tonumber(tostring("0xFF0000"))
local Green = tonumber(tostring("0x32CD32"))
local Timestamp = os.date("%Y-%m-%dT%X.000Z")
local Request = http_request or request or HttpPost or syn.request



a, b = pcall(function()

    

-- [[ Webhook Setup ]]
if Access == false then
    game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Access Denied",
        Text = "Not Whitelisted",
        Icon = "rbxassetid://6238540373",
        Duration = 10
    })
    local msg = {
        ["username"] = BotUserName,
        ["avatar_url"] = BotPhotoURL,
        ["embeds"] = {
            {
                ["color"] = Red, --decimal
                ["title"] = "Failed Whitelist Check.",
                ["fields"] = {
                        {
                        ["name"] = "Username",
                        ["value"] = game.Players.LocalPlayer.Name,
                        ["inline"] = true
                        },
                        {
                            ["name"] = "Display Name",
                            ["value"] = string.sub(game.Players.LocalPlayer.DisplayName, 1, 30),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "Roleplay Name",
                            ["value"] = string.sub(game.Players.LocalPlayer.leaderstats.Roleplay.Value, 1, 30),
                            ["inline"] = true
                        },
                        {
                            ["name"] = "User Level",
                            ["value"] = commaValue(game.Players.LocalPlayer.leaderstats.Level.Value),
                            ["inline"] = true
                        },
                        {
                        ["name"] = "UID",
                        ["value"] = "||[".. game.Players.LocalPlayer.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                        ["inline"] = true
                        },
                        {
                        ["name"] = "Executor Used",
                        ["value"] = ExecutorType,
                        ["inline"] = true
                        },
                },
                ['timestamp'] = Timestamp
            }
        }
    }

    Request({Url = ExecutionWebhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})

    return
else
    local msg = {
        ["username"] = BotUserName,
        ["avatar_url"] = BotPhotoURL,
        ["embeds"] = {
            {
                ["color"] = Green, --decimal
                ["title"] = "Successful Execution.",
                ["fields"] = {
                    {
                        ["name"] = "Username",
                        ["value"] = Player.Name,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Display Name",
                        ["value"] = string.sub(game.Players.LocalPlayer.DisplayName, 1, 30),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Roleplay Name",
                        ["value"] = string.sub(game.Players.LocalPlayer.leaderstats.Roleplay.Value, 1, 30),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "User Level",
                        ["value"] = commaValue(game.Players.LocalPlayer.leaderstats.Level.Value),
                        ["inline"] = true
                    },
                    {
                        ["name"] = "UID",
                        ["value"] = "||["..game.Players.LocalPlayer.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Executor Used",
                        ["value"] = ExecutorType,
                        ["inline"] = true
                    },
                },
                ['timestamp'] = Timestamp
            }
        }
    }

    Request({Url = ExecutionWebhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
end
end)

if Access == false then
    return
end


if b then
    --print(a, b)
end



local fps = 0
local PlayerPing = 0
game:GetService("RunService").RenderStepped:Connect(function(ping)
    PlayerPing = (game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValueString(math.round(2/ping))) -- your ping
    fps = math.round(1/ping)
end)

local fireballsTotal = 0



---FOR
local levelaverage = 0
local TotalExpPerMin = 0
local LostExpPerMin = 0
local xseconds = 0
local xmins = 0

if _G.LocalWebhookId == '' then
    return
else
    local TrackingWebhookSeconds = 0
    local TrackingWebhookMinutes = 0
    local TrackedTime = 0
    local TrackedPlayerLevel = game.Players.LocalPlayer.leaderstats.Level.Value
    local LevelPerMin = 0
    local HoursTilOnLeaderboard = 0
    local leveldiff = 0

    local testSeconds = 0
    local testMins = 0
    local testHours = 0

    local function TotalExp(exp)
        return 500*(exp-1)^2+1500*(exp-1)+1000
    end


    local top100level = 135000
    for i,v in pairs(game:GetService("Workspace").LBFolder.GlobalLeaderboard.LeaderboardGUI.Holder.ScrollingFrame:GetChildren()) do
        if v.Name == "LeaderboardFrame" then
            local rank = tonumber(v.Rank.text)
            local player = v.Player.text
            local level = tonumber(v.Level.text)

            if rank == 100 then
                top100level = level
            end
        end
    end


    local top1level = 165000
    for i,v in pairs(game:GetService("Workspace").LBFolder.GlobalLeaderboard.LeaderboardGUI.Holder.ScrollingFrame:GetChildren()) do
        if v.Name == "LeaderboardFrame" then
            local rank = tonumber(v.Rank.text)
            local player = v.Player.text
            local level = tonumber(v.Level.text)

            if rank == 1 then
                top1level = level
            end
        end
    end

    task.spawn(function()
        while true do



            if testMins ~= 0 and game.Players.LocalPlayer.leaderstats.Level.Value-TrackedPlayerLevel ~= 0 then
                LevelPerMin = (game.Players.LocalPlayer.leaderstats.Level.Value-TrackedPlayerLevel)/testMins
            end

            local expdifftomax100 = TotalExp(top100level) - TotalExp(game.Players.LocalPlayer.leaderstats.Level.Value)
            local expdifftomax1 = TotalExp(top1level) - TotalExp(game.Players.LocalPlayer.leaderstats.Level.Value)
            local TotalExpPerHour = TotalExpPerMin*60

            HoursTilOnLeaderboard100 = expdifftomax100/TotalExpPerHour
            HoursTilOnLeaderboard1 = expdifftomax1/TotalExpPerHour
           -- HoursTilNextRank = expdifftonextRank/TotalExpPerHour
            --[[
            if LevelPerMin ~= 0 and top100level ~= 0 then
                leveldiff = top100level - game.Players.LocalPlayer.leaderstats.Level.Value
                HoursTilOnLeaderboard = leveldiff / (LevelPerMin * 60)
            end]]

            if TrackingWebhookSeconds == 0 then
                local msg = {
                    ["username"] = BotUserName,
                    ["avatar_url"] = BotPhotoURL,
                    ["content"] = " ",
                    ["embeds"] = {
                        {
                            ["title"] = "__**Farming Update**__",
                            ["type"] = "rich",
                            ["description"] = Player.Name,
                            ["color"] = Green,
                            ["fields"] = {
                                {
                                    ["name"] = "Current Level",
                                    ["value"] = commaValue(game.Players.LocalPlayer.leaderstats.Level.Value),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "Previous Level",
                                    ["value"] = commaValue(TrackedPlayerLevel),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "​",
                                    ["value"] = "Data:",
                                },
                                {
                                    ["name"] = "Levels Gained",
                                    ["value"] = commaValue(game.Players.LocalPlayer.leaderstats.Level.Value-TrackedPlayerLevel),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "Levels Per Min",
                                    ["value"] = tostring(math.round(LevelPerMin*100)/100),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "Levels Per Hour",
                                    ["value"] = tostring(math.round((LevelPerMin*60)*100)/100),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "Exp Gained Per Min",
                                    ["value"] = commaValue(TotalExpPerMin),
                                    ["inline"] = false
                                },
                                {
                                    ["name"] = "Exp till #100",
                                    ["value"] = commaValue(expdifftomax100),
                                    ["inline"] = false
                                },
                                {
                                    ["name"] = "Hours till #100",
                                    ["value"] = tostring(math.round(HoursTilOnLeaderboard100*100)/100),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "Exp till #1",
                                    ["value"] = commaValue(expdifftomax1),
                                    ["inline"] = false
                                },
                                {
                                    ["name"] = "Hours till #1",
                                    ["value"] = tostring(math.round(HoursTilOnLeaderboard1*100)/100),
                                    ["inline"] = true
                                },
                                {
                                    ["name"] = "Fireballs",
                                    ["value"] = fireballsTotal,
                                    ["inline"] = true
                                },
                            },
                            ['timestamp'] = Timestamp,
                            ["footer"] = {
                                ["text"]  = "Time Farming: ".. TrackedTime.. "\n" .. "FPS: "..fps.."\n" .. "Ping: ".. PlayerPing .. "\n" .."​"
                            }
                        },
                    }
                }
                Request({Url = _G.LocalWebhookId, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
                ----print("Sending Request")


                xseconds = 0
                xmins = 0
                TotalExpPerMin = 0
                LostExpPerMin = 0
                levelaverage = 0
            end


            testSeconds += 1
            testMins = testSeconds / 60
            testHours = testMins / 60

            ----print("SECONDS: ",TrackingWebhookSeconds)

            TrackingWebhookSeconds = TrackingWebhookSeconds + 1
            if TrackingWebhookSeconds >= 300 then
                TrackingWebhookMinutes = (TrackingWebhookSeconds + (TrackingWebhookMinutes * 60)) / 60
                TrackedTime = math.floor(TrackingWebhookMinutes) .. ' Minutes'

                if TrackingWebhookMinutes >= 60 then
                    TrackingWebhookHours = TrackingWebhookMinutes / 60
                    TrackingWebhookLeftoverMinutes = (TrackingWebhookHours%1) * 60
                    TrackingWebhookHours = math.floor(TrackingWebhookHours)
                    TrackedTime = TrackingWebhookHours .. ' Hours ' .. math.floor(TrackingWebhookLeftoverMinutes) .. ' Minutes'
                end
                TrackingWebhookSeconds = 0
            end
            wait(1)
        end
    end)
end


-- [[ Anti AFK ]]
if not game:IsLoaded() then game.Loaded:Wait(); end

local idledEvent = game:GetService("Players").LocalPlayer.Idled
local function disable()
    for _, cn in ipairs(getconnections(idledEvent)) do
        cn:Disable()
    end
end

oldConnect = hookfunction(idledEvent.Connect, function(self, ...)
    local cn = oldConnect(self, ...); disable()
    return cn
end)

namecall = hookmetamethod(game, "__namecall", function(self, ...)
    if self == idledEvent and getnamecallmethod() == "Connect" then
        local cn = oldConnect(self, ...); disable()
        return cn
    end
    return namecall(self, ...)
end)

disable()






--- [ XEN STUFF]



local tickstart = os.clock()
local expgained = 0
local lostexp = 0
local totalexp = 0
local level = 0
local exp = 0
local expreset = 0
local leveluptrack = 0
local FireballOrHittrack = 0


local currentexp
local previousexp
local previouslevel
function Exp()
    local ExperienceBar = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("LevelBar"):WaitForChild("Experience")
    currentexp = tonumber(ExperienceBar.text:split("/")[1])
    previousexp = tonumber(ExperienceBar.text:split("/")[1])
    previouslevel = tonumber(ExperienceBar.text:split("/")[2]:sub(1, -4))
    --warn(currentexp, previousexp, previouslevel)

    _G.ExpTracker = ExperienceBar:GetPropertyChangedSignal("Text"):Connect(function(text)
        a, b = pcall(function()
            if CharacterAlive == false then
                _G.ExpTracker:Disconnect()
                return
            end

            if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Health == 0 then
                _G.ExpTracker:Disconnect()
                return
            end

            if text == "0/100" then
                return
            end

            exp = tonumber(ExperienceBar.text:split("/")[1])
            level = tonumber(ExperienceBar.text:split("/")[2]:sub(1, -4))



            if currentexp < previousexp then
                wait(.2)
                --print("[Current exp] " .. currentexp .." is less than [Previous Exp] "..previousexp)
                --print(level, previouslevel, CharacterAlive)
                if level < previouslevel then
                    --print("Level Down: ".. level - previouslevel)
                    leveldown = true
                else
                    leveldown = false
                end

                if level > previouslevel then
                    levelup = true
                else
                    levelup = false
                end

                if level == previouslevel then
                    expsame = true
                else
                    expsame = false
                end

                if levelup then
                    leveluptrack += 1
                    --print("Level up: " .. level - previouslevel)
                    previouslevel = level

                    currentexp = tonumber(ExperienceBar.text:split("/")[1])
                    previousexp = tonumber(ExperienceBar.text:split("/")[1])


                end

                if expsame and not levelup or leveldown then
                    --print("Exp decreased")
                    expreset += 1
                    lostexp += previousexp - currentexp
                    currentexp = tonumber(ExperienceBar.text:split("/")[1])
                    previousexp = currentexp
                end
            end

            previousexp = currentexp
            currentexp = tonumber(ExperienceBar.text:split("/")[1])
            if currentexp > previousexp then
                totalexp += currentexp - previousexp
            end
        end)
        if b then
            --print(a, b)
        end
    end)
end

task.spawn(function()
    _G.Player = game.Players.LocalPlayer.CharacterAdded:Connect(function(Character)
        Exp()
    end)
    Exp()
end)


task.spawn(function()
    while wait(1) do
        xseconds += 1
        xmins = xseconds/60
    end
end)


task.spawn(function()
    while wait(10) do
        TotalExpPerMin = totalexp/xmins
        LostExpPerMin = lostexp/xmins
        levelaverage = level/xmins

        ----print"[-------"
        ----warn("Level: " .. level .. " Current: ".. currentexp .." Previous: " .. previousexp .. " Total Exp: " .. totalexp)
        ----warn("Gained: ".. currentexp - previousexp)
        ----warn("Lost Exp: ", lostexp)
        ----print"-------"
        ----warn("Exp Per Min: ", TotalExpPerMin)
        ----warn("Times exp was lowered: ", expreset)
        ----warn("Level Ups: ", leveluptrack)
        ----print"-------]"
        ----print(xmins)
    end
end)

-- [[ UI Library Setup ]]
Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VoixGIT/ONIHUB/main/VisualUI3.0'))()
Window = Library:CreateWindow('O N I  H U B', 'V 3 . 0', 'O N I  H U B', ' ', 'VisualUIConfigs', 'Kiriot')


wait()
--print("UI RUNNING")

-- [[ UI Section Autofarm ]]
TabAutofarm = Window:CreateTab('Auto Farm', true, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
Section = TabAutofarm:CreateSection('Auto Farm')


-- [[ TIMER ]]
local timeSecondsDummy = 0
local timeMinsDummy = timeSecondsDummy / 60
local timeHoursDummy = timeMinsDummy / 60
local timeDaysDummy = timeHoursDummy / 60
task.spawn(function()
    pcall(function()
        while wait(1) do
            ------print(timeSecondsDummy)
            timeSecondsDummy += 1
            timeMinsDummy = timeSecondsDummy / 60
            timeHoursDummy = timeMinsDummy / 60
            timeDaysDummy = timeHoursDummy / 60
        end
    end)
end)

------------

local savedpos
Toggle = Section:CreateToggle('[Dummy] (Hit)', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        NewLoop = true
    else
        NewLoop = false
    end

    timeSecondsDummy = 0
    local dummytarget = nil
    local success, error = pcall(function()
        if NewLoop then
            savedpos = Character.HumanoidRootPart.CFrame
            TrackingWebhookSeconds = 0
            timeSecondsDummy = 0
            local search
            local dummyLevel
            if game.Players.LocalPlayer.leaderstats.Level.Value > 5000 then
                dummyLevel = "Dummy2"
                search = game:GetService("Workspace").MAP.waterfall1
            else
                dummyLevel = "Training Dummy"
                search = game:GetService("Workspace").MAP.dummies
            end

            dummytarget = search:FindFirstChild(dummyLevel)

            Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
        else
            Character.HumanoidRootPart.CFrame = savedpos
        end

        local FireLoop = 0
        local Fire = 0
        while NewLoop do
            task.wait()
            Fire += 1
            if Fire >= 2 then
                Fire = 0
                FireLoop += 1
                if FireLoop > 60 then
                    FireLoop = 1
                end
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(dummytarget.Humanoid, FireLoop)
            end

            task.spawn(function()
                if timeMinsDummy > 5 then
                    timeSecondsDummy = 0
                    if Character:FindFirstChild("Humanoid") then
                        Character.Humanoid.Health = 0
                    end
                    repeat
                        wait()
                    until CharacterAlive == true

                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame
                end
            end)
        end
    end)
end)

Toggle = Section:CreateToggle('[Dummy Slower] (Hit)', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        NewLoop = true
    else
        NewLoop = false
    end

    local dummytarget = nil
    local num = 0

    timeSecondsDummy = 0

    local success, error = pcall(function()
        if NewLoop then
            savedpos = Character.HumanoidRootPart.CFrame
            TrackingWebhookSeconds = 0

            local search
            local dummyLevel
            if game.Players.LocalPlayer.leaderstats.Level.Value > 5000 then
                dummyLevel = "Dummy2"
                search = game:GetService("Workspace").MAP.waterfall1
            else
                dummyLevel = "Training Dummy"
                search = game:GetService("Workspace").MAP.dummies
            end

            dummytarget = search:FindFirstChild(dummyLevel)

            Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
        else
            Character.HumanoidRootPart.CFrame = savedpos
        end

        local UpdatedNumber = 0
        local hitloop = 0
        local hit = 0
        while NewLoop do
            wait(0.083)
            hit += 1
            if hit >= 3 then
                hit = 0
                hitloop += 1
                if hitloop > 60 then
                    hitloop = 1
                end
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(dummytarget.Humanoid, hitloop)
            end


            if timeMinsDummy > 5 then
                timeSecondsDummy = 0
                if Character:FindFirstChild("Humanoid") then
                    Character.Humanoid.Health = 0
                end
                repeat
                    wait()
                until CharacterAlive == true

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame
            end
        end
    end)
    if error then
        ----print(success, error)
    end
end)

local Paragraph = Section:CreateParagraph('WARNING!', 'Do not use in Public')



local savedpos
Toggle = Section:CreateToggle('[Dummy] (Fireball + Hit)', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        NewLoop = true
    else
        NewLoop = false
    end

    timeSecondsDummy = 0
    local dummytarget = nil
    local success, error = pcall(function()
        if NewLoop then
            savedpos = Character.HumanoidRootPart.CFrame
            TrackingWebhookSeconds = 0
            timeSecondsDummy = 0
            local search
            local dummyLevel
            if game.Players.LocalPlayer.leaderstats.Level.Value > 5000 then
                dummyLevel = "Dummy2"
                search = game:GetService("Workspace").MAP.waterfall1
            else
                dummyLevel = "Training Dummy"
                search = game:GetService("Workspace").MAP.dummies
            end

            dummytarget = search:FindFirstChild(dummyLevel)

            Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
        else
            Character.HumanoidRootPart.CFrame = savedpos
        end





        ----warn(PlayerPing, currentPing,currentCV)


       -- local currentPing = tonumber(PlayerPing:split(" ")[1])
       -- local currentCV = string.gsub(PlayerPing:split(" ")[2], "%D+", "")
       -- local --warningPing = tonumber(currentPing * 5)
       -- local --warningCV = tonumber(100)
       -- --print("Current: ", currentPing)
        ----print("Warning Ping: ", --warningPing)




        task.spawn(function()

            local runningFireball = false
            while NewLoop do
                task.wait()

              --  currentPing = tonumber(PlayerPing:split(" ")[1])
              -- -- CV = PlayerPing:split(" ")[2]
               -- CVString = string.gsub(CV, "%D+", "")
             --   currentCV = tonumber(CVString)

               -- if currentCV > --warningCV then
                --    --warn("WARNING CV: ", currentCV)

               --     wait(5)
               --     continue
              --  end
                --if currentPing > --warningPing then
                --    --warn("WARNING PING: ", currentPing)
                --    wait(5)

               --     continue
               -- end

                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(dummytarget.Humanoid, 1)


                local Fireballs = 0
                if runningFireball == false then
                    runningFireball = true
                    task.spawn(function()
                        a, b = pcall(function()

                            local Balls = {"Fireball", "Lightningball"}
                            local Locations = {"Backpack", "Character"}
                            for i, player in pairs(game.Players:GetChildren()) do
                                local earlyreturn = false
                                for _,Ball in pairs(Balls) do
                                    for i,Location in pairs(Locations) do
                                        local CheckBall = player[Location]:FindFirstChild(Ball)
                                        if CheckBall then
                                            Fireballs += 1
                                            CheckBall:FindFirstChild("FireballEvent"):FireServer(dummytarget.HumanoidRootPart.Position)
                                            earlyreturn = true
                                            wait()
                                            break
                                        end
                                    end

                                    if earlyreturn then
                                        break
                                    end
                                end
                            end

                            fireballsTotal = Fireballs
                            Fireballs = 0
                            runningFireball = false
                        end)
                        if b then
                            runningFireball = false
                        end
                    end)
                end


                task.spawn(function()
                    if timeMinsDummy > 5 then
                        timeSecondsDummy = 0
                        if Character:FindFirstChild("Humanoid") then
                            Character.Humanoid.Health = 0
                        end
                        repeat
                            wait()
                        until CharacterAlive == true

                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame
                    end
                end)
            end
        end)
    end)

    if error then
        --print(error)
    end
end)


local savedpos
Toggle = Section:CreateToggle('[Dummy] (Single Fireball + Hit)', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        NewLoop = true
    else
        NewLoop = false
    end

    timeSecondsDummy = 0
    local dummytarget = nil
    local success, error = pcall(function()
        if NewLoop then
            savedpos = Character.HumanoidRootPart.CFrame
            TrackingWebhookSeconds = 0
            timeSecondsDummy = 0
            local search
            local dummyLevel
            if game.Players.LocalPlayer.leaderstats.Level.Value > 5000 then
                dummyLevel = "Dummy2"
                search = game:GetService("Workspace").MAP.waterfall1
            else
                dummyLevel = "Training Dummy"
                search = game:GetService("Workspace").MAP.dummies
            end

            dummytarget = search:FindFirstChild(dummyLevel)

            Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame + Vector3.new(3,0,0)
        else
            Character.HumanoidRootPart.CFrame = savedpos
        end


        task.spawn(function()

            local Delay = 0
            local runningFireball = false
            local waittime = 0.1
            while NewLoop do
                task.wait()


                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(dummytarget.Humanoid, 1)



                task.spawn(function()
                    pcall(function()
                        if game.Players.LocalPlayer.Backpack:FindFirstChild("Fireball") then
                            game.Players.LocalPlayer.Backpack:FindFirstChild("Fireball").FireballEvent:FireServer(dummytarget.HumanoidRootPart.Position)
                        end

                        if game.Players.LocalPlayer.Character:FindFirstChild("Fireball") then
                            game.Players.LocalPlayer.Character:FindFirstChild("Fireball").FireballEvent:FireServer(dummytarget.HumanoidRootPart.Position)
                        end
                        fireballsTotal = 1
                    end)
                end)



                task.spawn(function()
                    if timeMinsDummy > 5 then
                        timeSecondsDummy = 0
                        if Character:FindFirstChild("Humanoid") then
                            Character.Humanoid.Health = 0
                        end
                        repeat
                            wait()
                        until CharacterAlive == true

                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = dummytarget.HumanoidRootPart.CFrame
                    end
                end)
            end
        end)
    end)
end)

--[[
local savedpos
Toggle = Section:CreateToggle('(Coins [Gain and Remove All])', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Coins = true
    else
        Coins = false
    end

    while Coins do
        wait(.1)
        game:GetService("ReplicatedStorage").Events.CoinEvent:FireServer()

        if CharacterAlive and game.Players.LocalPlayer:FindFirstChild("otherstats").Coin.Value >= 500 then
            game:GetService("ReplicatedStorage").Events.unlockEvent:FireServer()
        end
    end
end)
]]
-- [[ XEN SETTINGS ]]


TabAutoRest = Window:CreateTab('Misc Features', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
Section = TabAutoRest:CreateSection('Misc Features')


local Label = Section:CreateLabel('Misc:')

local Username = ""
local Textbox = Section:CreateTextbox('Name Change', '', function(Value)
    Username = Value

    --string = ""
    --for i = 1, Username/2 do

   -- end


    endstring = "👹 \r\n ".. Username

    game:GetService("Players").LocalPlayer.PlayerGui.RolePlayName.Frame.bodyFrame.submitBtn.nameEvent:FireServer(endstring)
end)

Button = Section:CreateButton('Invisible Name', function()
    game:GetService("Players").LocalPlayer.PlayerGui.RolePlayName.Frame.bodyFrame.submitBtn.nameEvent:FireServer("\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n")
end)


Button = Section:CreateButton('Oni Spam Name', function()
    game:GetService("Players").LocalPlayer.PlayerGui.RolePlayName.Frame.bodyFrame.submitBtn.nameEvent:FireServer("\r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r --------------------- \r\n\r ")
end)



Toggle = Section:CreateToggle('Grab Lightning on Spawn', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Light = true
    else
        Light = false
    end
    pcall(function()
        ----print(Lightn)
        if Light then
            for i,v in pairs(game.Workspace.MAP.waterfall1.cave:GetChildren()) do
                if v.Name == "Model" then
                    for i,v in pairs(v:GetChildren()) do
                        if v.Name == "rock" then
                            v.CanCollide = false
                        end
                    end
                end
            end

            _G.Lightning = game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
                wait(2)
                local savedpos = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                local Camera = game.Workspace.CurrentCamera
                Camera.CameraType = Enum.CameraType.Scriptable
                Camera.CFrame = game.Workspace.PickFolder.rock.CFrame * CFrame.new(0,2,10)
                Camera.CFrame = CFrame.lookAt(Camera.CFrame.p, game.Workspace.PickFolder.rock.Position)

                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-60,0)
                wait(.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.PickFolder.rock.CFrame * CFrame.new(0,-60,0)
                wait(.1)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Workspace.PickFolder.rock.CFrame * CFrame.new(0,0-11.5,0)
                task.wait()
                repeat
                wait(.3)
                game:GetService('VirtualInputManager'):SendKeyEvent(true, "E", false, game)
                until game.Players.LocalPlayer.Character:FindFirstChild("Lightningball") or game.Players.LocalPlayer.Backpack:FindFirstChild("Lightningball") or a

                wait()
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-60,0)
                wait(.1)
                game.Workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = savedpos
            end)
        else
            _G.Lightning:Disconnect()
        end
    end)
end)


Toggle = Section:CreateToggle('Character Reset - Avatar Editor', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        CharacterReset = true
    else
        CharacterReset = false
    end

    if not CharacterReset then
        return
    end

    game:GetService("ReplicatedStorage").AvatarEditor.RemoteEvent:FireServer("reset")


    game.Players.LocalPlayer.CharacterAdded:Connect(function(newCharacter)
        wait(1)
        game:GetService("ReplicatedStorage").AvatarEditor.RemoteEvent:FireServer("reset")
        wait(1)
        game:GetService("ReplicatedStorage").AvatarEditor.RemoteEvent:FireServer("reset")
    end)
end)


local Connection
function InviteConnection(GUI)
    Connection = GUI:GetPropertyChangedSignal("Enabled"):Connect(function(state)
        ----print("changed", state)
        GUI.Enabled = false
    end)
end

function GetInviteConnection()
    return Connection
end

local Toggle = Section:CreateToggle('Ride Invite GUI Toggle', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        InviteDisabled = true
    else
        InviteDisabled = false
    end

    local GUI = game:GetService("Players").LocalPlayer.PlayerGui.Ride.RideInviteGUI

    if InviteDisabled then
        InviteConnection(GUI)
    end

    if not InviteDisabled then
        GetInviteConnection():Disconnect()
        GUI.Enabled = false
    end
end)


local MEgg = 0
local WorkspaceSound
local EGGWorkspaceSound
Toggle = Section:CreateToggle('Mute All', true, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Mute = true
    else
        Mute = false
    end

    if not Mute then
        for i, connection in pairs(getconnections(workspace.DescendantAdded)) do
            connection:Disable()
        end
    end

    if Mute then
        MEgg += 1
        --warn(MEgg)
    end

    pcall(function()
        if game.ReplicatedStorage:FindFirstChild("Soundtracks") then
            game.ReplicatedStorage:FindFirstChild("Soundtracks"):Destroy()
        end
    end)

    if Mute and MEgg == 5 then
        game.Workspace.DescendantAdded:connect(function(child)
            if child:IsA("Sound") then
                child.Pitch = 0.2
            end
        end)
    end

    if Mute and MEgg ~= 5 then
        game.Workspace.DescendantAdded:connect(function(child)
            if child:IsA("Sound") then
                child.Playing = false
                child.Volume = 0
            end
        end)
    end



    while Mute do
        local success, error = pcall(function()
            for i,v in pairs(game.Players:GetPlayers()) do
                ------print(i,v)
                if v.Name ~= game.Players.LocalPlayer.Name and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:FindFirstChild("Sound") then
                ------print(i,v)
                    v.Character.HumanoidRootPart:FindFirstChild("Sound").Volume = 0
                end
            end

            game:GetService("SoundService"):FindFirstChild("BGMusic").Volume = 0
            game:GetService("Players").LocalPlayer.PlayerScripts:FindFirstChild("coinSpawner").Sound.Volume = 0
        end)

        if not success then
            ----warn(error)
        end

        wait(1)
    end

    local success, error = pcall(function()
        for i,v in pairs(game.Players:GetPlayers()) do
            if v.Name ~= game.Players.LocalPlayer.Name and v.Character and v.Character:FindFirstChild("HumanoidRootPart") and v.Character.HumanoidRootPart:FindFirstChild("Sound") then
                v.Character.HumanoidRootPart:FindFirstChild("Sound").Volume = 1.3
            end
        end
        game:GetService("SoundService"):FindFirstChild("BGMusic").Volume = 1
        game.GetService("Players").LocalPlayer:FindFirstChild("coinSpawner").Sound.Volume = 0.1
    end)
end)



local Toggle = Section:CreateToggle('Anti-Fling', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        InviteDisabled = true
    else
        InviteDisabled = false
    end

    local GUI = game:GetService("Players").LocalPlayer.PlayerGui.Ride.RideInviteGUI

    if InviteDisabled then
        _G.AntiFlingConfig = {
            -- this will remove your rotational velocity every frame
            disable_rotation = true;

            -- this slows you down if you're moving too fast, works well but can give you a low gravity effect
            limit_velocity = true;
            limit_velocity_sensitivity = 150; -- how fast you have to be moving before you get slowed down
            limit_velocity_slow = 0; -- the amount of velocity you keep; a lower number increases how much you slow down by

            -- stops you from ragdolling or falling over and losing control
            anti_ragdoll = true;

            -- completely freezes you if someone gets too close to you
            anchor = false;
            smart_anchor = true; -- only anchors if someone is considered flinging, this likely won't detect many flings
            anchor_dist = 30; -- how close someone has to be to trigger anchor

            -- teleport away if someone gets too close
            teleport = false;
            smart_teleport = true; -- only teleports if someone is considered flinging, this likely won't detect many flings
            teleport_dist = 30; -- how close someone has to be to teleport you
        }
        -- run _G.disable() to disable the script completely

        loadstring(game:HttpGet('https://raw.githubusercontent.com/topitbopit/rblx/main/extra/better_antifling.lua'))()
    end

    if not InviteDisabled then
        _G.disable()
    end
end)




--[[
Toggle = Section:CreateToggle('Auto Eat', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Tog = true
    else
        Tog = false
    end

    while Tog do
        local success, error = pcall(function()
            if Character.Humanoid.Health >= Character.Humanoid.MaxHealth then
                repeat
                    ------print("Waiting")
                    wait(.1)
                until Character.Humanoid.Health < Character.Humanoid.MaxHealth

                ----print("Lower Working Magic")
            end
        end)
        if not success then
            ----warn(error)
        end

        if Character:FindFirstChild("Food") ~= false and game.Players.LocalPlayer.Backpack:FindFirstChild("Food") then
            Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack:FindFirstChild("Food"))
        end

        wait()

        if Character:FindFirstChild("Food") then
            Character:FindFirstChild("Food"):Activate()
            wait()
            Character:FindFirstChild("Humanoid"):UnequipTools()
        end
    end
end)
--]]
--[[
local Label = Section:CreateLabel('Force Ride:')

local RidePlayer = ""
local Textbox = Section:CreateTextbox('Player:', '', function(Value)
    RidePlayer = Value
end)

local Toggle = Section:CreateToggle('Ride Spam', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Ride = true
    else
        Ride = false
    end

    if Ride then
        task.wait()
        game:GetService("ReplicatedStorage").RideEvents.acceptEvent:FireServer(RidePlayer)
    end
end)]]




-- [[ PVP SETTINGS ]]

local Waiting;
Waiting = hookfunction(wait, function(time)
    if Cooldown then
        if time == 0.6 then
            time = 0.1;
        end
    end
    return Waiting(time);
end);


    TabAutoRest = Window:CreateTab('PVP Features', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
    Section = TabAutoRest:CreateSection('PVP Features')

    Toggle = Section:CreateToggle('Q Hit - Cooldown Reduction', true, Color3.fromRGB(0, 125, 255), 0.47, function(Value)
        if Value == true then
            Cooldown = true
        else
            Cooldown = false
        end
    end)


local Label = Section:CreateLabel('HitBox Increaser:')

local Head = 5
local Textbox = Section:CreateTextbox('Head Size', '5.8', function(Value)
    Head = Value
end)

local Toggle = Section:CreateToggle('Hitbox [Pack Whitelist]', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Hitbox = true
    else
        Hitbox = false
    end

    while Hitbox do
        a, b  = pcall(function()
            local friendlies = {}

            local Team
            local Teams = game.Workspace.Teams
            for i,v in pairs(Teams:GetDescendants()) do
                if v:IsA("StringValue") then
                    if v.Value == game.Players.LocalPlayer.Name then
                        Team = tostring(v.Parent.Name)
                    end
                end
            end

            if Team ~= nil then
                --print(Teams[Team])
                for i,v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                    if v:IsA("StringValue") then
                        ----print(v.Value)
                        table.insert(friendlies, v.Value)
                    end
                end
            end

            for i,v in pairs(game:GetService('Players'):GetPlayers()) do
                --print("OUT ",v.Name)
                if v.Name ~= game:GetService('Players').LocalPlayer.Name and Value then
                    --print("IN ",v.Name)

                    if table.find(friendlies, v.Name) then
                        v.Character.HumanoidRootPart.Size = Vector3.new(0.1,0.1,0.1)
                        v.Character.HumanoidRootPart.Transparency = 0.5
                        v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Black")
                        v.Character.HumanoidRootPart.Material = "Plastic"
                        v.Character.HumanoidRootPart.CanCollide = true
                        continue
                    end

                    v.Character.HumanoidRootPart.Size = Vector3.new(Head,Head,Head)
                    v.Character.HumanoidRootPart.Transparency = 0.5
                    v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Black")
                    v.Character.HumanoidRootPart.Material = "Plastic"
                    v.Character.HumanoidRootPart.CanCollide = true
                end
            end
        end)

        if b then
            --print(a, b)
        end
        wait(10)
    end

    if not Hitbox then
        for i,v in pairs(game:GetService('Players'):GetChildren()) do
            if v.Name ~= game:GetService('Players').LocalPlayer.Name then
                --pcall(function()
                v.Character.HumanoidRootPart.Size = Vector3.new(0.7,1.6,0.92)
                v.Character.HumanoidRootPart.Transparency = 1
                v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Black")
                v.Character.HumanoidRootPart.Material = "Plastic"
                v.Character.HumanoidRootPart.CanCollide = true
               --end)
            end
        end
    end
end)

if VIP then
    TabAutoRest = Window:CreateTab('VIP Features', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
    Section = TabAutoRest:CreateSection('VIP Features')

    function findPlayersInParts(Parts)
        local PlayerlistPARTS = {}
        for i = 1, #Parts do
            for _, Part in pairs(game.Workspace:GetPartsInPart(Parts[i])) do
                if Part.Name ~= "HumanoidRootPart" then
                    continue
                end
                if Part.Parent.Name == "Training Dummy" then
                    continue
                end
                if Part.Parent.Name == game.Players.LocalPlayer.Name then
                    continue
                end
                table.insert(PlayerlistPARTS, Part.Parent.Name)
            end
        end

        return PlayerlistPARTS
    end


    local Fireballs = {
        "Fireball",
        "LightningBall",
    }

    local Parts = {
        game.Workspace:FindFirstChild("SafeZonePart"),
        game.Workspace:FindFirstChild("SafeZonePart2")
    }


    local Whitelist = {}
    local Toggle = Section:CreateToggle("Fireball Aura [Safezone Detection (Laggier)]", false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
        if Value == true then
            Aura = true
        else
            Aura = false
        end

        if Aura then

        task.spawn(function()
            waittime = 0.1
            runningFireball = false
            while Aura do
                wait(1)
                --print(Aura)
                local Fireballs = 0
                if runningFireball == false then
                    runningFireball = true
                    task.spawn(function()
                        pcall(function()
                            local Balls = {"Fireball", "Lightningball"}
                            local Locations = {"Backpack", "Character"}
                            for i, player in pairs(game.Players:GetChildren()) do
                                local earlyreturn = false
                                for _,Ball in pairs(Balls) do
                                    for i,Location in pairs(Locations) do
                                        local CheckBall = player[Location]:FindFirstChild(Ball)
                                        if CheckBall then
                                            --print("FIREBALL")
                                            Fireballs += 1
                                            CheckBall:FindFirstChild("FireballEvent"):FireServer(Vector3.new(0, -10000, 0))
                                            earlyreturn = true
                                            wait(waittime)
                                            break
                                        end
                                    end

                                    if earlyreturn then
                                        break
                                    end
                                end
                            end

                            if Fireballs ~= 0 then
                                waittime =  2.2 / Fireballs
                                --print(waittime)
                            end
                            fireballsTotal = Fireballs
                            Fireballs = 0
                            runningFireball = false
                        end)
                    end)
                end
            end

        end)

            _G.FireballKill = game.Workspace.ChildAdded:connect(function(child)

                pcall(function()



                    ----print(child)
                    if not table.find(Fireballs, child.Name) then
                        return
                    end


                    local PlayersInSafeZone = findPlayersInParts(Parts)


                    local PlayerList = {}
                    local Min = math.huge


                    local friendlies = {}

                    local Team
                    local Teams = game.Workspace.Teams
                    for i,v in pairs(Teams:GetDescendants()) do
                        if v:IsA("StringValue") then
                            if v.Value == game.Players.LocalPlayer.Name then
                                Team = tostring(v.Parent.Name)
                            end
                        end
                    end

                    if Team ~= nil then
                        --print(Teams[Team])
                        for i,v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                            if v:IsA("StringValue") then
                                table.insert(friendlies, v.Value)
                            end
                        end
                    end


                    for i,SearchPlayer in pairs(game.Players:GetChildren()) do
                        if SearchPlayer.Name == game.Players.LocalPlayer.Name then
                            continue
                        end

                        if table.find(PlayersInSafeZone, SearchPlayer.Name) then
                            ----print("Nope", SearchPlayer.Name,  "is in Safezone")
                            continue
                        end




                        if table.find(friendlies, SearchPlayer.Name) then
                            ----print("Nope", SearchPlayer.Name,  "is friendly")
                            continue
                        end

                        if SearchPlayer.Character and SearchPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                            local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SearchPlayer.Character.HumanoidRootPart.Position).Magnitude
                            table.insert(PlayerList, {Player = SearchPlayer, Magnitude = Mag})
                            if Min > Mag then
                                Min = Mag
                            end
                        end
                    end

                    table.sort(PlayerList, function(a, b)
                        return a.Magnitude < b.Magnitude
                    end)

                    if PlayerList[1].Magnitude < 1000 then
                        pcall(function()
                            while true do
                                task.wait()
                                if child:FindFirstChild("TouchInterest") then

                                    wait(.1)
                                    --print("Killing", PlayerList[1].Player.Name, child:FindFirstChild("TouchInterest"))
                                    firetouchinterest(PlayerList[1].Player.Character.HumanoidRootPart, child, 0)
                                    task.wait()
                                    firetouchinterest( PlayerList[1].Player.Character.HumanoidRootPart, child, 1)
                                    --print(PlayerList[1].Player.Character.Humanoid.Health .. "/" .. PlayerList[1].Player.Character.Humanoid.MaxHealth)

                                    break
                                end
                            end
                        end)
                    end
                end)
            end)


        else
            _G.FireballKill:Disconnect()
        end
    end)

    local Whitelist = {}
    local Toggle = Section:CreateToggle('Fireball Aura', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
        if Value == true then
            Aura = true
        else
            Aura = false
        end

        if Aura then

        task.spawn(function()
            waittime = 0.1
            runningFireball = false
            while Aura do
                wait(1)
                --print(Aura)
                local Fireballs = 0
                if runningFireball == false then
                    runningFireball = true
                    task.spawn(function()
                        pcall(function()
                            local Balls = {"Fireball", "Lightningball"}
                            local Locations = {"Backpack", "Character"}
                            for i, player in pairs(game.Players:GetChildren()) do
                                local earlyreturn = false
                                for _,Ball in pairs(Balls) do
                                    for i,Location in pairs(Locations) do
                                        local CheckBall = player[Location]:FindFirstChild(Ball)
                                        if CheckBall then
                                            --print("FIREBALL")
                                            Fireballs += 1
                                            CheckBall:FindFirstChild("FireballEvent"):FireServer(Vector3.new(0, -10000, 0))
                                            earlyreturn = true
                                            wait(waittime)
                                            break
                                        end
                                    end

                                    if earlyreturn then
                                        break
                                    end
                                end
                            end

                            if Fireballs ~= 0 then
                                waittime =  2.2 / Fireballs
                                --print(waittime)
                            end
                            fireballsTotal = Fireballs
                            Fireballs = 0
                            runningFireball = false
                        end)
                    end)
                end
            end

        end)

            _G.FireballKill = game.Workspace.ChildAdded:connect(function(child)

                pcall(function()



                    ----print(child)
                    if not table.find(Fireballs, child.Name) then
                        return
                    end


                    --local PlayersInSafeZone = findPlayersInParts(Parts)


                    local PlayerList = {}
                    local Min = math.huge


                    local friendlies = {}

                    local Team
                    local Teams = game.Workspace.Teams
                    for i,v in pairs(Teams:GetDescendants()) do
                        if v:IsA("StringValue") then
                            if v.Value == game.Players.LocalPlayer.Name then
                                Team = tostring(v.Parent.Name)
                            end
                        end
                    end

                    if Team ~= nil then
                        --print(Teams[Team])
                        for i,v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                            if v:IsA("StringValue") then
                                table.insert(friendlies, v.Value)
                            end
                        end
                    end


                    for i,SearchPlayer in pairs(game.Players:GetChildren()) do
                        if SearchPlayer.Name == game.Players.LocalPlayer.Name then
                            continue
                        end





                        if table.find(friendlies, SearchPlayer.Name) then
                            ----print("Nope", SearchPlayer.Name,  "is friendly")
                            continue
                        end

                        if SearchPlayer.Character and SearchPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                            local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SearchPlayer.Character.HumanoidRootPart.Position).Magnitude
                            table.insert(PlayerList, {Player = SearchPlayer, Magnitude = Mag})
                            if Min > Mag then
                                Min = Mag
                            end
                        end
                    end

                    table.sort(PlayerList, function(a, b)
                        return a.Magnitude < b.Magnitude
                    end)

                    if PlayerList[1].Magnitude < 1000 then
                        pcall(function()
                            while true do
                                task.wait()
                                if child:FindFirstChild("TouchInterest") then

                                    wait(.1)
                                    --print("Killing", PlayerList[1].Player.Name, child:FindFirstChild("TouchInterest"))
                                    firetouchinterest(PlayerList[1].Player.Character.HumanoidRootPart, child, 0)
                                    task.wait()
                                    firetouchinterest( PlayerList[1].Player.Character.HumanoidRootPart, child, 1)
                                    --print(PlayerList[1].Player.Character.Humanoid.Health .. "/" .. PlayerList[1].Player.Character.Humanoid.MaxHealth)

                                    break
                                end
                            end
                        end)
                    end
                end)
            end)


        else
            _G.FireballKill:Disconnect()
        end
    end)



    local Whitelist = {}
    local Toggle = Section:CreateToggle('Kill Aura', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
        if Value == true then
            KillAura = true
        else
            KillAura = false
        end

        while KillAura do

            a, b = pcall(function()
                local friendlies = {}

                local Team
                local Teams = game.Workspace.Teams
                for i,v in pairs(Teams:GetDescendants()) do
                    if v:IsA("StringValue") then
                        if v.Value == game.Players.LocalPlayer.Name then
                            Team = tostring(v.Parent.Name)
                        end
                    end
                end

                if Team ~= nil then
                    --print(Teams[Team])
                    for i,v in pairs(Teams:FindFirstChild(Team):GetChildren()) do
                        if v:IsA("StringValue") then
                            table.insert(friendlies, v.Value)
                        end
                    end
                end



                local PlayerList = {}
                local Min = math.huge
                for i,SearchPlayer in pairs(game.Players:GetChildren()) do
                    if SearchPlayer.Name == game.Players.LocalPlayer.Name then
                        continue
                    end

                    --if table.find(PlayersInSafeZone, SearchPlayer.Name) then
                        ----print("Nope", SearchPlayer.Name,  "is in Safezone")
                    --    continue
                    --end

                    if table.find(friendlies, SearchPlayer.Name) then
                        ----print("Nope", SearchPlayer.Name,  "Friendly")
                        continue
                    end

                    if SearchPlayer.Character and SearchPlayer.Character:FindFirstChild("Humanoid") and SearchPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                        local Mag = (game.Players.LocalPlayer.Character.HumanoidRootPart.Position - SearchPlayer.Character.HumanoidRootPart.Position).Magnitude
                        table.insert(PlayerList, {Player = SearchPlayer, Magnitude = Mag})
                        if Min > Mag then
                            Min = Mag
                        end
                    end
                end

                table.sort(PlayerList, function(a, b)
                    return a.Magnitude < b.Magnitude
                end)

                if PlayerList[1].Magnitude < 20 and PlayerList[1].Player and PlayerList[1].Player.Character.Humanoid.Health > 0 then
                    game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(PlayerList[1].Player.Character.Humanoid, "1")
                    --print(PlayerList[1].Player.Character.Humanoid.Health .. "/" .. PlayerList[1].Player.Character.Humanoid.MaxHealth)
                end
            end)
            wait(.2)

            if b then
                --print(a , b)
            end
        end
    end)



    local PlayerFireKill = ""
    local Textbox = Section:CreateTextbox('Player Fire Aura', '', function(Value)
        PlayerFireKill = Value
    end)

    local Whitelist = {}
    local Toggle = Section:CreateToggle('Single Fireball Aura', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
        if Value == true then
            FireAura = true
        else
            FireAura = false
        end

        if FireAura then
            --print("FIREAURA")
            targetPlayer = game.Players[PlayerFireKill]


            task.spawn(function()
                runningFireball = false
                while FireAura do
                    wait(1)
                    --print(FireAura)
                    if runningFireball == false and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character:FindFirstChild("Humanoid").Health > 0 then
                        runningFireball = true
                        task.spawn(function()
                            pcall(function()
                                local Balls = {"Fireball", "Lightningball"}
                                local Locations = {"Backpack", "Character"}
                                for i, player in pairs(game.Players:GetChildren()) do
                                    local earlyreturn = false
                                    for _,Ball in pairs(Balls) do
                                        for i,Location in pairs(Locations) do
                                            local CheckBall = player[Location]:FindFirstChild(Ball)
                                            if CheckBall then
                                                --print("FIREBALL")
                                                CheckBall:FindFirstChild("FireballEvent"):FireServer(Vector3.new(0, -10000, 0))
                                                earlyreturn = true
                                                wait()
                                                break
                                            end
                                        end

                                        if earlyreturn then
                                            break
                                        end
                                    end
                                end
                                runningFireball = false
                            end)
                        end)
                    end
                end
            end)

            _G.FireballSingleKill = game.Workspace.ChildAdded:connect(function(child)

                pcall(function()
                    ----print(child)
                    if not table.find(Fireballs, child.Name) then
                        return
                    end


                    while FireAura do
                        task.wait()
                        if child:FindFirstChild("TouchInterest") then

                            wait(.1)
                            --print("Killing", targetPlayer.Name, child:FindFirstChild("TouchInterest"))
                            firetouchinterest(targetPlayer.Character.HumanoidRootPart, child, 0)
                            task.wait()
                            firetouchinterest( targetPlayer.Character.HumanoidRootPart, child, 1)
                            --print(targetPlayer.Character.Humanoid.Health .. "/" .. targetPlayer.Character.Humanoid.MaxHealth)

                            break
                        end
                    end
                end)
            end)


        else
            _G.FireballSingleKill:Disconnect()
        end



    end)


    local PlayerKill = ""
    local Textbox = Section:CreateTextbox('Player Aura', '', function(Value)
        PlayerKill = Value
    end)

    local Toggle = Section:CreateToggle('Single Player Aura', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
        if Value == true then
            SingleKillAura = true
        else
            SingleKillAura = false
        end

        while SingleKillAura do

            a, b = pcall(function()
                local PlayerList = {}
                local Min = math.huge
                local LocalPlay = game.Players.LocalPlayer.Character.PrimaryPart.Position
                local Target = game.Players[PlayerKill].Character
                if (LocalPlay - Target.PrimaryPart.Position).Magnitude < 20 and Target.Humanoid.Health > 0 then
                    game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(Target.Humanoid, "1")
                    --print(Target.Humanoid.Health .. "/" .. Target.Humanoid.MaxHealth)
                end
            end)

            if b then
                --print(a , b)
            end
            wait(.2)
        end
    end)






    Obsfucation = Window:CreateTab('Obsfucation', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
    Section = Obsfucation:CreateSection('Obsfucation')

    local TextPlayerID = ""
    Textbox = Section:CreateTextbox('PlayerID:', '', function(PlayerIDS)
        TextPlayerID = tonumber(PlayerIDS)
    end)

    Button = Section:CreateButton('Copy Obsfucated ID', function()

        if TextPlayerID ~= nil then
            PlayerID = TextPlayerID
            PlayerID = PlayerID / factor
            PlayerID = PlayerID + take

            setclipboard(PlayerID)
        end
    end)
end



-- [[ UI Section FPS ]] --
TabFPS = Window:CreateTab('FPS Settings', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
Section = TabFPS:CreateSection('FPS Settings')

Button = Section:CreateButton('FPS + Ping Counter', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/FPS-Counter'))()
end)

Toggle = Section:CreateToggle('Render Toggle', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Render = true
    else
        Render = false
    end

    if Render then
        game:GetService("RunService"):Set3dRenderingEnabled(false)
    else
        game:GetService("RunService"):Set3dRenderingEnabled(true)
    end
end)


local function getDir(v)
	return (
		((v.Y == 0) and Vector3.new()) or
		((v.Y > 0) and -v) or
		v
	)
end

local function computeLowestPoint(part)
	local cf = part.CFrame
	local dist = part.Size/2
	local xVec = getDir(cf.RightVector) * dist.X
	local yVec = getDir(cf.UpVector) * dist.Y
	local zVec = getDir(cf.LookVector) * dist.Z
	return (cf + xVec + yVec + zVec).p
end

local folder = Instance.new("Folder")
folder.Name = "Platforms"
folder.Parent = workspace


function createBaseplate(Part, Size, Offset)
    local baseplate = Instance.new("Part")
    baseplate.Name = "Platform"
    baseplate.Anchored = true
    baseplate.Size = Vector3.new(Size, 0.5, Size)
    baseplate.TopSurface = "Smooth"
    baseplate.BottomSurface = "Smooth"
    baseplate.Material = "Glass"
    baseplate.Transparency = 0.75

    baseplate.CFrame = CFrame.new(computeLowestPoint(Part)) * Offset

    baseplate.Parent = folder
end

Button = Section:CreateButton('Delete Map v2', function()

    local success, error = pcall(function()
        local keepListDirect = {
            game:GetService("Workspace").Camera,
            game:GetService("Players").LocalPlayer.Character,
            game:GetService("Workspace").LBFolder,
            game:GetService("Workspace").SpawnPoints
        }


        local keepListName = {
            "Terrain",
            "Platform"
        }

        local listSearch = {
            "Dummy2",
            "Training Dummy",
            "spawnPoint",
        }


        local SpawnList = game:GetService("Workspace"):FindFirstChild("SpawnPoints")
        local SpawnLocation = game:GetService("Workspace"):FindFirstChild("SpawnLocation")
        local Dummy0kList = game:GetService("Workspace"):FindFirstChild("MAP"):FindFirstChild("dummies")
        local Dummy5kList = game:GetService("Workspace"):FindFirstChild("MAP"):FindFirstChild("waterfall1")

        local addTable = {SpawnList, Dummy0kList, Dummy5kList}


        for _,Players in pairs(game.Players:GetPlayers()) do
            table.insert(keepListDirect, Players.Character)
        end



        local Part
        for _,List in pairs(addTable) do
            for i,v in pairs(List:GetChildren()) do
                if not table.find(listSearch, v.Name) then
                    continue
                end


                if v:FindFirstChild("HumanoidRootPart") then
                    table.insert(keepListDirect, v)
                    Part = v:FindFirstChild("HumanoidRootPart")
                elseif v:IsA("Part") then
                    table.insert(keepListDirect, v)
                    Part = v
                else
                    ----print("Something went wrong -- [Map Delete]")
                    continue
                end

                --print(List.Name, Part)
                if List.Name == "SpawnPoints" then
                    --print("HERE", List, Part)
                    createBaseplate(Part, 20, CFrame.new(0,-5.655,0))
                    -- NORMAL == (-89)
                    -- -10 == (-84)
                else
                    ----print(List)
                    createBaseplate(Part, 20, CFrame.new(0,0,0))
                end

            end
            game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = SpawnList:FindFirstChild("spawnPoint").CFrame * CFrame.new(0,3,0)
        end

        for i,v in pairs(keepListDirect) do
            ----print(v)
            if not table.find(keepListName, v.Name) then
                table.insert(keepListName, v.Name)
            end
        end




        for _, object in pairs(game.Workspace:GetDescendants()) do

            if object:IsA("Folder") then
                continue
            end

            if table.find(keepListName, object.Name) then
                continue
            end

            local skip = false
            for i,v in pairs(keepListDirect) do
                if object:IsDescendantOf(v) then
                    --[[if v.Name == "Dummy2" or v.Name == "Training Dummy" then
                        if object.Name == "HumanoidRootPart" or object.Name == "Humanoid" then
                            ------print("IN: ",object.Name)
                            skip = true
                            continue
                        else
                            object:Destroy()
                        end
                   end

                    if v.Name == game:GetService("Players").LocalPlayer.Name then
                        if object:IsA("Accessory") then
                            object:Destroy()
                        end
                        pcall(function()
                            object.Transparency = 1
                        end)
                    end]]

                   skip = true
                end
            end

            if skip == true then
                continue
            end
            object:Destroy()
        end
    end)

    if not success then
        ----print(success, error)
    end
end)

Button = Section:CreateButton('Full FPS Boost', function()
    local a = game
    local b = a.Workspace
    local c = a.Lighting
    local d = b.Terrain
    d.WaterWaveSize = 0
    d.WaterWaveSpeed = 0
    d.WaterReflectance = 0
    d.WaterTransparency = 0
    c.GlobalShadows = false
    c.FogEnd = 9e9
    c.Brightness = 0
    settings().Rendering.QualityLevel = "Level01"
    for e, f in pairs(a:GetDescendants()) do
        if f:IsA("Part") or f:IsA("Union") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
            f.Material = "Plastic"
            f.Reflectance = 0
        elseif f:IsA("Decal") or f:IsA("Texture") then
            f.Transparency = 0
        elseif f:IsA("ParticleEmitter") or f:IsA("Trail") then
            f.Lifetime = NumberRange.new(0)
        elseif f:IsA("Explosion") then
            f.BlastPressure = 0
            f.BlastRadius = 0
        elseif f:IsA("Fire") or f:IsA("SpotLight") or f:IsA("Smoke") or f:IsA("Sparkles") then
            f.Enabled = false
        elseif f:IsA("MeshPart") then
            f.Material = "Plastic"
            f.Reflectance = 0
            f.TextureID = 10385902758728957
        end
    end
    for e, g in pairs(c:GetChildren()) do
        if g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or g:IsA("DepthOfFieldEffect")
        then
            g.Enabled = false
        end
    end
    sethiddenproperty(game.Lighting, "Technology", "Compatibility")
end)


-- [[ UI Section Misc ]]
TabMisc = Window:CreateTab('Pack Settings', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
Section = TabMisc:CreateSection('Pack Settings')

Button = Section:CreateButton('Create UK Pack', function()
    game:GetService("Players").LocalPlayer.PlayerGui.TeamGUI.createFrame.bodyFrame.createButton.createTeamEvent:FireServer('🇬🇧')
end)

Button = Section:CreateButton('Create AN Pack', function()
    game:GetService("Players").LocalPlayer.PlayerGui.TeamGUI.createFrame.bodyFrame.createButton.createTeamEvent:FireServer('-😈A N😈-')
end)

Button = Section:CreateButton('Create ONI Pack', function()
    game:GetService("Players").LocalPlayer.PlayerGui.TeamGUI.createFrame.bodyFrame.createButton.createTeamEvent:FireServer('-👹ONI👹-')
end)

local Invitedelay = 0.3
Toggle = Section:CreateToggle('Spam Invite', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value == true then
        Spam = true
    else
        Spam = false
    end


    local Player = game.Players.LocalPlayer
    local TeamGUI = Player.PlayerGui.TeamGUI
    local playersFrame = TeamGUI.playersFrame
    local clanFrame = TeamGUI.clanFrame
    local playerInfo = playersFrame.bodyFrame


    if Spam == false then
        --warn("Spam Off")
        Value = false

        playerInfo.Position = UDim2.new(0, 0, 0, 0)
        TeamGUI.Enabled = false
        clanFrame.Visible = true
        playersFrame.Visible = false
        playerInfo.Visible = false
    end

    leader = false
    for i,v in pairs(game.Workspace.Teams:GetChildren()) do
        if v.leader.Value == Player.Name then
            leader = true
        end
    end

    if leader and Spam then
        --warn("Enabled GUI")

        TeamGUI.Enabled = true
        clanFrame.Visible = false
        playersFrame.Visible = true
        playerInfo.Visible = true
    else
        --print("Spam is off or you are not leader")
        Value = false
        return
    end

    local function click(a)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,true,a,1)
        game:GetService("VirtualInputManager"):SendMouseButtonEvent(a.AbsolutePosition.X+a.AbsoluteSize.X/2,a.AbsolutePosition.Y+50,0,false,a,1)
    end

    a = 0
    --playerInfo.Position = UDim2.new(1, 0, 0, 0)


    --print("HERE")
    while Spam do
        if not Character and not Character:FindFirstChild("HumanoidRootPart") then
            break
        end
        --print("HERE", a)
        wait()

        a += 1

         ----print(a)

        for i,v in pairs(playerInfo.body2Frame.scrollingFrame:GetChildren()) do
            if v.Name == "playerFrame" then
                if v:FindFirstChild("invite") then
                    click(v.invite)

                    wait(Invitedelay)

                    v:Destroy()
                end

            end
        end

        wait()

        click(playerInfo.refreshButton)

        wait(.3)
    end
end)



-- [[ UI Section Settings ]]

TabSettings = Window:CreateTab('UI Settings', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
UIFunctions = TabSettings:CreateSection('UI Settings')

DestroyButton = UIFunctions:CreateButton('Destroy UI', function()
    Library:DestroyUI()
end)

ToggleKeybind = UIFunctions:CreateKeybind('Toggle UI', 'E', function()
    --print("Pressed")
    local UIName = 'OniHub'
    local CoreGui = game.Players.LocalPlayer.PlayerGui.CoreGui
    if CoreGui:FindFirstChild(UIName) ~= nil then
        CoreGui:FindFirstChild(UIName).Enabled = not CoreGui:FindFirstChild(UIName).Enabled
    end
end)

local TransparencySlider = UIFunctions:CreateSlider('Transparency', 0, 100, 50, Color3.fromRGB(0, 125, 255), function(Value)
    Library:SetTransparency(Value / 100, true)
end)

-- [[ UI Section GUI Scripts ]]
TabGUI = Window:CreateTab('Misc Script', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
Section = TabGUI:CreateSection('Misc Scripts')

Button = Section:CreateButton('Hitbox Extend', function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RectangularObject/Roblox-Hitbox-Expander/main/HitboxExtenderv2.lua",true))()
end)

local Button = Section:CreateButton('Graphic Enhancer', function()
-- Roblox Graphics Enhancher
sethiddenproperty(game:GetService("Workspace").Terrain, "Decoration", true)
sethiddenproperty(game:GetService("Lighting"), "Technology", "Future")
local light = game.Lighting
for i, v in pairs(light:GetChildren()) do
    v:Destroy()
end

local ter = workspace.Terrain
local color = Instance.new("ColorCorrectionEffect")
local bloom = Instance.new("BloomEffect")
local sun = Instance.new("SunRaysEffect")
local blur = Instance.new("BlurEffect")

color.Parent = light
bloom.Parent = light
sun.Parent = light
blur.Parent = light

-- enable or disable shit

local config = {

    Terrain = true;
    ColorCorrection = true;
    Sun = true;
    Lighting = true;
    BloomEffect = true;

}

-- settings {

color.Enabled = true
color.Contrast = 0.15
color.Brightness = 0.1
color.Saturation = 0.25
color.TintColor = Color3.fromRGB(255, 222, 211)

bloom.Enabled = true
bloom.Intensity = 0.1

sun.Enabled = true
sun.Intensity = 0.3
sun.Spread = 1

bloom.Enabled = true
bloom.Intensity = 0.08
bloom.Size = 32
bloom.Threshold = 1

blur.Enabled = true
blur.Size = 0.5

-- settings }


if config.ColorCorrection then
    color.Enabled = true
end


if config.Sun then
    sun.Enabled = true
end


if config.Terrain then
    -- settings {
    ter.WaterColor = Color3.fromRGB(10, 10, 24)
    ter.WaterWaveSize = 0.1
    ter.WaterWaveSpeed = 22
    ter.WaterTransparency = 0.9
    ter.WaterReflectance = 0.05
    -- settings }
end


if config.Lighting then
    -- settings {
    light.Ambient = Color3.fromRGB(0, 0, 0)
    light.Brightness = 4
    light.ColorShift_Bottom = Color3.fromRGB(0, 0, 0)
    light.ColorShift_Top = Color3.fromRGB(0, 0, 0)
    light.ExposureCompensation = 0
    light.FogColor = Color3.fromRGB(132, 132, 132)
    light.GlobalShadows = true
    light.OutdoorAmbient = Color3.fromRGB(112, 117, 128)
    light.Outlines = false
    -- settings }
end
end)

-- [[ UI Section Credits ]]

TabCredits = Window:CreateTab('Credits', false, 'rbxassetid://3926305904', Vector2.new(524, 44), Vector2.new(36, 36))
Section = TabCredits:CreateSection('Credits')
Paragraph = Section:CreateParagraph('Scripting & UI', 'Voix [Voix#0001]')
Paragraph = Section:CreateParagraph('Auto Farm & Bugs [CARRY]', 'Xen [Xen#0018]')
Paragraph = Section:CreateParagraph('Webhooks & Cleanup', 'Dex [Dexvo#0001]')