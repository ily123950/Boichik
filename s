-- Create a reference to Players service
local Players = game:GetService("Players")

-- Function to handle chat messages
function HandleChatMessage(message)
    if string.sub(message, 1, 4) == "!lua" then
        local code = string.sub(message, 6, 3005) -- Extract up to 3000 characters of Lua code after "!lua"
        
        -- Attempt to execute the Lua code
        local success, result = pcall(function()
            return loadstring(code)()
        end)
        
        if success then
            print("Command executed successfully:", result)
        else
            warn("Command execution error:", result)
        end
    end
end

-- Connect the chat event for the local player
Players.LocalPlayer.Chatted:Connect(function(message)
    HandleChatMessage(message)
end)
