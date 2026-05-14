local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Skylixfm",
   LoadingTitle = "Chargement des cheats...",
   ConfigurationSaving = { Enabled = false }
})

-- VARIABLES
local autoClick = false
local autoCollect = false
local clickDelay = 0.1

-- ONGLET PRINCIPAL (FARM)
local TabMain = Window:CreateTab("Auto-Farm", 4483362458)

TabMain:CreateToggle({
   Name = "Auto Click (Tap)",
   CurrentValue = false,
   Callback = function(Value)
      autoClick = Value
      if autoClick then
         task.spawn(function()
            while autoClick do
               local vim = game:GetService("VirtualInputManager")
               vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
               vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
               task.wait(clickDelay)
            end
         end)
      end
   end,
})

TabMain:CreateSlider({
   Name = "Vitesse Click",
   Min = 0.05,
   Max = 1,
   CurrentValue = 0.1,
   Callback = function(Value)
      clickDelay = Value
   end,
})

-- ONGLET JOUEUR
local TabPlayer = Window:CreateTab("Mouvement", 4483362458)

TabPlayer:CreateSlider({
   Name = "Vitesse Course",
   Min = 16,
   Max = 300,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local infJump = false
game:GetService("UserInputService").JumpRequest:Connect(function()
    if infJump then
        game.Players.LocalPlayer.Character:FindFirstChildOfClass('Humanoid'):ChangeState("Jumping")
    end
end)

TabPlayer:CreateToggle({
   Name = "Saut Infini",
   CurrentValue = false,
   Callback = function(Value)
      infJump = Value
   end,
})

-- ONGLET OPTIONS
local TabMisc = Window:CreateTab("Autres", 4483362458)

TabMisc:CreateButton({
   Name = "Anti-AFK (Évite le Kick)",
   Callback = function()
      local vu = game:GetService("VirtualUser")
      game.Players.LocalPlayer.Idled:Connect(function()
         vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         wait(1)
         vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      end)
      Rayfield:Notify({Title = "Système", Content = "Anti-AFK Activé !"})
   end,
})

TabMisc:CreateButton({
   Name = "Full Bright (Lumière max)",
   Callback = function()
      game:GetService("Lighting").Brightness = 2
      game:GetService("Lighting").ClockTime = 14
      game:GetService("Lighting").GlobalShadows = false
   end,
})
