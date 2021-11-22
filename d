local PlayerGui = game:GetService('Players').LocalPlayer:WaitForChild('PlayerGui')
local Leaderboard = PlayerGui:WaitForChild("LeaderboardGui")
local MainFrame = Leaderboard:WaitForChild("MainFrame")
local ScrollingFrame = MainFrame:WaitForChild("ScrollingFrame")

function createButtons()
    for i,v in pairs(ScrollingFrame:GetChildren()) do
        local Player
        local TextButton = Instance.new("TextButton",ScrollingFrame)
        TextButton.Name = "SpectateButton"
        TextButton.Size = v.Size
        TextButton.Text = ""
        TextButton.Transparency = 1
        TextButton.Position = v.Position
        TextButton.MouseButton1Click:Connect(function()
            for _,otherPlayer in pairs(game.Players:GetPlayers()) do
                if otherPlayer.Name == v.Text:gsub(" ","") then
                    Player = otherPlayer
                end
            end
            local Character = Player.Character or Player.CharacterAdded:Wait()
            workspace.CurrentCamera.CameraSubject = Character.Humanoid
        end)
    end
end

while wait(1) do
    for i,v in pairs(ScrollingFrame:GetChildren()) do
        if v.Name == "SpectateButton" then
            v:Destroy()
        end
    end
    createButtons()
end
