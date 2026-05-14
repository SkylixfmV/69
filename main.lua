local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "🚀 Panel Optimisé",
   LoadingTitle = "Ouverture...",
   ConfigurationSaving = { Enabled = false }
})

local Tab = Window:CreateTab("Principal", 4483362458)

local clicking = false
local clickDelay = 0.15 -- Délai plus stable pour éviter le lag

Tab:CreateToggle({
   Name = "Auto-Click (Mode Stable)",
   CurrentValue = false,
   Callback = function(Value)
      clicking = Value
      if clicking then
         task.spawn(function()
            while clicking do
               -- On vérifie que le jeu n'est pas en train de crash
               pcall(function()
                  local vim = game:GetService("VirtualInputManager")
                  vim:SendMouseButtonEvent(0, 0, 0, true, game, 0)
                  vim:SendMouseButtonEvent(0, 0, 0, false, game, 0)
               end)
               task.wait(clickDelay) -- INDISPENSABLE pour ne pas bugger
            end
         end)
      end
   end,
})

Tab:CreateSlider({
   Name = "Vitesse de clic",
   Min = 0.1,
   Max = 1,
   CurrentValue = 0.15,
   Callback = function(Value)
      clickDelay = Value
   end,
})
