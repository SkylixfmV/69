local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Skylixfm | Hub Fix",
   LoadingTitle = "Correction du script...",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Auto-Farm", 4483362458)

local clicking = false
local delay = 0.1

Tab:CreateToggle({
   Name = "Auto Click (Tap)",
   CurrentValue = false,
   Callback = function(Value)
      clicking = Value
      if clicking then
         task.spawn(function()
            while clicking do
               -- Méthode 1 : Simulation de clic gauche
               local vim = game:GetService("VirtualInputManager")
               vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
               vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
               
               -- Méthode 2 (Secours) : Si le jeu utilise des outils
               local tool = game.Players.LocalPlayer.Character:FindFirstChildOfClass("Tool")
               if tool then tool:Activate() end
               
               task.wait(delay)
            end
         end)
      end
   end,
})

Tab:CreateSlider({
   Name = "Vitesse Click (Secondes)",
   Min = 0.05,
   Max = 1,
   CurrentValue = 0.1,
   Suffix = " sec",
   Callback = function(Value)
      delay = Value
   end,
})

-- Ajout d'un bouton de test pour voir si le script réagit
Tab:CreateButton({
   Name = "Vérifier si le script fonctionne",
   Callback = function()
      Rayfield:Notify({Title = "Test", Content = "Le script est actif !"})
      print("Le script répond bien.")
   end,
})
