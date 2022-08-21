--if game.Players.LocalPlayer.UserId == 136340662 or game.Players.LocalPlayer.UserId == 2289808827 or game.Players.LocalPlayer.UserId == 1970254937 or game.Players.LocalPlayer.UserId == 257593238 or game.Players.LocalPlayer.UserId == 71388369 or game.Players.LocalPlayer.UserId == 111111 or game.Players.LocalPlayer.UserId == 111111 or game.Players.LocalPlayer.UserId == 111111 or game.Players.LocalPlayer.UserId == 2289808827 or game.Players.LocalPlayer.UserId == 2289808827 or game.Players.LocalPlayer.UserId == 2289808827 or game.Players.LocalPlayer.UserId == 3808345470 then
--print("Access Enabled")              -- Voix                                           SwimZz2                                          Firestar                                         ONIxJAY                                           Nik
--else
--game.Players.LocalPlayer:Kick("Denied")
--print("Denied")
--end

ID = {{"Xen", 849825772}, {"Voix", 136340662}, {"SwimZz2", 2289808827}, {"VoixAlt2", 849825772}, {"LoneSurvivor719", 1421700657}, {"Firestar", 1970254937}, {"ONIxJAY", 257593238}, {"Nik", 71388369}, {"Dex", 2970043326}, {"DexvoAlt", 3808345470}, {"FireAlt", 2345132767}, {"KillAlt2", 1681209476}, {"FireStar", 1970254937}}




VIP = {{"Xen", 849825772}, {"Voix", 136340662}, {"Dex", 2970043326}, {"DexvoAlt", 3808345470}}

function comma_value(amount)
    local formatted = amount
    while true do
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')
        if (k==0) then
            break
        end
    end
    return formatted
end

Access = false
for _, person in pairs(ID) do
    -- print(person[2])
	if game.Players.LocalPlayer.UserId == person[2] then
		-- print("Access Enabled")
		Access = true
    end
end


if Access == false then
	game:GetService("StarterGui"):SetCore("SendNotification", {
        Title = "Access Denied",
        Text = "Not Whitelisted",
        Icon = "rbxassetid://6238540373",
        Duration = 10
    })

    local ExecutionWebhook = 'https://discord.com/api/webhooks/1010125065045692417/FFh2IzIqXm4ceLCjDpqi1A7DOE7NstJbfIZd0LrGFPlhgbUwNNhOnk81cVZWeeMKORy0'
    local player = game:GetService"Players".LocalPlayer
    local executor = identifyexecutor() or "Unknown"
    local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
    Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
    local AvatarImage = Thing.imageUrl
    local msg = {
       ["username"] = "ONIxAPI",
       ["avatar_url"] = "https://media.discordapp.net/attachments/856034478408728576/1009394204193067058/oniii.jpg",
       ["content"] = " ",
       ["embeds"] = {
           {
               ["color"] = tonumber(tostring("0xFF0000")), --decimal
               ["title"] = "Failed Whitelist Check.",
               ["thumbnail"] = {
                   ["url"] = AvatarImage,
               },
               ["fields"] = {
                    {
                       ["name"] = "Username",
                       ["value"] = player.Name,
                       ["inline"] = true
                    },
                    {
                        ["name"] = "Display Name",
                        ["value"] = player.DisplayName,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "Roleplay Name",
                        ["value"] = game.Players.LocalPlayer.leaderstats.Roleplay.Value,
                        ["inline"] = true
                    },
                    {
                        ["name"] = "User Level",
                        ["value"] = comma_value(game.Players.LocalPlayer.leaderstats.Level.Value),
                        ["inline"] = true
                    },
                    {
                       ["name"] = "UID",
                       ["value"] = "||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                       ["inline"] = true
                    },
                    {
                       ["name"] = "Executor Used",
                       ["value"] = executor,
                       ["inline"] = true
                    },
               },
               ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
           }
       }
    }

    request = http_request or request or HttpPost or syn.request
    request({Url = ExecutionWebhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})

	return
end


--[[    Webhook     ]]

local ExecutionWebhook = 'https://discord.com/api/webhooks/1010125065045692417/FFh2IzIqXm4ceLCjDpqi1A7DOE7NstJbfIZd0LrGFPlhgbUwNNhOnk81cVZWeeMKORy0'
local player = game:GetService"Players".LocalPlayer
local executor = identifyexecutor() or "Unknown"
local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
local AvatarImage = Thing.imageUrl
local msg = {
   ["username"] = "ONIxAPI",
   ["avatar_url"] = "https://media.discordapp.net/attachments/856034478408728576/1009394204193067058/oniii.jpg",
   ["content"] = " ",
   ["embeds"] = {
       {
           ["color"] = tonumber(tostring("0x32CD32")), --decimal
           ["title"] = "New Execution Made.",
           ["thumbnail"] = {
               ["url"] = AvatarImage,
           },
           ["fields"] = {
                {
                   ["name"] = "Username",
                   ["value"] = player.Name,
                   ["inline"] = true
                },
                {
                    ["name"] = "Display Name",
                    ["value"] = player.DisplayName,
                    ["inline"] = true
                },
                {
                    ["name"] = "Roleplay Name",
                    ["value"] = game.Players.LocalPlayer.leaderstats.Roleplay.Value,
                    ["inline"] = true
                },
                {
                    ["name"] = "User Level",
                    ["value"] = comma_value(game.Players.LocalPlayer.leaderstats.Level.Value),
                    ["inline"] = true
                },
                {
                   ["name"] = "UID",
                   ["value"] = "||["..player.UserId.."](" .. tostring("https://www.roblox.com/users/" .. game.Players.LocalPlayer.UserId .. "/profile")..")||",
                   ["inline"] = true
                },
                {
                   ["name"] = "Executor Used",
                   ["value"] = executor,
                   ["inline"] = true
                },
           },
           ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
       }
   }
}

request = http_request or request or HttpPost or syn.request
request({Url = ExecutionWebhook, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})

--[[    Webhook     ]]


local Library = loadstring(game:HttpGet('https://raw.githubusercontent.com/VisualRoblox/Roblox/main/UI-Libraries/Visual%20UI%20Library/Source.lua'))()

local Window = Library:CreateWindow('     O N I  H U B ', '          ボットワールド', 'O N I  H U B', ' ', 'VisualUIConfigs', 'Default')

local Tab = Window:CreateTab('-Scripts', true, 'rbxassetid://3926305904', Vector2.new(1000, 44), Vector2.new(36, 36))

local Section = Tab:CreateSection('Scripts')

num = 0
farmingSeconds = 0
farmingTracker = 0
local Toggle = Section:CreateToggle('VIP XONI Farm 30k+ [AFK]', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
	if Value == true then
		loop = true
	else
        loop = false
	end

	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("newRewardGui") then
		game.Players.LocalPlayer.PlayerGui.newRewardGui:Destroy()
	end

    local newThread = coroutine.create(function ()
		while loop do
			if game.Players.LocalPlayer.Character ~= nil then
				if game.Players.LocalPlayer.Character:FindFirstChild("justFound") ~= nil then
					game.Players.LocalPlayer.Character.justFound:Destroy()
					-- print("1")
				end

				if tonumber(game.Players.LocalPlayer.PlayerGui.LevelBar.Experience.Text:split("/")[1] + 500000) > tonumber(game.Players.LocalPlayer.PlayerGui.LevelBar.Experience.Text:split("/")[2]) then
					wait(.3)
				end
			end

			game:GetService("ReplicatedStorage").TreasureEvent:FireServer(game:GetService("Workspace").Treasures.Treasure1)

			num = num + 1
			-- print("num: ", num)
			if num > 85000 then
				num = 0
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					game:GetService('Players').LocalPlayer.CharacterAdded:Wait()
				end
				wait(10)

				if game.Players.LocalPlayer.PlayerGui:FindFirstChild("newRewardGui") then
					game.Players.LocalPlayer.PlayerGui.newRewardGui:Destroy()
				end
			end

			task.wait()
		end
	end)
    coroutine.resume(newThread)
end)

local Toggle = Section:CreateToggle('ONI | Webhook', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
	if Value == true then
		loop = true
        farmingStatus = 'STARTED'
        farmingTime = os.date("%X")
        savedPlayerLevel = game.Players.LocalPlayer.leaderstats.Level.Value
	else
        loop = false
        farmingStatus = 'ENDED'
	end

    local looping = coroutine.create(function ()
    while loop do
        farmingSeconds = farmingSeconds + 1
        if farmingSeconds > 600 then
            farmingSeconds = 0
            farmingTracker = farmingTracker + 10
            local Thing = game:HttpGet(string.format("https://thumbnails.roblox.com/v1/users/avatar?userIds=%d&size=180x180&format=Png&isCircular=true", game.Players.LocalPlayer.UserId))
            Thing = game:GetService("HttpService"):JSONDecode(Thing).data[1]
            local AvatarImage = Thing.imageUrl
            local msg = {
               ["username"] = "ONIxAPI",
               ["avatar_url"] = "https://media.discordapp.net/attachments/856034478408728576/1009394204193067058/oniii.jpg",
               ["content"] = " ",
               ["embeds"] = {
                   {
                       ["color"] = tonumber(tostring("0x32CD32")), --decimal
                       ["title"] = 'Farming Update.',
                       ["thumbnail"] = {
                           ["url"] = AvatarImage,
                       },
                       ["fields"] = {
                            {
                                ["name"] = "Current Level",
                                ["value"] = comma_value(game.Players.LocalPlayer.leaderstats.Level.Value),
                                ["inline"] = true
                            },
                            {
                                ["name"] = "Saved Level",
                                ["value"] = savedPlayerLevel,
                                ["inline"] = true
                            },
                            {
                                ["name"] = "Levels Gained",
                                ["value"] = game.Players.LocalPlayer.leaderstats.Level.Value-savedPlayerLevel,
                                ["inline"] = true
                            },
                            {
                                ["name"] = "Farming Time",
                                ["value"] = farmingTracker .. ' Minutes',
                                ["inline"] = true
                            },

                       },
                       ['timestamp'] = os.date("%Y-%m-%dT%X.000Z")
                   }
               }
            }

            request = http_request or request or HttpPost or syn.request
            request({Url = _G.LocalWebhookId, Method = "POST", Headers = {["Content-Type"] = "application/json"}, Body = game.HttpService:JSONEncode(msg)})
        end
        wait(1)
    end
end)
coroutine.resume(looping)

end)

--XONI Farm VIP XONI Farm 30k+ [AFK]: 42s


--XTest: 40s

--SPEED: 37s






local Toggle = Section:CreateToggle('X-Test[E+F]', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
	if Value == true then
		loop = true
	else
		loop = false
	end

	if game.Players.LocalPlayer.PlayerGui:FindFirstChild("newRewardGui") then
		game.Players.LocalPlayer.PlayerGui.newRewardGui:Destroy()
	end

		while loop do
			if game.Players.LocalPlayer.Character ~= nil then
				if game.Players.LocalPlayer.Character:FindFirstChild("justFound") ~= nil then
					game.Players.LocalPlayer.Character.justFound:Destroy()
				end

				if tonumber(game.Players.LocalPlayer.PlayerGui.LevelBar.Experience.Text:split("/")[1] + 200000) > tonumber(game.Players.LocalPlayer.PlayerGui.LevelBar.Experience.Text:split("/")[2]) then
					wait(.3)
				end
			end
			game:GetService("ReplicatedStorage").EggEvent:FireServer(workspace.Eggs.Egg7)

            if game.Players.LocalPlayer.Character:FindFirstChild("justFound") ~= nil then
                game.Players.LocalPlayer.Character.justFound:Destroy()
            end

			game:GetService("ReplicatedStorage").TreasureEvent:FireServer(game:GetService("Workspace").Treasures.Treasure1)

			num = num + 1
			--print("num: ", num)
			if num > 85000 then
				num = 0
				if game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
					game.Players.LocalPlayer.Character.Humanoid.Health = 0
					game:GetService('Players').LocalPlayer.CharacterAdded:Wait()
				end
				wait(10)

				if game.Players.LocalPlayer.PlayerGui:FindFirstChild("newRewardGui") then
					game.Players.LocalPlayer.PlayerGui.newRewardGui:Destroy()
				end
			end

			task.wait()
		end
	--end)
end)


local Toggle = Section:CreateToggle('Dummy & Treasure Farm [30k+ AFK]', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if not nil then
        Toggle = true
        game:GetService("Workspace")[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame = game:GetService("Workspace").OLDMAP.pleaseno.Dummy2.HumanoidRootPart.CFrame
        playercframe = game:GetService("Workspace")[game.Players.LocalPlayer.Name].HumanoidRootPart.CFrame
        while Toggle do
            wait(1E-55)
            if tonumber(3 + 500000) > tonumber(game:GetService("Players")[game.Players.LocalPlayer.Name].PlayerGui.LevelBar.Experience.Text:split("/")[2]) then
              wait()
              wait(0.3)
            end
          game:GetService("ReplicatedStorage").TreasureEvent:FireServer(game:GetService("Workspace").Treasures.Treasure1)
          if game:GetService("Workspace")[game.Players.LocalPlayer.Name]:FindFirstChild("justFound") ~= nil then
            game:GetService("Workspace")[game.Players.LocalPlayer.Name].justFound:Destroy()
          end
          game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(game:GetService("Workspace").OLDMAP.pleaseno.Dummy2.Humanoid, 5)
          count = 3 + 1
          if count >= 2400 then
            count = 0
            game.Players.LocalPlayer.Character.Humanoid.Health = 0

          end
          wait(0.01)
          wait()
        end
      else
        Toggle = false
        count = 0
      end
    end)

local Toggle = Section:CreateToggle('Egg Script [5-30k] Use 30 sec auto reset', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)

    if Value == true then
      loop = true
    else
      loop = false
    end

    while loop do

        if game.Players.LocalPlayer.Character:FindFirstChild("justFound") ~= nil then
            game.Players.LocalPlayer.Character.justFound:Destroy()
        end

		game:GetService("ReplicatedStorage").EggEvent:FireServer(workspace.Eggs.Egg7)
		task.wait()
    end
end)

local Toggle = Section:CreateToggle('Aura [Use Carefully - Toggle on/off to work]', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)
    if Value then
        Toggle = true
        while Toggle do
          wait(0.1)
          for _FORV_4_, _FORV_5_ in pairs(game.Players:GetChildren()) do
            for _FORV_9_, _FORV_10_ in pairs(game.Workspace:GetChildren()) do
              if game:GetService("Workspace"):FindFirstChild(_FORV_10_.Name) and _FORV_10_.Name == _FORV_5_.Name and _FORV_10_.Name ~= game.Players.LocalPlayer.Name and game:GetService("Workspace"):FindFirstChild(_FORV_10_.Name) then
                game:GetService("ReplicatedStorage").jdskhfsIIIllliiIIIdchgdIiIIIlIlIli:FireServer(_FORV_10_.Humanoid, 5)
              end
            end
          end
          wait(0.1)
        end
      else
        Toggle = false
      end
    end)

local Button = Section:CreateButton('Create ONI Pack', function()
    local args = {
        [1] = "•×【ONI】×•"
    }

    game:GetService("Players").LocalPlayer.PlayerGui.TeamGUI.noTeamFrame.teamInfo.createBtn.createTeamEvent:FireServer(unpack(args))

end)

local Button = Section:CreateButton('Zone Bypass [Buggy]', function()
    game:GetService("Workspace")[game.Players.LocalPlayer.Name].FreeShield:Destroy()
    game:GetService("Workspace").Baseplate:Destroy()
    game:GetService("Workspace").SafeZonePart:Destroy()
  end)

  local Button = Section:CreateButton('Anti Click [Ride Request UI]', function()
    game:GetService("Workspace")[game.Players.LocalPlayer.Name].ClickDetector:Destroy()
end)

local Button = Section:CreateButton('Hide Tag [Name & Pack]', function()
        game:GetService("Workspace")[game.Players.LocalPlayer.Name].Head.BillboardGui:Destroy()
      end)

local Textbox = Section:CreateTextbox('Name Change', 'Input', function(Value)
    local args = {
        [1] = (Value)
    }

    game:GetService("Players").LocalPlayer.PlayerGui.RolePlayName.Frame.submitBtn.nameEvent:FireServer(unpack(args))
end)

local Textbox = Section:CreateTextbox('Force Ride', 'Case Sensitive', function(Value)
    local args = {
        [1] = (Value)
    }

    game:GetService("ReplicatedStorage").RideEvents.acceptEvent:FireServer(unpack(args))

end)

local Textbox = Section:CreateTextbox('Force Join Pack', 'Case Sensitive', function(Value)
    local args = {
        [1] = (Value)
    }

    game:GetService("ReplicatedStorage").acceptedEvent:FireServer(unpack(args))
end)

local Textbox = Section:CreateTextbox('Create Pack - Bypassed Limit', 'Case Sensitive', function(Value)
    local args = {
        [1] = (Value)
    }

    game:GetService("Players").LocalPlayer.PlayerGui.TeamGUI.noTeamFrame.teamInfo.createBtn.createTeamEvent:FireServer(unpack(args))

end)




-- FPS BOOST TAB



local Tab = Window:CreateTab('-FPS Booster', false, 'rbxassetid://3926305904', Vector2.new(1000, 44), Vector2.new(36, 36))

local Section = Tab:CreateSection('FPS Booster')

local Button = Section:CreateButton('FPS + Ping Counter', function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/1201for/littlegui/main/FPS-Counter'))()
end)

local Button = Section:CreateButton('Classic boost', function()
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
    settings().Rendering.QualityLevel = "Level01"
    for e, f in pairs(a:GetDescendants()) do
       if f:IsA("Part") or f:IsA("Union") or f:IsA("CornerWedgePart") or f:IsA("TrussPart") then
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
           f.Reflectance = 0
       end
       if f:IsA("Fire") then
           f:Destroy()
           wait()
       end
       if string.find(f.Name:lower(), "door") then
           f:Destroy()
       end
       if string.find(f.Name:lower(), "tree") then
           f:Destroy()
       end
       if f:IsA("ParticleEmitter") then
           f:Destroy()
           wait()
       end
    end
    for e, g in pairs(c:GetChildren()) do
       if
           g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or
               g:IsA("DepthOfFieldEffect")
        then
           g.Enabled = false
       end
    end
    sethiddenproperty(game.Lighting, "Technology", "Compatibility")
end)


local Button = Section:CreateButton('Full FPS Boost', function()
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
       if
           g:IsA("BlurEffect") or g:IsA("SunRaysEffect") or g:IsA("ColorCorrectionEffect") or g:IsA("BloomEffect") or
               g:IsA("DepthOfFieldEffect")
        then
           g.Enabled = false
       end
    end
    sethiddenproperty(game.Lighting, "Technology", "Compatibility")
end)

local Section = Tab:CreateSection('Auto Reset')

local num = 0
local Toggle = Section:CreateToggle('Auto Reset - 30 Seconds', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)

    if Value == true then
        loop = true
      else
        loop = false
      end

      while loop do
          game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
          wait(30)
              end
  end)

  local num = 0
local Toggle = Section:CreateToggle('Auto Reset - 1 Minute', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)

    if Value == true then
        loop = true
      else
        loop = false
      end

      while loop do
          game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
          wait(60)
              end
  end)

  local num = 0
local Toggle = Section:CreateToggle('Auto Reset - 2 Minute', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)

    if Value == true then
        loop = true
      else
        loop = false
      end

      while loop do
          game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
          wait(120)
              end
  end)

  local num = 0
  local Toggle = Section:CreateToggle('Auto Reset - 5 Minute', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)

      if Value == true then
          loop = true
        else
          loop = false
        end

        while loop do
            game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
            wait(300)
                end
    end)

    local num = 0
    local Toggle = Section:CreateToggle('Auto Reset - 10 Minute', false, Color3.fromRGB(0, 125, 255), 0.25, function(Value)

        if Value == true then
            loop = true
          else
            loop = false
          end

          while loop do
              game:GetService("Players").LocalPlayer.Character.Humanoid.Health = 0
              wait(600)
                  end
      end)


-- SETTINGS TAB


local LibraryFunctions = Window:CreateTab('-Settings', false, 'rbxassetid://3926305904', Vector2.new(1000, 124), Vector2.new(36, 36))

local UIFunctions = LibraryFunctions:CreateSection('Settings')

local DestroyButton = UIFunctions:CreateButton('Destroy UI', function()
    Library:DestroyUI()
end)

local ToggleKeybind = UIFunctions:CreateKeybind('Toggle UI', 'E', function()
    Library:ToggleUI()
end)

-- GUI Scripts

local Tab = Window:CreateTab('-GUI Scripts', false, 'rbxassetid://3926305904', Vector2.new(1000, 44), Vector2.new(36, 36))

local Section = Tab:CreateSection('GUI Scripts')

local Button = Section:CreateButton('Hitbox Extend', function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/RectangularObject/Roblox-Hitbox-Expander/main/HitboxExtenderv2.lua",true))()
end)

local Button = Section:CreateButton('Radio GUI', function()
    local clone = game:GetService("Workspace")["DRadio_Script"].DRadio_Gui:Clone()
    clone.Parent = game.Players.LocalPlayer.PlayerGui
end)

local Button = Section:CreateButton('Anti AFK', function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/Proxylol/OtherScripts/main/AntiAfk.lua'),true))()
end)

local Button = Section:CreateButton('Timer', function()
--ServerTimer
--Created by Gui_HD(Nova)
local function CreateInstance(cls,props)
    local inst = Instance.new(cls)
    for i,v in pairs(props) do
    inst[i] = v
    end
    return inst
    end

    local Clocker = CreateInstance('ScreenGui',{DisplayOrder=0,Enabled=true,ResetOnSpawn=true,Name='Clocker', Parent=game.CoreGui})
    local background = CreateInstance('ImageLabel',{Image='rbxassetid://2851926732',ImageColor3=Color3.new(0.117647, 0.117647, 0.117647),ImageRectOffset=Vector2.new(0, 0),ImageRectSize=Vector2.new(0, 0),ImageTransparency=0,ScaleType=Enum.ScaleType.Slice,SliceCenter=Rect.new(12, 12, 12, 12),Active=false,AnchorPoint=Vector2.new(0.5, 0.5),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=true,Draggable=false,Position=UDim2.new(0.0424528308, 0, 0.0470347628, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 28),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='background',Parent = Clocker})
    local timerlabel = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='Timer',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 13),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='timerlabel',Parent = background})
    local timer = CreateInstance('TextLabel',{Font=Enum.Font.SourceSans,FontSize=Enum.FontSize.Size14,Text='0:0:0',TextColor3=Color3.new(1, 1, 1),TextScaled=false,TextSize=14,TextStrokeColor3=Color3.new(0, 0, 0),TextStrokeTransparency=1,TextTransparency=0,TextWrapped=false,TextXAlignment=Enum.TextXAlignment.Center,TextYAlignment=Enum.TextYAlignment.Center,Active=false,AnchorPoint=Vector2.new(0, 0),BackgroundColor3=Color3.new(1, 1, 1),BackgroundTransparency=1,BorderColor3=Color3.new(0.105882, 0.164706, 0.207843),BorderSizePixel=1,ClipsDescendants=false,Draggable=false,Position=UDim2.new(0, 0, 0.535714269, 0),Rotation=0,Selectable=false,Size=UDim2.new(0, 70, 0, 13),SizeConstraint=Enum.SizeConstraint.RelativeXY,Visible=true,ZIndex=1,Name='timer',Parent = background})

    while wait()do
    local scripttime=game.Workspace.DistributedGameTime
    local seconds = scripttime%60
    local minutes = math.floor(scripttime/60%60)
    local hours = math.floor(scripttime/3600)
    local tempo = string.format("%.0f:%.0f:%.0f", hours ,minutes, seconds)
    timer.Text = tempo
	end
end)

-- CREDITS

local Tab = Window:CreateTab('-Credits', false, 'rbxassetid://3926305904', Vector2.new(1000, 44), Vector2.new(36, 36))
local Section = Tab:CreateSection('Credits')
local Paragraph = Section:CreateParagraph('Scripting & UI', 'Voix [Voix#0001]')
local Paragraph = Section:CreateParagraph('Auto Farm & Bugs [CARRY]', 'Xen [Xen#0018]')
local Paragraph = Section:CreateParagraph('Whitelist & Bot', 'Dex [Dexvo#0001]')
