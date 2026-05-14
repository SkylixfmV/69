local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 Mon Panel Pratique",
   LoadingTitle = "Initialisation du Hub...",
   ConfigurationSaving = { Enabled = true, FileName = "ConfigPanel" }
})

-- SECTION 1 : Auto-Clicker
local TabClick = Window:CreateTab("Auto-Click", 4483362458)
local clicking = false
local clickDelay = 0.1

TabClick:CreateToggle({
   Name = "Activer l'Auto-Click",
   CurrentValue = false,
   Callback = function(Value)
      clicking = Value
      if clicking then
         task.spawn(function()
            while clicking do
               local vim = game:GetService("VirtualInputManager")
               vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
               vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
               task.wait(clickDelay)
            end
         end)
      end
   end,
})

-- SECTION 2 : Améliorations Personnage
local TabPlayer = Window:CreateTab("Joueur", 4483362458)

TabPlayer:CreateSlider({
   Name = "Vitesse de marche (WalkSpeed)",
   Min = 16,
   Max = 200,
   CurrentValue = 16,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

TabPlayer:CreateSlider({
   Name = "Hauteur de saut (JumpPower)",
   Min = 50,
   Max = 500,
   CurrentValue = 50,
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
   end,
})

-- SECTION 3 : Utilitaires
local TabUtils = Window:CreateTab("Utile", 4483362458)

TabUtils:CreateButton({
   Name = "Anti-AFK (Évite d'être déconnecté)",
   Callback = function()
      local vu = game:GetService("VirtualUser")
      game.Players.LocalPlayer.Idled:Connect(function()
         vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
         wait(1)
         vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
      end)
      Rayfield:Notify({Title = "Anti-AFK", Content = "Activé !"})
   end,
})
