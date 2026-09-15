local redzlib = loadstring(game:HttpGet("https://raw.githubusercontent.com/rafaelqcc/Other-scripts/refs/heads/main/RedzHubUI/RedzHubUI.lua"))()

local Window = redzlib:MakeWindow({
  Title = "redz Hub : test",
  SubTitle = "by redz9999",
  SaveFolder = "testing | redz lib v5.lua"
})

Window:AddMinimizeButton({
    Button = { Image = "rbxassetid://10734966248", BackgroundTransparency = 0 },
    Corner = { CornerRadius = UDim.new(35, 1) },
})

local Tab1 = Window:MakeTab({"Um", "cherry"})

Tab1:AddDiscordInvite({
    Name = "Name Hub",
    Description = "Join server",
    Logo = "rbxassetid://18751483361",
    Invite = "Link discord invite",
})

Window:SelectTab(Tab1)

local Section = Tab1:AddSection({"Section"})

local Paragraph = Tab1:AddParagraph({"Paragraph", "This is a Paragraph\nSecond Line"})

  local Dialog = Window:Dialog({
    Title = "Dialog",
    Text = "This is a Dialog",
    Options = {
      {"Confirm", function()
          print("confirm")      
      end},
      {"Maybe", function()
          print("maybe") 
      end},
      {"Cancel", function()
          print("cancel")
      end}
    }
  })

Tab1:AddButton({"Print", function(Value)
    print("Hello World!")
end})

local Toggle1 = Tab1:AddToggle({
  Name = "Toggle",
  Description = "This is a <font color='rgb(88, 101, 242)'>Toggle</font> Example",
  Default = false 
})
Toggle1:Callback(function(Value)
 print("Toggle 1:", Value)
end)

Tab1:AddToggle({
    Name = "Toggle",
    Default = false,
    Callback = function(v)
print("Toggle 2:", Value)
    end
})

Tab1:AddSlider({
  Name = "Speed",
  Min = 1,
  Max = 100,
  Increase = 1,
  Default = 16,
  Callback = function(Value)
      print("speed",Value)
  end
})

local Dropdown = Tab1:AddDropdown({
  Name = "Players List",
  Description = "Select the <font color='rgb(88, 101, 242)'>Number</font>",
  Options = {"one", "two", "three"},
  Default = "two",
  Flag = "dropdown test",
  Callback = function(Value)
      print("dropdown")
  end
})

Tab1:AddTextBox({
  Name = "Name item",
  Description = "1 Item on 1 Server", 
  PlaceholderText = "item only",
  Callback = function(Value)
      print("Name item:", Value)
  end
})
