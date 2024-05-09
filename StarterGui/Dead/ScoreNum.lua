local function textView()
	if script.Parent.Parent.Visible==true then
		local score=script.Parent.Parent.Parent.Ingame.ScoreNum.Text
		script.Parent.Text=score
		end
	end
	game:GetService("RunService").RenderStepped:Connect(textView)