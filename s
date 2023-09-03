-- Create a reference to Players service
local Players = game:GetService("Players")

-- Create a reference to StarterGui
local StarterGui = game:GetService("StarterGui")

-- Function to handle chat messages
function HandleChatMessage(message)
    if string.sub(message, 1, 4) == "!lua" then
        local code = string.sub(message, 6, 3005) -- Extract up to 3000 characters of Lua code after "!lua"
        
        -- Attempt to execute the Lua code
        local success, result = pcall(function()
            return loadstring(code)()
        end)
        
        if success then
            StarterGui:SetCore("SendNotification", {
                Title = "Notification",
                Text = "Script was executed successfully: " .. tostring(result),
                Duration = 3,
            })
        else
            StarterGui:SetCore("SendNotification", {
                Title = "Notification",
                Text = "Script Error, check console: " .. tostring(result),
                Duration = 3,
            })
        end
    end
end

-- Connect the chat event for the local player
Players.LocalPlayer.Chatted:Connect(function(message)
    HandleChatMessage(message)
end)
