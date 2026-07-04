-- [[ Operator : Reanimate ]] --

--[[
  Credits:
  // Melon - Created this script
  // Emper - Created the reanimation used
  // Nebula_Zoroark - Created the animation lerp base
  
  Inspiration:
  // Sukma Hubs CSGO Script
  // Warzone

  Edit: Removed Loadstrings

  Note: the original code for this script was god awful so
  if there's bugs pls let me know so i can fix them (ps the original is from 2024 i think so you can imagine how bad it was before i recently edited it)
  the code may be unoptimized at some parts and uses a lot of if statements
  ive learned a lot since i initially made this so my upcoming scripts are a lot better
  mostly just wanted to finish the script so it wasnt left rotting in my files.
  (not to mention i didnt wanna fully remake/rewrite this script so i just built over it)
  
  Free hats (rifle updated by @gojoissigma_13913):
  // Rifle P1: https://www.roblox.com/catalog/15254947445/24k-Gold-Plunger
  // Rifle P2: https://www.roblox.com/catalog/5552252553/Kinetic-Staff
  // Knife: https://www.roblox.com/catalog/11702906576/Battle-Beam
  
  Free rig:
  // https://www.roblox.com/catalog/3033910400/International-Fedora-Germany
  // https://www.roblox.com/catalog/3409612660/International-Fedora-USA
  // https://www.roblox.com/catalog/3398308134/International-Fedora-Canada
  // https://www.roblox.com/catalog/3033908130/International-Fedora-France
  // https://www.roblox.com/catalog/4819740796/Robox

  Paid hats are found in this game:
  // https://www.roblox.com/games/15541318313/Melons-Baseplate
]] 

local Directories = {
	Main = "FEVerse/",
	RBXMs ="FEVerse/RBXMs/",
	Sounds = "FEVerse/Sounds/",
	Songs = "FEVerse/Songs/",
}

-- hi
local FEManager = {}
local makefolder = makefolder
local isfolder = isfolder
local isfile = isfile
local writefile = writefile

FEManager.EnsureFolder = function(path)
	if not isfolder(path) then
		makefolder(path)
		return print(path.." doesn't exist, making it now.")
	else
		print(path.." already exists.")
	end
end

FEManager.DownloadFile = function(Directory, FileName, Link)
	if not isfile(Directory..FileName) then
		writefile(Directory..FileName, game:HttpGet(Link))
		return print(FileName.." is not downloaded, downloading.")
	else
		print(FileName.." already exists.")
	end
end

local operatorRbxmxStr = [[
<roblox xmlns:xmime="http://www.w3.org/2005/05/xmlmime" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:noNamespaceSchemaLocation="http://www.roblox.com/roblox.xsd" version="4">
	<Meta name="ExplicitAutoJoints">true</Meta>
	<External>null</External>
	<External>nil</External>
	<Item class="ScreenGui" referent="RBXCA5B47A4113D4D5AA6AE5A1A17C86921">
		<Properties>
			<bool name="ClipToDeviceSafeArea">false</bool>
			<int name="DisplayOrder">0</int>
			<token name="SafeAreaCompatibility">1</token>
			<token name="ScreenInsets">2</token>
			<bool name="Enabled">true</bool>
			<bool name="ResetOnSpawn">false</bool>
			<token name="ZIndexBehavior">1</token>
			<bool name="AutoLocalize">true</bool>
			<Ref name="RootLocalizationTable">null</Ref>
			<token name="SelectionBehaviorDown">0</token>
			<token name="SelectionBehaviorLeft">0</token>
			<token name="SelectionBehaviorRight">0</token>
			<token name="SelectionBehaviorUp">0</token>
			<bool name="SelectionGroup">false</bool>
			<BinaryString name="AttributesSerialize"></BinaryString>
			<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
			<bool name="DefinesCapabilities">false</bool>
			<string name="Name">MobileUI</string>
			<int64 name="SourceAssetId">-1</int64>
			<BinaryString name="Tags"></BinaryString>
		</Properties>
		<Item class="Frame" referent="RBX84A8CA64D00D4531932185E632DAED4E">
			<Properties>
				<token name="Style">0</token>
				<bool name="Active">false</bool>
				<Vector2 name="AnchorPoint">
					<X>0</X>
					<Y>0</Y>
				</Vector2>
				<token name="AutomaticSize">0</token>
				<Color3 name="BackgroundColor3">
					<R>0.639215708</R>
					<G>0.635294139</G>
					<B>0.647058845</B>
				</Color3>
				<float name="BackgroundTransparency">1</float>
				<Color3 name="BorderColor3">
					<R>0.105882354</R>
					<G>0.164705887</G>
					<B>0.20784314</B>
				</Color3>
				<token name="BorderMode">0</token>
				<int name="BorderSizePixel">1</int>
				<bool name="ClipsDescendants">false</bool>
				<bool name="Draggable">false</bool>
				<bool name="Interactable">true</bool>
				<int name="LayoutOrder">0</int>
				<Ref name="NextSelectionDown">null</Ref>
				<Ref name="NextSelectionLeft">null</Ref>
				<Ref name="NextSelectionRight">null</Ref>
				<Ref name="NextSelectionUp">null</Ref>
				<UDim2 name="Position">
					<XS>0</XS>
					<XO>0</XO>
					<YS>0</YS>
					<YO>0</YO>
				</UDim2>
				<float name="Rotation">0</float>
				<bool name="Selectable">false</bool>
				<Ref name="SelectionImageObject">null</Ref>
				<int name="SelectionOrder">0</int>
				<UDim2 name="Size">
					<XS>1</XS>
					<XO>0</XO>
					<YS>1</YS>
					<YO>0</YO>
				</UDim2>
				<token name="SizeConstraint">0</token>
				<bool name="Visible">true</bool>
				<int name="ZIndex">1</int>
				<bool name="AutoLocalize">true</bool>
				<Ref name="RootLocalizationTable">null</Ref>
				<token name="SelectionBehaviorDown">0</token>
				<token name="SelectionBehaviorLeft">0</token>
				<token name="SelectionBehaviorRight">0</token>
				<token name="SelectionBehaviorUp">0</token>
				<bool name="SelectionGroup">false</bool>
				<BinaryString name="AttributesSerialize"></BinaryString>
				<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
				<bool name="DefinesCapabilities">false</bool>
				<string name="Name">AbilitiesUI</string>
				<int64 name="SourceAssetId">-1</int64>
				<BinaryString name="Tags"></BinaryString>
			</Properties>
			<Item class="TextButton" referent="RBX094784A7657A4F9983A58E2D0400120F">
				<Properties>
					<Font name="FontFace">
						<Family><url>rbxassetid://12187371840</url></Family>
						<Weight>400</Weight>
						<Style>Normal</Style>
					</Font>
					<float name="LineHeight">1</float>
					<string name="LocalizationMatchIdentifier"></string>
					<string name="LocalizationMatchedSourceText"></string>
					<int name="MaxVisibleGraphemes">-1</int>
					<string name="OpenTypeFeatures"></string>
					<bool name="RichText">false</bool>
					<string name="Text">Sprint</string>
					<Color3 name="TextColor3">
						<R>1</R>
						<G>1</G>
						<B>1</B>
					</Color3>
					<token name="TextDirection">0</token>
					<bool name="TextScaled">true</bool>
					<float name="TextSize">8</float>
					<Color3 name="TextStrokeColor3">
						<R>0</R>
						<G>0</G>
						<B>0</B>
					</Color3>
					<float name="TextStrokeTransparency">0</float>
					<float name="TextTransparency">0</float>
					<token name="TextTruncate">0</token>
					<bool name="TextWrapped">true</bool>
					<token name="TextXAlignment">2</token>
					<token name="TextYAlignment">1</token>
					<bool name="AutoButtonColor">true</bool>
					<Ref name="HoverHapticEffect">null</Ref>
					<bool name="Modal">false</bool>
					<Ref name="PressHapticEffect">null</Ref>
					<bool name="Selected">false</bool>
					<token name="Style">0</token>
					<bool name="Active">true</bool>
					<Vector2 name="AnchorPoint">
						<X>0</X>
						<Y>0</Y>
					</Vector2>
					<token name="AutomaticSize">0</token>
					<Color3 name="BackgroundColor3">
						<R>1</R>
						<G>1</G>
						<B>1</B>
					</Color3>
					<float name="BackgroundTransparency">0</float>
					<Color3 name="BorderColor3">
						<R>0</R>
						<G>0</G>
						<B>0</B>
					</Color3>
					<token name="BorderMode">0</token>
					<int name="BorderSizePixel">3</int>
					<bool name="ClipsDescendants">false</bool>
					<bool name="Draggable">false</bool>
					<bool name="Interactable">true</bool>
					<int name="LayoutOrder">0</int>
					<Ref name="NextSelectionDown">null</Ref>
					<Ref name="NextSelectionLeft">null</Ref>
					<Ref name="NextSelectionRight">null</Ref>
					<Ref name="NextSelectionUp">null</Ref>
					<UDim2 name="Position">
						<XS>1</XS>
						<XO>-95</XO>
						<YS>0.75</YS>
						<YO>-90</YO>
					</UDim2>
					<float name="Rotation">0</float>
					<bool name="Selectable">true</bool>
					<Ref name="SelectionImageObject">null</Ref>
					<int name="SelectionOrder">0</int>
					<UDim2 name="Size">
						<XS>0</XS>
						<XO>70</XO>
						<YS>0</YS>
						<YO>70</YO>
					</UDim2>
					<token name="SizeConstraint">0</token>
					<bool name="Visible">true</bool>
					<int name="ZIndex">1</int>
					<bool name="AutoLocalize">true</bool>
					<Ref name="RootLocalizationTable">null</Ref>
					<token name="SelectionBehaviorDown">0</token>
					<token name="SelectionBehaviorLeft">0</token>
					<token name="SelectionBehaviorRight">0</token>
					<token name="SelectionBehaviorUp">0</token>
					<bool name="SelectionGroup">false</bool>
					<BinaryString name="AttributesSerialize"></BinaryString>
					<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
					<bool name="DefinesCapabilities">false</bool>
					<string name="Name">Sprint</string>
					<int64 name="SourceAssetId">-1</int64>
					<BinaryString name="Tags"></BinaryString>
				</Properties>
				<Item class="UICorner" referent="RBX1460D2F55FD34252B17B69A6DE9084D8">
					<Properties>
						<UDim name="CornerRadius">
							<S>0</S>
							<O>5</O>
						</UDim>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UICorner</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
				</Item>
				<Item class="UIGradient" referent="RBX77A2124607244FCFBAE8B61578665480">
					<Properties>
						<ColorSequence name="Color">0 0 0 0 0 1 1 1 1 0 </ColorSequence>
						<bool name="Enabled">true</bool>
						<Vector2 name="Offset">
							<X>0</X>
							<Y>0</Y>
						</Vector2>
						<float name="Rotation">-90</float>
						<NumberSequence name="Transparency">0 0 0 1 0 0 </NumberSequence>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UIGradient</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
				</Item>
				<Item class="UIStroke" referent="RBX92FD155744BE4403A6F0CC6900B43060">
					<Properties>
						<token name="ApplyStrokeMode">1</token>
						<UDim name="BorderOffset">
							<S>0</S>
							<O>5</O>
						</UDim>
						<token name="BorderStrokePosition">0</token>
						<Color3 name="Color">
							<R>1</R>
							<G>1</G>
							<B>1</B>
						</Color3>
						<bool name="Enabled">true</bool>
						<token name="LineJoinMode">0</token>
						<token name="StrokeSizingMode">0</token>
						<float name="Thickness">3</float>
						<float name="Transparency">0</float>
						<int name="ZIndex">1</int>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UIStroke</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
					<Item class="UIGradient" referent="RBXF0E1103D92F04AF8824973F08A646CCA">
						<Properties>
							<ColorSequence name="Color">0 0 0 0 0 1 1 1 1 0 </ColorSequence>
							<bool name="Enabled">true</bool>
							<Vector2 name="Offset">
								<X>0</X>
								<Y>0</Y>
							</Vector2>
							<float name="Rotation">120</float>
							<NumberSequence name="Transparency">0 0 0 1 0 0 </NumberSequence>
							<BinaryString name="AttributesSerialize"></BinaryString>
							<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
							<bool name="DefinesCapabilities">false</bool>
							<string name="Name">UIGradient</string>
							<int64 name="SourceAssetId">-1</int64>
							<BinaryString name="Tags"></BinaryString>
						</Properties>
					</Item>
				</Item>
			</Item>
			<Item class="TextButton" referent="RBXE0A309EB46C942A98DCA95F9B8DF7813">
				<Properties>
					<Font name="FontFace">
						<Family><url>rbxassetid://12187371840</url></Family>
						<Weight>400</Weight>
						<Style>Normal</Style>
					</Font>
					<float name="LineHeight">1</float>
					<string name="LocalizationMatchIdentifier"></string>
					<string name="LocalizationMatchedSourceText"></string>
					<int name="MaxVisibleGraphemes">-1</int>
					<string name="OpenTypeFeatures"></string>
					<bool name="RichText">false</bool>
					<string name="Text">Switch Weapon</string>
					<Color3 name="TextColor3">
						<R>1</R>
						<G>1</G>
						<B>1</B>
					</Color3>
					<token name="TextDirection">0</token>
					<bool name="TextScaled">true</bool>
					<float name="TextSize">8</float>
					<Color3 name="TextStrokeColor3">
						<R>0</R>
						<G>0</G>
						<B>0</B>
					</Color3>
					<float name="TextStrokeTransparency">0</float>
					<float name="TextTransparency">0</float>
					<token name="TextTruncate">0</token>
					<bool name="TextWrapped">true</bool>
					<token name="TextXAlignment">2</token>
					<token name="TextYAlignment">1</token>
					<bool name="AutoButtonColor">true</bool>
					<Ref name="HoverHapticEffect">null</Ref>
					<bool name="Modal">false</bool>
					<Ref name="PressHapticEffect">null</Ref>
					<bool name="Selected">false</bool>
					<token name="Style">0</token>
					<bool name="Active">true</bool>
					<Vector2 name="AnchorPoint">
						<X>0</X>
						<Y>0</Y>
					</Vector2>
					<token name="AutomaticSize">0</token>
					<Color3 name="BackgroundColor3">
						<R>1</R>
						<G>1</G>
						<B>1</B>
					</Color3>
					<float name="BackgroundTransparency">0</float>
					<Color3 name="BorderColor3">
						<R>0</R>
						<G>0</G>
						<B>0</B>
					</Color3>
					<token name="BorderMode">0</token>
					<int name="BorderSizePixel">3</int>
					<bool name="ClipsDescendants">false</bool>
					<bool name="Draggable">false</bool>
					<bool name="Interactable">true</bool>
					<int name="LayoutOrder">0</int>
					<Ref name="NextSelectionDown">null</Ref>
					<Ref name="NextSelectionLeft">null</Ref>
					<Ref name="NextSelectionRight">null</Ref>
					<Ref name="NextSelectionUp">null</Ref>
					<UDim2 name="Position">
						<XS>0.875</XS>
						<XO>-95</XO>
						<YS>1</YS>
						<YO>-90</YO>
					</UDim2>
					<float name="Rotation">0</float>
					<bool name="Selectable">true</bool>
					<Ref name="SelectionImageObject">null</Ref>
					<int name="SelectionOrder">0</int>
					<UDim2 name="Size">
						<XS>0</XS>
						<XO>70</XO>
						<YS>0</YS>
						<YO>70</YO>
					</UDim2>
					<token name="SizeConstraint">0</token>
					<bool name="Visible">true</bool>
					<int name="ZIndex">1</int>
					<bool name="AutoLocalize">true</bool>
					<Ref name="RootLocalizationTable">null</Ref>
					<token name="SelectionBehaviorDown">0</token>
					<token name="SelectionBehaviorLeft">0</token>
					<token name="SelectionBehaviorRight">0</token>
					<token name="SelectionBehaviorUp">0</token>
					<bool name="SelectionGroup">false</bool>
					<BinaryString name="AttributesSerialize"></BinaryString>
					<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
					<bool name="DefinesCapabilities">false</bool>
					<string name="Name">SwitchWeapon</string>
					<int64 name="SourceAssetId">-1</int64>
					<BinaryString name="Tags"></BinaryString>
				</Properties>
				<Item class="UICorner" referent="RBX38B4E416A1254CC7AC69AA3458E03CE4">
					<Properties>
						<UDim name="CornerRadius">
							<S>0</S>
							<O>5</O>
						</UDim>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UICorner</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
				</Item>
				<Item class="UIGradient" referent="RBXFC43F4F06BE742CDA77013E9B7F74FDE">
					<Properties>
						<ColorSequence name="Color">0 0 0 0 0 1 1 1 1 0 </ColorSequence>
						<bool name="Enabled">true</bool>
						<Vector2 name="Offset">
							<X>0</X>
							<Y>0</Y>
						</Vector2>
						<float name="Rotation">-90</float>
						<NumberSequence name="Transparency">0 0 0 1 0 0 </NumberSequence>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UIGradient</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
				</Item>
				<Item class="UIStroke" referent="RBX3DD253C0CA5746FD9A590DA00276E53D">
					<Properties>
						<token name="ApplyStrokeMode">1</token>
						<UDim name="BorderOffset">
							<S>0</S>
							<O>5</O>
						</UDim>
						<token name="BorderStrokePosition">0</token>
						<Color3 name="Color">
							<R>1</R>
							<G>1</G>
							<B>1</B>
						</Color3>
						<bool name="Enabled">true</bool>
						<token name="LineJoinMode">0</token>
						<token name="StrokeSizingMode">0</token>
						<float name="Thickness">3</float>
						<float name="Transparency">0</float>
						<int name="ZIndex">1</int>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UIStroke</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
					<Item class="UIGradient" referent="RBX48D1338DC3654BD393613148D1DFCB75">
						<Properties>
							<ColorSequence name="Color">0 0 0 0 0 1 1 1 1 0 </ColorSequence>
							<bool name="Enabled">true</bool>
							<Vector2 name="Offset">
								<X>0</X>
								<Y>0</Y>
							</Vector2>
							<float name="Rotation">120</float>
							<NumberSequence name="Transparency">0 0 0 1 0 0 </NumberSequence>
							<BinaryString name="AttributesSerialize"></BinaryString>
							<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
							<bool name="DefinesCapabilities">false</bool>
							<string name="Name">UIGradient</string>
							<int64 name="SourceAssetId">-1</int64>
							<BinaryString name="Tags"></BinaryString>
						</Properties>
					</Item>
				</Item>
			</Item>
			<Item class="TextButton" referent="RBXDDB1D38C0DBE482EABE0C19636857934">
				<Properties>
					<Font name="FontFace">
						<Family><url>rbxassetid://12187371840</url></Family>
						<Weight>400</Weight>
						<Style>Normal</Style>
					</Font>
					<float name="LineHeight">1</float>
					<string name="LocalizationMatchIdentifier"></string>
					<string name="LocalizationMatchedSourceText"></string>
					<int name="MaxVisibleGraphemes">-1</int>
					<string name="OpenTypeFeatures"></string>
					<bool name="RichText">false</bool>
					<string name="Text">Crouch</string>
					<Color3 name="TextColor3">
						<R>1</R>
						<G>1</G>
						<B>1</B>
					</Color3>
					<token name="TextDirection">0</token>
					<bool name="TextScaled">true</bool>
					<float name="TextSize">8</float>
					<Color3 name="TextStrokeColor3">
						<R>0</R>
						<G>0</G>
						<B>0</B>
					</Color3>
					<float name="TextStrokeTransparency">0</float>
					<float name="TextTransparency">0</float>
					<token name="TextTruncate">0</token>
					<bool name="TextWrapped">true</bool>
					<token name="TextXAlignment">2</token>
					<token name="TextYAlignment">1</token>
					<bool name="AutoButtonColor">true</bool>
					<Ref name="HoverHapticEffect">null</Ref>
					<bool name="Modal">false</bool>
					<Ref name="PressHapticEffect">null</Ref>
					<bool name="Selected">false</bool>
					<token name="Style">0</token>
					<bool name="Active">true</bool>
					<Vector2 name="AnchorPoint">
						<X>0</X>
						<Y>0</Y>
					</Vector2>
					<token name="AutomaticSize">0</token>
					<Color3 name="BackgroundColor3">
						<R>1</R>
						<G>1</G>
						<B>1</B>
					</Color3>
					<float name="BackgroundTransparency">0</float>
					<Color3 name="BorderColor3">
						<R>0</R>
						<G>0</G>
						<B>0</B>
					</Color3>
					<token name="BorderMode">0</token>
					<int name="BorderSizePixel">3</int>
					<bool name="ClipsDescendants">false</bool>
					<bool name="Draggable">false</bool>
					<bool name="Interactable">true</bool>
					<int name="LayoutOrder">0</int>
					<Ref name="NextSelectionDown">null</Ref>
					<Ref name="NextSelectionLeft">null</Ref>
					<Ref name="NextSelectionRight">null</Ref>
					<Ref name="NextSelectionUp">null</Ref>
					<UDim2 name="Position">
						<XS>0.875</XS>
						<XO>-95</XO>
						<YS>0.75</YS>
						<YO>-90</YO>
					</UDim2>
					<float name="Rotation">0</float>
					<bool name="Selectable">true</bool>
					<Ref name="SelectionImageObject">null</Ref>
					<int name="SelectionOrder">0</int>
					<UDim2 name="Size">
						<XS>0</XS>
						<XO>70</XO>
						<YS>0</YS>
						<YO>70</YO>
					</UDim2>
					<token name="SizeConstraint">0</token>
					<bool name="Visible">true</bool>
					<int name="ZIndex">1</int>
					<bool name="AutoLocalize">true</bool>
					<Ref name="RootLocalizationTable">null</Ref>
					<token name="SelectionBehaviorDown">0</token>
					<token name="SelectionBehaviorLeft">0</token>
					<token name="SelectionBehaviorRight">0</token>
					<token name="SelectionBehaviorUp">0</token>
					<bool name="SelectionGroup">false</bool>
					<BinaryString name="AttributesSerialize"></BinaryString>
					<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
					<bool name="DefinesCapabilities">false</bool>
					<string name="Name">Crouch</string>
					<int64 name="SourceAssetId">-1</int64>
					<BinaryString name="Tags"></BinaryString>
				</Properties>
				<Item class="UICorner" referent="RBX48805807CC634801A59426CAA71C0E82">
					<Properties>
						<UDim name="CornerRadius">
							<S>0</S>
							<O>5</O>
						</UDim>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UICorner</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
				</Item>
				<Item class="UIGradient" referent="RBX5A2180E14A6A4A20A21D58900675A0C9">
					<Properties>
						<ColorSequence name="Color">0 0 0 0 0 1 1 1 1 0 </ColorSequence>
						<bool name="Enabled">true</bool>
						<Vector2 name="Offset">
							<X>0</X>
							<Y>0</Y>
						</Vector2>
						<float name="Rotation">-90</float>
						<NumberSequence name="Transparency">0 0 0 1 0 0 </NumberSequence>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UIGradient</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
				</Item>
				<Item class="UIStroke" referent="RBXDCB4A656C2EA4D39894C57CB8F21F4FA">
					<Properties>
						<token name="ApplyStrokeMode">1</token>
						<UDim name="BorderOffset">
							<S>0</S>
							<O>5</O>
						</UDim>
						<token name="BorderStrokePosition">0</token>
						<Color3 name="Color">
							<R>1</R>
							<G>1</G>
							<B>1</B>
						</Color3>
						<bool name="Enabled">true</bool>
						<token name="LineJoinMode">0</token>
						<token name="StrokeSizingMode">0</token>
						<float name="Thickness">3</float>
						<float name="Transparency">0</float>
						<int name="ZIndex">1</int>
						<BinaryString name="AttributesSerialize"></BinaryString>
						<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
						<bool name="DefinesCapabilities">false</bool>
						<string name="Name">UIStroke</string>
						<int64 name="SourceAssetId">-1</int64>
						<BinaryString name="Tags"></BinaryString>
					</Properties>
					<Item class="UIGradient" referent="RBX9E2CFCE808AA4311B12E969C36BD7F9C">
						<Properties>
							<ColorSequence name="Color">0 0 0 0 0 1 1 1 1 0 </ColorSequence>
							<bool name="Enabled">true</bool>
							<Vector2 name="Offset">
								<X>0</X>
								<Y>0</Y>
							</Vector2>
							<float name="Rotation">120</float>
							<NumberSequence name="Transparency">0 0 0 1 0 0 </NumberSequence>
							<BinaryString name="AttributesSerialize"></BinaryString>
							<SecurityCapabilities name="Capabilities">0</SecurityCapabilities>
							<bool name="DefinesCapabilities">false</bool>
							<string name="Name">UIGradient</string>
							<int64 name="SourceAssetId">-1</int64>
							<BinaryString name="Tags"></BinaryString>
						</Properties>
					</Item>
				</Item>
			</Item>
		</Item>
	</Item>
</roblox>
]]

--local FEManager = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/a003ea305dd302eab1f8d372daed38b4/raw/9db59962b28555fd699a7c29891efb85d45677ab/gistfile1.txt"))()
for i, v in pairs(Directories) do FEManager.EnsureFolder(v) end
-- FEManager.DownloadFile(Directories.Songs, "Operator.mp3", "https://dn720307.ca.archive.org/0/items/grand-funk-railroad-in-need-live-university-of-hawaii-1971/Call%20of%20Duty%20Black%20Ops%20-%20Soundtrack%20%282010%29/17.%20Pentagon.mp3")
--FEManager.DownloadFile(Directories.RBXMs, "Operator.rbxmx", "https://raw.githubusercontent.com/MelonsStuff/FEVerse/refs/heads/main/RBXMs/OperatorMobileUI.rbxmx")
local fileName = "Operator.rbxmx"
local targetDirectory = Directories.RBXMs

if not isfile(targetDirectory..fileName) then
	writefile(targetDirectory..fileName, game:HttpGet(Link))
	return print(fileName.." is not downloaded, downloading.")
else
	print(fileName.." already exists.")
end

local Settings = {
	Sounds = {
		Stab = {ID = 75940208464713};
		HitMarker = {ID = 7645086816};
		Shoot = {ID = 88409723970707};
	};
	Humanoid = {
		Walkspeed = 16;
		RunSpeed = 25;
		JumpPower = 35;
		CrouchSpeed = 8;}
}

local Reanimate_Settings = {
	Frequency = 6, -- this is basically how fast the oscillation goes
	Amplification = 6, -- this is how far the oscillation goes
	FrontOffset = 2.5, -- this is how much youre in front of the player during prediction
}

do
	local ReanimateGun
	local ReanimateKnife

	local Accessories = {}
	local Aligns = {}
	local Attachments = {}
	local BindableEvent = nil
	local Blacklist = {}
	local CFrame = CFrame
	local CFrameidentity = CFrame.identity
	local CFramelookAt = CFrame.lookAt
	local CFramenew = CFrame.new
	local Character = nil
	local CurrentCamera = nil
	local Enum = Enum
	local Custom = Enum.CameraType.Custom
	local Health = Enum.CoreGuiType.Health
	local HumanoidRigType = Enum.HumanoidRigType
	local R6 = HumanoidRigType.R6
	local Dead = Enum.HumanoidStateType.Dead
	local LockCenter = Enum.MouseBehavior.LockCenter
	local UserInputType = Enum.UserInputType
	local MouseButton1 = UserInputType.MouseButton1
	local Touch = UserInputType.Touch
	local Exceptions = {}
	local game = game
	local Clone = game.Clone
	local Close = game.Close
	local Connect = Close.Connect
	local Disconnect = Connect(Close, function() end).Disconnect
	local Wait = Close.Wait
	local Destroy = game.Destroy
	local FindFirstAncestorOfClass = game.FindFirstAncestorOfClass
	local FindFirstAncestorWhichIsA = game.FindFirstAncestorWhichIsA
	local FindFirstChild = game.FindFirstChild
	local FindFirstChildOfClass = game.FindFirstChildOfClass
	local Players = FindFirstChildOfClass(game, "Players")
	local CreateHumanoidModelFromDescription = Players.CreateHumanoidModelFromDescription
	local GetPlayers = Players.GetPlayers
	local LocalPlayer = Players.LocalPlayer
	local CharacterAdded = LocalPlayer.CharacterAdded
	--local ConnectDiedSignalBackend = LocalPlayer.ConnectDiedSignalBackend
	local Mouse = LocalPlayer:GetMouse()
	local Kill = LocalPlayer.Kill
	local RunService = FindFirstChildOfClass(game, "RunService")
	local PostSimulation = RunService.PostSimulation
	local PreRender = RunService.PreRender
	local PreSimulation = RunService.PreSimulation
	local StarterGui = FindFirstChildOfClass(game, "StarterGui")
	local GetCoreGuiEnabled = StarterGui.GetCoreGuiEnabled
	local SetCore = StarterGui.SetCore
	local SetCoreGuiEnabled = StarterGui.SetCoreGuiEnabled
	local Workspace = FindFirstChildOfClass(game, "Workspace")
	local FallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
	local HatDropY = FallenPartsDestroyHeight - 0.7
	local FindFirstChildWhichIsA = game.FindFirstChildWhichIsA
	local UserInputService = FindFirstChildOfClass(game, "UserInputService")
	local InputBegan = UserInputService.InputBegan
	local IsMouseButtonPressed = UserInputService.IsMouseButtonPressed
	local GetChildren = game.GetChildren
	local GetDescendants = game.GetDescendants
	local GetPropertyChangedSignal = game.GetPropertyChangedSignal
	local CurrentCameraChanged = GetPropertyChangedSignal(Workspace, "CurrentCamera")
	local MouseBehaviorChanged = GetPropertyChangedSignal(UserInputService, "MouseBehavior")
	local IsA = game.IsA
	local IsDescendantOf = game.IsDescendantOf

	local Highlights = {}

	local Instancenew = Instance.new
	local R15Animation = Instancenew("Animation")
	local R6Animation = Instancenew("Animation")
	local HumanoidDescription = Instancenew("HumanoidDescription")
	local HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, R6)
	local R15HumanoidModel = CreateHumanoidModelFromDescription(Players, HumanoidDescription, HumanoidRigType.R15)
	local SetAccessories = HumanoidDescription.SetAccessories
	local ModelBreakJoints = HumanoidModel.BreakJoints
	local Head = HumanoidModel.Head
	local BasePartBreakJoints = Head.BreakJoints
	local GetJoints = Head.GetJoints
	local IsGrounded = Head.IsGrounded
	local Humanoid = HumanoidModel.Humanoid
	local ApplyDescription = Humanoid.ApplyDescription
	local ChangeState = Humanoid.ChangeState
	local EquipTool = Humanoid.EquipTool
	local GetAppliedDescription = Humanoid.GetAppliedDescription
	local GetPlayingAnimationTracks = Humanoid.GetPlayingAnimationTracks
	local LoadAnimation = Humanoid.LoadAnimation
	local Move = Humanoid.Move
	local UnequipTools = Humanoid.UnequipTools
	local ScaleTo = HumanoidModel.ScaleTo

	local IsFirst = false
	local IsHealthEnabled = nil
	local IsLockCenter = false
	local IsRegistered = false
	local IsRunning = false

	local LastTime = nil

	local math = math
	local mathrandom = math.random
	local mathsin = math.sin
	local mathpi = math.pi

	local nan = 0 / 0

	local next = next

	local OptionsAccessories = nil
	local OptionsApplyDescription = nil
	local OptionsBreakJointsDelay = nil
	local OptionsClickFling = nil
	local OptionsDisableCharacterCollisions = nil
	local OptionsDisableHealthBar = nil
	local OptionsDisableRigCollisions = nil
	local OptionsDefaultFlingOptions = nil
	local OptionsHatDrop = nil
	local OptionsHideCharacter = nil
	local OptionsParentCharacter = nil
	local OptionsPermanentDeath = nil
	local OptionsRefit = nil
	local OptionsRigTransparency = nil
	local OptionsSetCameraSubject = nil
	local OptionsSetCameraType = nil
	local OptionsSetCharacter = nil
	local OptionsSetCollisionGroup = nil
	local OptionsSimulationRadius = nil
	local OptionsTeleportRadius = nil
	local OptionsUseServerBreakJoints

	local osclock = os.clock

	local PreRenderConnection = nil

	local RBXScriptConnections = {}

	local Refitting = false

	local replicatesignal = replicatesignal

	local Rig = nil
	local RigHumanoid = nil
	local RigHumanoidRootPart = nil

	local sethiddenproperty = sethiddenproperty
	local setscriptable = setscriptable

	local stringfind = string.find

	local table = table
	local tableclear = table.clear
	local tablefind = table.find
	local tableinsert = table.insert
	local tableremove = table.remove

	local Targets = {}

	local task = task
	local taskdefer = task.defer
	local taskspawn = task.spawn
	local taskwait = task.wait

	local Time = nil

	local Tools = {}

	local Vector3 = Vector3
	local Vector3new = Vector3.new
	local FlingVelocity = Vector3new(16384, 16384, 16384)
	local HatDropLinearVelocity = Vector3new(0, 27, 0)
	local HideCharacterOffset = Vector3new(0, - 30, 0)
	local Vector3one = Vector3.one
	local Vector3xzAxis = Vector3new(1, 0, 1)
	local Vector3zero = Vector3.zero
	local AntiSleep = Vector3zero

	local Color3fromRGB = Color3.fromRGB

	R15Animation.AnimationId = "rbxassetid://507767968"
	R6Animation.AnimationId = "rbxassetid://180436148"

	Humanoid = nil

	Destroy(HumanoidDescription)
	HumanoidDescription = nil

	local FindFirstChildOfClassAndName = function(Parent, ClassName, Name)
		for Index, Child in next, GetChildren(Parent) do
			if IsA(Child, ClassName) and Child.Name == Name then
				return Child
			end
		end
	end

	local GetHandleFromTable = function(Table)
		for Index, Child in GetChildren(Character) do
			if IsA(Child, "Accoutrement") then
				local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

				if Handle then
					local MeshId = nil
					local TextureId = nil

					if IsA(Handle, "MeshPart") then
						MeshId = Handle.MeshId
						TextureId = Handle.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Handle, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
							return Handle
						end
					end
				end
			end
		end
	end

	local NewIndex = function(self, Index, Value)
		self[Index] = Value
	end

	local DescendantAdded = function(Descendant)
		if IsA(Descendant, "Accoutrement") and OptionsHatDrop then
			if not pcall(NewIndex, Descendant, "BackendAccoutrementState", 0) then
				if sethiddenproperty then
					sethiddenproperty(Descendant, "BackendAccoutrementState", 0)
				elseif setscriptable then
					setscriptable(Descendant, "BackendAccoutrementState", true)
					Descendant.BackendAccoutrementState = 0
				end
			end
		elseif IsA(Descendant, "Attachment") then
			local Attachment = Attachments[Descendant.Name]

			if Attachment then
				local Parent = Descendant.Parent

				if IsA(Parent, "BasePart") then
					local MeshId = nil
					local TextureId = nil

					if IsA(Parent, "MeshPart") then
						MeshId = Parent.MeshId
						TextureId = Parent.TextureID
					else
						local SpecialMesh = FindFirstChildOfClass(Parent, "SpecialMesh")

						if SpecialMesh then
							MeshId = SpecialMesh.MeshId
							TextureId = SpecialMesh.TextureId
						end
					end

					if MeshId then
						for Index, Table in next, Accessories do
							if Table.MeshId == MeshId and Table.TextureId == TextureId then
								local Handle = Table.Handle

								tableinsert(Aligns, {
									LastPosition = Handle.Position,
									Offset = CFrameidentity,
									Part0 = Parent,
									Part1 = Handle
								})

								return
							end
						end

						for Index, Table in next, OptionsAccessories do
							if stringfind(MeshId, Table.MeshId) and stringfind(TextureId, Table.TextureId) then
								local Instance = nil
								local TableName = Table.Name
								local TableNames = Table.Names

								if TableName then
									Instance = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)
								else
									for Index, TableName in next, TableNames do
										local Child = FindFirstChildOfClassAndName(Rig, "BasePart", TableName)

										if not ( TableNames[Index + 1] and Blacklist[Child] ) then
											Instance = Child
											break
										end
									end
								end

								if Instance then
									local Blacklisted = Blacklist[Instance]

									if not ( Blacklisted and Blacklisted.MeshId == MeshId and Blacklisted.TextureId == TextureId ) then
										tableinsert(Aligns, {
											Offset = Table.Offset,
											Part0 = Parent,
											Part1 = Instance
										})

										Blacklist[Instance] = { MeshId = MeshId, TextureId = TextureId }

										return
									end
								end
							end
						end

						local Accoutrement = FindFirstAncestorWhichIsA(Parent, "Accoutrement")

						if Accoutrement and IsA(Accoutrement, "Accoutrement") then
							local AccoutrementClone = Clone(Accoutrement)

							local HandleClone = FindFirstChildOfClassAndName(AccoutrementClone, "BasePart", "Handle")
							HandleClone.Transparency = OptionsRigTransparency

							for Index, Descendant in next, GetDescendants(HandleClone) do
								if IsA(Descendant, "JointInstance") then
									Destroy(Descendant)
								end
							end

							local AccessoryWeld = Instancenew("Weld")
							AccessoryWeld.C0 = Descendant.CFrame
							AccessoryWeld.C1 = Attachment.CFrame
							AccessoryWeld.Name = "AccessoryWeld"
							AccessoryWeld.Part0 = HandleClone
							AccessoryWeld.Part1 = Attachment.Parent
							AccessoryWeld.Parent = HandleClone

							AccoutrementClone.Parent = Rig

							tableinsert(Accessories, {
								Handle = HandleClone,
								MeshId = MeshId,
								TextureId = TextureId
							})
							tableinsert(Aligns, {
								Offset = CFrameidentity,
								Part0 = Parent,
								Part1 = HandleClone
							})
						end
					end
				end
			end
		end
	end

	local SetCameraSubject = function()
		local CameraCFrame = CurrentCamera.CFrame
		local Position = RigHumanoidRootPart.CFrame.Position

		CurrentCamera.CameraSubject = RigHumanoid
		Wait(PreRender)
		CurrentCamera.CFrame = CameraCFrame + RigHumanoidRootPart.CFrame.Position - Position
	end

	local OnCameraSubjectChanged = function()
		if CurrentCamera.CameraSubject ~= RigHumanoid then
			taskdefer(SetCameraSubject)
		end
	end

	local OnCameraTypeChanged = function()
		if CurrentCamera.CameraType ~= Custom then
			CurrentCamera.CameraType = Custom
		end
	end

	local OnCurrentCameraChanged = function()
		local Camera = Workspace.CurrentCamera

		if Camera and OptionsSetCameraSubject then
			CurrentCamera = Workspace.CurrentCamera

			taskspawn(SetCameraSubject)

			OnCameraSubjectChanged()
			tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraSubject"), OnCameraSubjectChanged))

			if OptionsSetCameraType then
				OnCameraTypeChanged()
				tableinsert(RBXScriptConnections, Connect(GetPropertyChangedSignal(CurrentCamera, "CameraType"), OnCameraTypeChanged))
			end
		end
	end

	local SetCharacter = function()
		LocalPlayer.Character = Rig
	end

	local SetSimulationRadius = function()
		LocalPlayer.SimulationRadius = OptionsSimulationRadius
	end

	local WaitForChildOfClass = function(Parent, ClassName)
		local Child = FindFirstChildOfClass(Parent, ClassName)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClass(Parent, ClassName)
		end

		return Child
	end

	local WaitForChildOfClassAndName = function(Parent, ...)
		local Child = FindFirstChildOfClassAndName(Parent, ...)

		while not Child do
			Wait(Parent.ChildAdded)
			Child = FindFirstChildOfClassAndName(Parent, ...)
		end

		return Child
	end

	local Fling = function(Target, Options)
		if Target then
			local Highlight = Options.Highlight

			if IsA(Target, "Humanoid") then
				Target = Target.Parent
			end
			if IsA(Target, "Model") then
				Target = FindFirstChildOfClassAndName(Target, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart")
			end

			if not tablefind(Targets, Target) and IsA(Target, "BasePart") and not Target.Anchored and not IsDescendantOf(Character, Target) and not IsDescendantOf(Rig, Target) then
				local Model = FindFirstAncestorOfClass(Target, "Model")

				if Model and FindFirstChildOfClass(Model, "Humanoid") then
					Target = FindFirstChildOfClassAndName(Model, "BasePart", "HumanoidRootPart") or FindFirstChildWhichIsA(Character, "BasePart") or Target	
				else
					Model = Target
				end

				if Highlight then
					local HighlightObject = type(Highlight) == "boolean" and Highlight and Instancenew("Highlight") or Clone(Highlight)
					HighlightObject.Adornee = Model
					HighlightObject.Parent = Model
					HighlightObject.OutlineColor = Color3fromRGB(255, 0, 0)
					HighlightObject.FillColor = Color3fromRGB(0, 0, 0)

					Options.HighlightObject = HighlightObject
					tableinsert(Highlights, HighlightObject)
				end

				Targets[Target] = Options

				if not OptionsDefaultFlingOptions.HatFling and OptionsPermanentDeath and replicatesignal then
					--replicatesignal(ConnectDiedSignalBackend)
				end
			end
		end
	end

	local OnCharacterAdded = function(NewCharacter)
		if NewCharacter ~= Rig then
			tableclear(Aligns)
			tableclear(Blacklist)

			Character = NewCharacter

			if OptionsSetCameraSubject then
				taskspawn(SetCameraSubject)
			end

			if OptionsSetCharacter then
				taskdefer(SetCharacter)
			end

			if OptionsParentCharacter then
				Character.Parent = Rig
			end

			for Index, Descendant in next, GetDescendants(Character) do
				taskspawn(DescendantAdded, Descendant)
			end

			tableinsert(RBXScriptConnections, Connect(Character.DescendantAdded, DescendantAdded))

			Humanoid = WaitForChildOfClass(Character, "Humanoid")
			local HumanoidRootPart = WaitForChildOfClassAndName(Character, "BasePart", "HumanoidRootPart")

			if IsFirst then
				if OptionsApplyDescription and Humanoid then
					local AppliedDescription = GetAppliedDescription(Humanoid)
					SetAccessories(AppliedDescription, {}, true)
					taskspawn(ApplyDescription, RigHumanoid, AppliedDescription)
				end

				if HumanoidRootPart then
					RigHumanoidRootPart.CFrame = HumanoidRootPart.CFrame

					if OptionsSetCollisionGroup then
						local CollisionGroup = HumanoidRootPart.CollisionGroup

						for Index, Descendant in next, GetDescendants(Rig) do
							if IsA(Descendant, "BasePart") then
								Descendant.CollisionGroup = CollisionGroup
							end
						end
					end
				end

				IsFirst = false
			end

			local IsAlive = true

			if HumanoidRootPart then
				for Target, Options in next, Targets do
					if IsDescendantOf(Target, Workspace) then
						local FirstPosition = Target.Position
						local PredictionFling = Options.PredictionFling
						local LastPosition = FirstPosition
						local Timeout = osclock() + Options.Timeout or 1

						if HumanoidRootPart then
							while IsDescendantOf(Target, Workspace) and osclock() < Timeout do
								local DeltaTime = taskwait()
								local Position = Target.Position

								if ( Position - FirstPosition ).Magnitude > 100 then
									break
								end

								local Offset = Vector3zero

								if PredictionFling then
									local BaseOffset = (Position - LastPosition) / DeltaTime * 0.13
									local Frequency = Reanimate_Settings.Frequency
									local Amplification = Reanimate_Settings.Amplification
									local Time = tick()
									local TargetFace = Target.CFrame.LookVector
									local Oscillation = mathsin(Time * mathpi * 2 * Frequency) * Amplification
									local OscillatedOffset = TargetFace * Oscillation
									local FrontFaceOffset = TargetFace * Reanimate_Settings.FrontOffset
									Offset = BaseOffset + OscillatedOffset + FrontFaceOffset
								end

								HumanoidRootPart.AssemblyAngularVelocity = FlingVelocity
								HumanoidRootPart.AssemblyLinearVelocity = FlingVelocity

								HumanoidRootPart.CFrame = CFrame.new(Target.Position + Offset) * CFrame.Angles(0, Target.Orientation.Y, 0)
								LastPosition = Position
							end
						end
					end

					local HighlightObject = Options.HighlightObject

					if HighlightObject then
						Destroy(HighlightObject)
					end

					Targets[Target] = nil
				end

				HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
				HumanoidRootPart.AssemblyLinearVelocity = Vector3zero

				if OptionsHatDrop then
					taskspawn(function()
						WaitForChildOfClassAndName(Character, "LocalScript", "Animate").Enabled = false

						for Index, AnimationTrack in next, GetPlayingAnimationTracks(Humanoid) do
							AnimationTrack:Stop()
						end

						LoadAnimation(Humanoid, Humanoid.RigType == R6 and R6Animation or R15Animation):Play(0)

						pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", nan)

						local RootPartCFrame = RigHumanoidRootPart.CFrame
						RootPartCFrame = CFramenew(RootPartCFrame.X, HatDropY, RootPartCFrame.Z)

						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = HatDropLinearVelocity
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsHideCharacter then
					local HideCharacterOffset = typeof(OptionsHideCharacter) == "Vector3" and OptionsHideCharacter or HideCharacterOffset
					local RootPartCFrame = RigHumanoidRootPart.CFrame + HideCharacterOffset

					taskspawn(function()
						while IsAlive do
							HumanoidRootPart.AssemblyAngularVelocity = Vector3zero
							HumanoidRootPart.AssemblyLinearVelocity = Vector3zero
							HumanoidRootPart.CFrame = RootPartCFrame

							taskwait()
						end
					end)
				elseif OptionsTeleportRadius then
					HumanoidRootPart.CFrame = RigHumanoidRootPart.CFrame + Vector3new(mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius), 0, mathrandom(- OptionsTeleportRadius, OptionsTeleportRadius))
				end
			end

			local ToolFling = OptionsDefaultFlingOptions.ToolFling
			local Tools2 = {}

			if ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")

				tableclear(Tools)

				if type(ToolFling) == "string" then
					local Tool = FindFirstChildOfClassAndName(Backpack, "Tool", ToolFling)

					if Tool then
						Tool.Parent = Character
						tableinsert(Tools2, Tool)
					end
				else
					for Index, Tool in GetChildren(Backpack) do
						if IsA(Tool, "Tool") then
							Tool.Parent = Character
							tableinsert(Tools2, Tool)
						end
					end
				end

				UnequipTools(Humanoid)
			end

			if OptionsPermanentDeath and replicatesignal then
				--replicatesignal(ConnectDiedSignalBackend)
				taskwait(Players.RespawnTime + 0.1)
				Refitting = false
				replicatesignal(Kill)
			else
				taskwait(OptionsBreakJointsDelay)
			end

			ModelBreakJoints(Character)

			if replicatesignal and OptionsUseServerBreakJoints then
				replicatesignal(Humanoid.ServerBreakJoints)
			end

			ChangeState(Humanoid, Dead)
			Wait(Humanoid.Died)

			for Index, Tool in Tools2 do
				local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle")

				if Handle then
					Tool.Parent = Character
				else
					tableremove(Tools2, Index)
				end
			end

			Tools = Tools2
			UnequipTools(Humanoid)

			IsAlive = false

			if OptionsHatDrop then
				pcall(NewIndex, Workspace, "FallenPartsDestroyHeight", FallenPartsDestroyHeight)
			end
		end
	end

	local OnInputBegan = function(InputObject)
		local UserInputType = InputObject.UserInputType

		if UserInputType == MouseButton1 or UserInputType == Touch then
			local Target = Mouse.Target

			local HatFling = OptionsDefaultFlingOptions.HatFling
			local ToolFling = OptionsDefaultFlingOptions.ToolFling

			if HatFling and OptionsHatDrop then
				local Part = type(HatFling) == "table" and GetHandleFromTable(HatFling)

				if not Part then
					for Index, Child in GetChildren(Character) do
						if IsA(Child, "Accoutrement") then
							local Handle = FindFirstChildOfClassAndName(Child, "BasePart", "Handle")

							if Handle then
								Part = Handle
								break
							end
						end
					end
				end

				if Part then
					Exceptions[Part] = true

					while IsMouseButtonPressed(UserInputService, MouseButton1) do
						if Part.ReceiveAge == 0 then
							Part.AssemblyAngularVelocity = FlingVelocity
							Part.AssemblyLinearVelocity = FlingVelocity
							Part.CFrame = Mouse.Hit + AntiSleep
						end

						taskwait()
					end

					Exceptions[Part] = nil
				end
			elseif ToolFling then
				local Backpack = FindFirstChildOfClass(LocalPlayer, "Backpack")
				local Tool = nil

				if type(ToolFling) == "string" then
					Tool = FindFirstChild(Backpack, ToolFling) or FindFirstChild(Character, ToolFling)
				end

				if not Tool then
					Tool = FindFirstChildOfClass(Backpack, "Tool") or FindFirstChildOfClass(Character, "Tool")
				end

				if Tool then
					local Handle = FindFirstChildOfClassAndName(Tool, "BasePart", "Handle") or FindFirstChildWhichIsA(Tool, "BasePart")

					if Handle then
						Tool.Parent = Character

						while IsMouseButtonPressed(UserInputService, MouseButton1) do
							if Handle.ReceiveAge == 0 then
								Handle.AssemblyAngularVelocity = FlingVelocity
								Handle.AssemblyLinearVelocity = FlingVelocity
								Handle.CFrame = Mouse.Hit + AntiSleep
							end

							taskwait()
						end

						UnequipTools(Humanoid)

						Handle.AssemblyAngularVelocity = Vector3zero
						Handle.AssemblyLinearVelocity = Vector3zero
						Handle.CFrame = RigHumanoidRootPart.CFrame
					end
				end
			else
				Fling(Target, OptionsDefaultFlingOptions)
			end
		end
	end

	local OnPostSimulation = function()
		Time = osclock()
		local DeltaTime = Time - LastTime
		LastTime = Time

		if not OptionsSetCharacter and IsLockCenter then
			local Position = RigHumanoidRootPart.Position
			RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)
		end

		if OptionsSimulationRadius then
			pcall(SetSimulationRadius)
		end

		AntiSleep = mathsin(Time * 15) * 0.0015 * Vector3one
		local Axis = 27 + mathsin(Time)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if not Exceptions[Part0] then
				if Part0.ReceiveAge == 0 then
					if IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
						local Part1 = Table.Part1

						Part0.AssemblyAngularVelocity = Vector3zero

						local LinearVelocity = Part1.AssemblyLinearVelocity * Axis
						Part0.AssemblyLinearVelocity = Vector3new(LinearVelocity.X, Axis, LinearVelocity.Z)

						Part0.CFrame = Part1.CFrame * Table.Offset + AntiSleep
					end
				else
					local Frames = Table.Frames or - 1
					Frames = Frames + 1
					Table.Frames = Frames

					if Frames > 15 and OptionsPermanentDeath and OptionsRefit and replicatesignal then
						Refitting = false
						--replicatesignal(ConnectDiedSignalBackend)
					end
				end
			end
		end

		if not OptionsSetCharacter and Humanoid then
			Move(RigHumanoid, Humanoid.MoveDirection)
			RigHumanoid.Jump = Humanoid.Jump
		end
	end

	local OnPreRender = function()
		local Position = RigHumanoidRootPart.Position
		RigHumanoidRootPart.CFrame = CFramelookAt(Position, Position + CurrentCamera.CFrame.LookVector * Vector3xzAxis)

		for Index, Table in next, Aligns do
			local Part0 = Table.Part0

			if Part0.ReceiveAge == 0 and IsDescendantOf(Part0, Workspace) and not GetJoints(Part0)[1] and not IsGrounded(Part0) then
				Part0.CFrame = Table.Part1.CFrame * Table.Offset
			end
		end
	end

	local OnMouseBehaviorChanged = function()
		IsLockCenter = UserInputService.MouseBehavior == LockCenter

		if IsLockCenter then
			PreRenderConnection = Connect(PreRender, OnPreRender)
			tableinsert(RBXScriptConnections, PreRenderConnection)
		elseif PreRenderConnection then
			Disconnect(PreRenderConnection)
			tableremove(RBXScriptConnections, tablefind(RBXScriptConnections, PreRenderConnection))
		end
	end

	local OnPreSimulation = function()
		if OptionsDisableCharacterCollisions and Character then
			for Index, Descendant in next, GetDescendants(Character) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end

		if OptionsDisableRigCollisions then
			for Index, Descendant in next, GetChildren(Rig) do
				if IsA(Descendant, "BasePart") then
					Descendant.CanCollide = false
				end
			end
		end
	end

	local Register = function()
		repeat
			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)
			taskwait()
		until IsRegistered
	end

	Start = function(Options)
		if not IsRunning then
			IsFirst = true
			IsRunning = true

			Options = Options or {}
			OptionsAccessories = Options.Accessories or {}
			OptionsApplyDescription = Options.ApplyDescription
			OptionsBreakJointsDelay = Options.BreakJointsDelay or 0
			OptionsClickFling = Options.ClickFling
			OptionsDisableCharacterCollisions = Options.DisableCharacterCollisions
			OptionsDisableHealthBar = Options.DisableHealthBar
			OptionsDisableRigCollisions = Options.DisableRigCollisions
			OptionsDefaultFlingOptions = Options.DefaultFlingOptions or {}
			OptionsHatDrop = Options.HatDrop
			OptionsHideCharacter = Options.HideCharacter
			OptionsParentCharacter = Options.ParentCharacter
			OptionsPermanentDeath = Options.PermanentDeath
			OptionsRefit = Options.Refit
			local OptionsRigSize = Options.RigSize
			OptionsRigTransparency = Options.RigTransparency or 1
			OptionsSetCameraSubject = Options.SetCameraSubject
			OptionsSetCameraType = Options.SetCameraType
			OptionsSetCharacter = Options.SetCharacter
			OptionsSetCollisionGroup = Options.SetCollisionGroup
			OptionsSimulationRadius = Options.SimulationRadius
			OptionsTeleportRadius = Options.TeleportRadius
			OptionsUseServerBreakJoints = Options.UseServerBreakJoints

			if OptionsDisableHealthBar then
				IsHealthEnabled = GetCoreGuiEnabled(StarterGui, Health)
				SetCoreGuiEnabled(StarterGui, Health, false)
			end

			BindableEvent = Instancenew("BindableEvent")
			tableinsert(RBXScriptConnections, Connect(BindableEvent.Event, Stop))

			Rig = Options.R15 and Clone(R15HumanoidModel) or Clone(HumanoidModel)
			Rig.Name = "non"
			RigHumanoid = Rig.Humanoid
			RigHumanoidRootPart = Rig.HumanoidRootPart
			Rig.Parent = Workspace

			local CreateObject = function(Name)
				local Part = Instance.new("Part")
				Part.Name = Name
				Part.Massless = true
				Part.CanCollide = true
				Part.Transparency = 1
				Part.Size = Vector3new(0.1, 0.1, 0.1)
				Part.Anchored = true
				Part.Parent = Rig
				return Part
			end

			ReanimateGun = CreateObject("Reanimate_Gun")
			ReanimateKnife = CreateObject("Reanimate_Knife")

			for Index, Descendant in next, GetDescendants(Rig) do
				if IsA(Descendant, "Attachment") then
					Attachments[Descendant.Name] = Descendant
				elseif IsA(Descendant, "BasePart") or IsA(Descendant, "Decal") then
					Descendant.Transparency = OptionsRigTransparency
				end
			end

			if OptionsRigSize then
				ScaleTo(Rig, OptionsRigSize)

				RigHumanoid.JumpPower = 50
				RigHumanoid.WalkSpeed = 16
			end

			OnCurrentCameraChanged()
			tableinsert(RBXScriptConnections, Connect(CurrentCameraChanged, OnCurrentCameraChanged))

			if OptionsClickFling then
				tableinsert(RBXScriptConnections, Connect(InputBegan, OnInputBegan))
			end

			local Character = LocalPlayer.Character

			if Character then
				OnCharacterAdded(Character)
				ReanimateGun.Anchored = false
				ReanimateKnife.Anchored = false
			end

			tableinsert(RBXScriptConnections, Connect(CharacterAdded, OnCharacterAdded))

			LastTime = osclock()
			tableinsert(RBXScriptConnections, Connect(PostSimulation, OnPostSimulation))

			if not OptionsSetCharacter then
				OnMouseBehaviorChanged()
				tableinsert(RBXScriptConnections, Connect(MouseBehaviorChanged, OnMouseBehaviorChanged))
			end

			if OptionsDisableCharacterCollisions or OptionsDisableRigCollisions then
				OnPreSimulation()
				tableinsert(RBXScriptConnections, Connect(PreSimulation, OnPreSimulation))
			end

			IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", BindableEvent)

			if not IsRegistered then
				taskspawn(Register)
			end

			return {
				BindableEvent = BindableEvent,
				Fling = Fling,
				Rig = Rig
			}
		end
	end

	Stop = function()
		if IsRunning then
			IsFirst = false
			IsRunning = false

			for Index, Highlight in Highlights do
				Destroy(Highlight)
			end

			tableclear(Highlights)

			for Index, RBXScriptConnection in next, RBXScriptConnections do
				Disconnect(RBXScriptConnection)
			end

			tableclear(RBXScriptConnections)

			Destroy(BindableEvent)

			if Character.Parent == Rig then
				Character.Parent = Workspace
			end

			if Humanoid then
				ChangeState(Humanoid, Dead)
			end

			Destroy(Rig)

			if OptionsPermanentDeath and replicatesignal then
				--replicatesignal(ConnectDiedSignalBackend)
			end

			if OptionsDisableHealthBar and not GetCoreGuiEnabled(StarterGui, Health) then
				SetCoreGuiEnabled(StarterGui, Health, IsHealthEnabled)
			end

			if IsRegistered then
				pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			else
				IsRegistered = pcall(SetCore, StarterGui, "ResetButtonCallback", true)
			end
		end
	end
end

local Rad = math.rad

Empyrean = Start({
	Accessories = {
		-- Hammer Head Rig
		{ Name = "Torso", MeshId = "139792224823925",  TextureId = "89183204903931", Offset = CFrame.Angles(0, 0, Rad(90)) },
		{ Names = { "Right Arm", "Left Arm" }, MeshId = "105263225400272", TextureId = "111402858657243", Offset = CFrame.Angles(0, 0, Rad(90)) },
		-- Glitchy Limbs (Monochrome)
		{ Name = "Torso", MeshId = "94838871645327",  TextureId = "108681181592495", Offset = CFrame.identity },
		{ Name = "Right Arm", MeshId = "18885728798", TextureId = "18885728798", Offset = CFrame.identity },
		{ Name = "Left Arm", MeshId = "18885728798", TextureId = "18885728798", Offset = CFrame.identity },
		{ Name = "Right Leg",MeshId = "100080236046620",  TextureId = "78703116520529", Offset = CFrame.identity },
		{ Name = "Left Leg", MeshId = "91790195871679", TextureId = "108681181592495", Offset = CFrame.identity },
		-- Gojo Rig
		{ Name = "Torso", MeshId = "113465334594272",  TextureId = "94020114074172", Offset = CFrame.identity },
		{ Name = "Right Arm",MeshId = "82030652840870",  TextureId = "137595219926625", Offset = CFrame.identity },
		{ Name = "Left Arm", MeshId = "91244322746029", TextureId = "137595219926625", Offset = CFrame.identity },
		{ Name = "Right Leg", MeshId = "132187752780278", TextureId = "97394845862368", Offset = CFrame.Angles(3.15, 0, 0) },
		{ Name = "Left Leg", MeshId = "131967977780088", TextureId = "97394845862368", Offset =  CFrame.Angles(3.15, 0, 0) },
		-- New Free Hair Limbs
		{ MeshId = "319354652", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(0, -1.57, 0), TextureId = "376186990" },
		{ MeshId = "319354652", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(0, 1.57, 0), TextureId = "304117018" },
		{ MeshId = "81642452", Name = "Left Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858317942" },
		{ MeshId = "81642452", Name = "Right Leg", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 0, Rad(180)), TextureId = "6858318826" },
		-- New Free Rig
		{ MeshId = "4819720316", Name = "Torso", Offset = CFrame.Angles(0, 0, -0.25), TextureId = "4819722776" },
		{ MeshId = "3030546036", Name = "Left Arm", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(-1.57, 0, 1.57), TextureId = "3033903209" },
		{ MeshId = "3030546036", Name = "Right Arm", Offset = CFrame.new(-0.15, 0, 0) * CFrame.Angles(-1.57, 0, -1.57), TextureId = "3360978739" },
		{ MeshId = "3030546036", Name = "Left Leg", Offset = CFrame.new(0.15, 0, 0) * CFrame.Angles(-1.57, 0, 1.57), TextureId = "3033898741" },
		{ MeshId = "3030546036", Name = "Right Leg", Offset = CFrame.new(0.15, 0, 0) *  CFrame.Angles(-1.57, 0, -1.57), TextureId = "3409604993" },
		-- Snake Banisher Rig
		{ MeshId = "125443585075666", Name = "Torso", Offset = CFrame.Angles(0, 3.15, 0), TextureId = "121023324229475" },
		{ MeshId = "121342985816617", Name = "Left Arm", Offset = CFrame.Angles(0, 0, 1.57), TextureId = "129264637819824" },
		{ MeshId = "121342985816617", Name = "Right Arm", Offset = CFrame.Angles(0, 3.15, 1.57), TextureId = "129264637819824" },
		{ MeshId = "83395427313429", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "97148121718581" },--18641142410
		-- Prosthetics (Furnace Rig)
		{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "99077561039115" },
		{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "99077561039115" },
		{ MeshId = "117554824897780", Name = "Right Leg", Offset = CFrame.Angles(0, -1.57, 0), TextureId = "84429400539007" },
		{ MeshId = "123388937940630", Name = "Left Leg", Offset = CFrame.Angles(0, 1.57, 0), TextureId = "84429400539007" },
		-- Classic Cheap Rig
		{ MeshId = "12344206657", Name = "Left Arm", Offset = CFrame.new(0.05, 0.05, -0.075) * CFrame.Angles(-2, 0, 0), TextureId = "12344206675" },
		{ MeshId = "12344207333", Name = "Right Arm", Offset = CFrame.new(-0.05, 0.05, -0.075) * CFrame.Angles(-1.95, 0, 0), TextureId = "12344207341" },
		{ MeshId = "11159370334", Name = "Left Leg", Offset = CFrame.Angles(1.57, 1.57, 0), TextureId = "11159284657" },
		{ MeshId = "11263221350", Name = "Right Leg", Offset = CFrame.Angles(1.57, -1.57, 0), TextureId = "11263219250" },
		-- Grey Mesh Rig 
		{ MeshId = "127552124837034", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--14255556501
		{ MeshId = "117287001096396", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "120169691545791" },--14255556501
		{ MeshId = "121304376791439", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 0), TextureId = "131014325980101" },--18641142410
		-- Classical Products rig (white/black arms)
		{ MeshId = "14241018198", Names = {"Torso"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14251599953" },
		{ MeshId = "17374767929", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17374768001" },
		{ MeshId = "17387586286", Names = { "Left Leg", "Right Leg" }, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "17387586304" },
		{ MeshId = "14255522247", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14255543546" },
		-- Noob Rig
		{ MeshId = "18640899369", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "18640899481" },
		{ MeshId = "18640914129", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640914168" },
		{ MeshId = "18640901641", Names = { "Left Leg", "Right Leg"}, Offset = CFrame.Angles(0, 0, 0), TextureId = "18640901676" },
		-- Genesis Black Rig
		{ MeshId = "110684113028749", Name = "Torso", Offset = CFrame.identity, TextureId = "70661572547971" },
		{ MeshId = "125405780718494", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "136752500636691" },
		{ MeshId = "125405780718494", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "136752500636691" },
		-- Genesis White Rig
		{ MeshId = "126825022897778", Name = "Torso", Offset = CFrame.identity, TextureId = "130689541138804" },
		{ MeshId = "99608462237958", Name = "Left Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
		{ MeshId = "139733645770094", Name = "Right Arm", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "130809869695496" },
		{ MeshId = "105141400603933", Name = "Left Leg", Offset = CFrame.Angles(0, 0, Rad(90)), TextureId = "71060417496309" },
		{ MeshId = "90736849096372", Name = "Right Leg", Offset = CFrame.Angles(0, 0,  Rad(90)), TextureId = "79186624401216" },
		-- request
		{ MeshId = "14768666349", Name = "Torso", Offset = CFrame.Angles(0, 0, 0), TextureId = "14768664565" },
		{ MeshId = "14768684979", Names = { "Left Arm", "Right Arm"}, Offset = CFrame.Angles(0, 0, 1.57), TextureId = "14768683674" },
 		-- Paid Set 1 (5133889404 / 15462491048)
		{ Name = "Reanimate_Gun",  MeshId = "5133862161", TextureId = "5133800618", Offset = CFrame.new(0, -0.75, -0.25) * CFrame.Angles(Rad(-45), Rad(0), Rad(0)) },
		{ Name = "Reanimate_Knife",  MeshId = "15460233090", TextureId = "15460238774", Offset = CFrame.new(0, -0.95, -0.35) * CFrame.Angles(Rad(0),  Rad(75), Rad(0))},
	 	-- Paid Set 2 (115749500764149 / 5858232880)
		{ Name = "Reanimate_Gun",  MeshId = "5847410698", TextureId = "5847410717", Offset = CFrame.new(0, -0.25, -0.15) * CFrame.Angles(Rad(0), Rad(-90), Rad(115)) },
		{ Name = "Reanimate_Knife",  MeshId = "134882906900554", TextureId = "75326575520527", Offset = CFrame.new(0, -0.925, -0.45) * CFrame.Angles(Rad(-45),  Rad(0), Rad(0))},
	 	-- Paid Set 3 (18539166974 / 15373591365)
		{ Name = "Reanimate_Gun",  MeshId = "18136651721", TextureId = "18136711454", Offset = CFrame.new(0, -1.15, -0.15) * CFrame.Angles(Rad(0), Rad(90), Rad(-90)) },
		{ Name = "Reanimate_Knife",  MeshId = "15373476193", TextureId = "15373475127", Offset = CFrame.new(0, 0, 0) * CFrame.Angles(Rad(-90),  Rad(0), Rad(0))},
	 	-- Paid Set 4 (15034822939 / 14967839572)
		{ Name = "Reanimate_Gun",  MeshId = "15033271108", TextureId = "15033271162", Offset = CFrame.new(0, -0.65, -0.15) * CFrame.Angles(Rad(90), Rad(0), Rad(180)) },
		{ Name = "Reanimate_Knife",  MeshId = "14872764280", TextureId = "14881991108", Offset = CFrame.new(0, -1, -0.5) * CFrame.Angles(Rad(0), Rad(90), Rad(-90))},
	 	-- Paid Set 5 (139300665699045 / 15034807966)
		{ Name = "Reanimate_Gun",  MeshId = "15033232117", TextureId = "15033232248", Offset = CFrame.new(0, -0.65, 0.2) * CFrame.Angles(Rad(90), Rad(0), Rad(180)) },
		{ Name = "Reanimate_Knife",  MeshId = "89866510854308", TextureId = "112115486111428", Offset = CFrame.new(0, -1, -0.5) * CFrame.Angles(Rad(-65), Rad(180), Rad(0))},
	 	-- Free Set 1
		{ Name = "Reanimate_Gun",  MeshId = "5548423017", TextureId = "5548423938", Offset = CFrame.new(0, -1.5, 0.25) * CFrame.Angles(-1.57, -1.57, Rad(-70)) },
        { Name = "Reanimate_Gun",  MeshId = "15172160708", TextureId = "15172162617", Offset = CFrame.new(0, -0.65, 0) * CFrame.Angles(Rad(0), Rad(0), Rad(-125)) },
        { Name = "Reanimate_Knife",  MeshId = "11524268570", TextureId = "11524268595", Offset = CFrame.new(0, -1.5, -0.5) * CFrame.Angles(Rad(-65), Rad(180), Rad(0))},
	},
	ApplyDescription = true,
	BreakJointsDelay = 0.225,
	ClickFling = false,
	DefaultFlingOptions = {
		HatFling = false,
		Highlight = false,
		PredictionFling = true,
		Timeout = 0.1,
		ToolFling = false,
	},
	DisableCharacterCollisions = true,
	DisableHealthBar = true,
	DisableRigCollisions = true,
	HatDrop = false,
	HideCharacter = Vector3.new(0, -30, 0),
	ParentCharacter = true,
	PermanentDeath = false,
	Refit = false,
	RigSize = 1,
	RigTransparency = 1,
	R15 = false,
	SetCameraSubject = true,
	SetCameraType = true,
	SetCharacter = false,
	SetCollisionGroup = true,
	SimulationRadius = 2147483647,
	TeleportRadius = 12,
	UseServerBreakJoints = true,
})

DefaultFlingOptions = {
	HatFling = false,
	Highlight = false,
	PredictionFling = true,
	Timeout = 0.15,
	ToolFling = false,
}

-- services
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

-- instances
local M = {R=math.rad;P=math.pi;S=math.sin;C=math.cos;T=math.tan;AS=math.asin;AC=math.acos;AT=math.atan;D=math.deg;H=math.huge;}
local CF = {N=CFrame.new;A=CFrame.Angles;fEA=CFrame.fromEulerAnglesXYZ;}
local V3 = {N=Vector3.new};

-- character
local Plr = Players.LocalPlayer
local Char = Empyrean.Rig
local Hum = Char:FindFirstChildOfClass("Humanoid")
Hum.JumpPower = Settings.Humanoid.JumpPower
local RArm = Char:WaitForChild("Right Arm")
local LArm = Char:WaitForChild("Left Arm")
local Torso = Char:WaitForChild("Torso")
local RLeg = Char:WaitForChild("Right Leg")
local LLeg = Char:WaitForChild("Left Leg")
local Head = Char:WaitForChild("Head")
local Root = Char:WaitForChild("HumanoidRootPart")
local Mouse = Plr:GetMouse()

local ShitlockController = Plr.PlayerScripts:WaitForChild("PlayerModule"):WaitForChild("CameraModule"):WaitForChild("MouseLockController")
ShitlockController:FindFirstChild("BoundKeys").Value = "LeftControl, RightControl"

-- variables
local WalkSpeed = Settings.Humanoid.Walkspeed
local JumpPower = Settings.Humanoid.JumpPower
local HitboxConnection
local NeutralAnims = true
local Crouching, Running, UsingKarambit = false, false, false
local HoldingM1, Attack, Shooting = false, false, false
local CanHitbox = false
local Sine = 0
local Change = 1

-- tables
local Joints = {}
local Connections = {}

-- raycast setup
local Camera = workspace.CurrentCamera
local RayParams = RaycastParams.new()
RayParams.FilterType = Enum.RaycastFilterType.Blacklist
RayParams.IgnoreWater = true

-- main functions
local CastRay = function(Start, End, Range, IgnoreList)
	local Ray = Ray.new(Start, (End - Start).unit * Range)
	local Part, Position, Norm = workspace:FindPartOnRayWithIgnoreList(Ray, IgnoreList or {Char}, false, true)
	return Part, Position, Norm, (Position and (Start - Position).Magnitude)
end

local RaycastFromMouse = function(Range)
	Range = Range or 1000
	RayParams.FilterDescendantsInstances = { Char }
	local Position = Players.LocalPlayer:GetMouse().Hit.Position
	local Origin = Camera.CFrame.Position
	local Direction = (Position - Origin).Unit * Range
	return workspace:Raycast(Origin, Direction, RayParams)
end

local PlaySound = function(ID, Volume)
	local Sound = Instance.new("Sound", Root)
	Sound.Volume = Volume or 1
	Sound.SoundId = "rbxassetid://"..ID
	Sound.PlayOnRemove = true
	Sound:Destroy()
end

local Joint = function(name,part0,part1,c0,c1,type)
	local joint = Instance.new(type or "Motor6D")
	joint.Part0 = part0
	joint.Part1 = part1
	joint.C0 = c0 or CF.N()
	joint.C1 = c1 or CF.N()
	joint.Parent=part0
	joint.Name=name or part0.." to "..part1.." "..joint.ClassName
	return joint
end

-- animator functions
local getLength = function(table)local len=0;for i,v in next,table do len=len+1 end;return len;end
local getFirstEntry = function(table)for i,v in next,table do return i,v end;return nil;end

local Animate = function(joint,props,alpha,style,dir)
	local joint = typeof(joint)=='string' and Joints[joint].J or typeof(joint)=='table' and joint.J or typeof(joint)=='Instance' and joint or error("lol animate needs a string, table or instance")
	local propName='C0'
	if(typeof(props)=='table' and getLength(props)==1 and select(2,getFirstEntry(props)).lerp)then
		propName,props=getFirstEntry(props)
	end
	if(style=='Lerp' and props.lerp)then
		joint[propName] = joint[propName]:lerp(props,alpha)
	else
		if(typeof(props)=='CFrame')then
			props={C0=props}
		end
		local info = TweenInfo.new(alpha or 1,(style~='Lerp' and style) or Enum.EasingStyle.Linear,dir or Enum.EasingDirection.Out,0,false,0)
		local tween = TweenService:Create(joint,info,props)
		tween:Play();
		return tween;
	end
end

Joints['RJ'] = Joint("RootJoint",Root,Torso,CF.N(),CF.N())
Joints['NK'] = Joint("Neck",Torso,Head,CF.N(0,1.5,0),CF.N())
Joints['LS'] = Joint("Left Shoulder",Torso,LArm,CF.N(-1.5,.5,0),CF.N(0,.5,0))
Joints['RS'] = Joint("Right Shoulder",Torso,RArm,CF.N(1.5,.5,0),CF.N(0,.5,0))
Joints['LH'] = Joint("Left Hip",Root,LLeg,CF.N(-.5,-2,0),CF.N(0,0,0))
Joints['RH'] = Joint("Right Hip",Root,RLeg,CF.N(.5,-2,0),CF.N(0,0,0))

for i,v in next, Joints do Joints[i]={J=v,D={C0=v.C0,C1=v.C1}} end

local AHB = Instance.new("BindableEvent")
do
	local Timeframe = 0;
	local LastFrame= 0;
	local FPS = 60
	AHB:Fire()
	RunService.Heartbeat:connect(function(s, p)
		Timeframe = Timeframe + s
		if(Timeframe >= 1/FPS)then
			for i = 1, math.floor(Timeframe/(1/FPS)) do AHB:Fire() end
			LastFrame = tick()
			Timeframe = Timeframe - (1/FPS) * math.floor(Timeframe / (1/FPS))
		end
	end)
end

local fwait = function(Frames) for i = 1,((typeof(Frames)~='number' or Frames<=0) and 1 or Frames) do AHB.Event:wait() end end
for _,v in next, Hum:GetPlayingAnimationTracks() do	v:Stop(); end
pcall(game.Destroy,Char:FindFirstChild'Animate')
pcall(game.Destroy,Hum:FindFirstChild'Animator')

-- effects setup
if isfile("FEVerse/Songs/Operator.mp3") then
Theme = Instance.new("Sound", Root)
Theme.SoundId = getcustomasset("FEVerse/Songs/Operator.mp3")
Theme.Looped = true
Theme.Volume = 0.15
Theme:Play()
else
print("Song not found.")
end

local FlashHitHighlight = function(Target, FillColor, OutlineColor)
	if not Target or not Target:IsA("Model") then return end
	if Target:FindFirstChild("HitHighlight") then return end 
	local Highlight = Instance.new("Highlight")
	Highlight.Name = "HitHighlight"
	Highlight.Adornee = Target
	Highlight.FillColor = FillColor or Color3.fromRGB(255, 60, 60)
	Highlight.OutlineColor = OutlineColor or Color3.fromRGB(145, 0, 0)
	Highlight.FillTransparency = 1
	Highlight.OutlineTransparency = 1
	Highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	Highlight.Parent = Target
	local FlashIn = TweenService:Create(Highlight, TweenInfo.new(0.12, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {FillTransparency = 0.3, OutlineTransparency = 0})
	local FadeOut = TweenService:Create(Highlight,TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.In),{FillTransparency = 1,OutlineTransparency = 1})
	FlashIn:Play()
	FlashIn.Completed:Once(function() FadeOut:Play() end)
	FadeOut.Completed:Once(function() Highlight:Destroy() end)
end

-- weapons setup
local Gun = Char:FindFirstChild("Reanimate_Gun")
local GunWeld = Instance.new("Weld", Gun)
GunWeld.Part0 = RArm
GunWeld.Part1 = Gun
GunWeld.C0 = CF.N(0, -0.95, -0.45)

local Karambit = Char:FindFirstChild("Reanimate_Knife")
local KarambitWeld = Instance.new("Weld", Karambit)
KarambitWeld.Part0 = Torso
KarambitWeld.Part1 = Karambit
KarambitWeld.C0 = CF.N(1, -0.55, 0.25) * CF.A(M.R(0), M.R(0), M.R(0))

local EnableHitbox = function()
	if HitboxConnection then
		HitboxConnection:Disconnect()
		HitboxConnection = nil
	end
	HitboxConnection = Karambit.Touched:Connect(function(Hit)
		if not CanHitbox then return end
		if Hit:IsDescendantOf(Char) then return end
		local Target = Hit:FindFirstAncestorOfClass("Model")
		local TargetHumanoid = Target and Target:FindFirstChildOfClass("Humanoid")
		if TargetHumanoid then
			PlaySound(Settings.Sounds.Stab.ID)
			FlashHitHighlight(Target)
			Empyrean.Fling(Target, DefaultFlingOptions)
			HitboxConnection:Disconnect()
			HitboxConnection = nil
		end
	end)
end

local SwitchWeapon = function()
	NeutralAnims = false
	Attack = true
	UsingKarambit = not UsingKarambit
	if UsingKarambit then
	    PlaySound(6632854296)
		GunWeld.Part0 = Torso
		GunWeld.Part1 = Gun
		GunWeld.C0 = CF.N(0, 0, 0.475) * CF.A(M.R(0), M.R(90), M.R(0))
		KarambitWeld.Part0 = RArm
		KarambitWeld.Part1 = Karambit
		KarambitWeld.C0 = CF.N(0, -1.45, 0.15) * CF.A(M.R(90), M.R(0), M.R(0))
	else
	    PlaySound(7405483764)
		GunWeld.Part0 = RArm
		GunWeld.Part1 = Gun
		GunWeld.C0 = CF.N(0, -0.95, -0.45)
		KarambitWeld.Part0 = Torso
		KarambitWeld.Part1 = Karambit
		KarambitWeld.C0 = CF.N(1, -0.55, 0.25) * CF.A(M.R(0), M.R(0), M.R(0))
	end
	NeutralAnims = true
	Attack = false
end

-- attacks
local KarambitSwing = function()
	if Attack then return end
	if not UsingKarambit or Running then return end
	Attack = true
	CanHitbox = true
	PlaySound(166083595, 1)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-5),0,0), 0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	Animate('RS', CF.N(1.3,0.5,0) * CF.A(M.R(110),M.R(20),0), 0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	Animate('LS', CF.N(-1.2,0.3,0) * CF.A(M.R(80),0,0), 0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	fwait(5)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-12),0,0), 0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	Animate('RS', CF.N(1.5,0.6,0.2) * CF.A(M.R(135),M.R(35),0), 0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	Animate('LS', CF.N(-1.1,0.4,0) * CF.A(M.R(85),M.R(-15),0), 0.2, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	fwait(5)
	EnableHitbox()
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-15),0,0), 0.25, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
	Animate('RS', CF.N(0.6,0.5,-0.7) * CF.A(M.R(40),M.R(160),M.R(100)), 0.25, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
	Animate('LS', CF.N(-1.25,0.35,0) * CF.A(M.R(95),M.R(-5),0), 0.25, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
	fwait(5)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-20),0,0), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('RS', CF.N(0.9,0.6,-0.3) * CF.A(M.R(65),M.R(130),M.R(70)), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('LS', CF.N(-1.3,0.5,0) * CF.A(M.R(100),M.R(-20),0), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	fwait(5)
	PlaySound(166083610, 1)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-10),0,0), 0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('RS', CF.N(1.2,0.55,0) * CF.A(M.R(95),M.R(25),0), 0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('LS', CF.N(-1.2,0.45,0) * CF.A(M.R(85),M.R(10),0), 0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	fwait(5)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-10),M.R(8),0), 0.25, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	Animate('RS', CF.N(1.35,0.62,-0.15) * CF.A(M.R(125),M.R(80),M.R(35)), 0.25, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	Animate('LS', CF.N(-1.1,0.4,0.1) * CF.A(M.R(85),M.R(0),M.R(6)), 0.25, Enum.EasingStyle.Elastic, Enum.EasingDirection.In)
	fwait(5)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-18),M.R(16),0), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('RS', CF.N(0.75,0.42,-0.85) * CF.A(M.R(45),M.R(5),M.R(-85)), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('LS', CF.N(-1.28,0.38,0) * CF.A(M.R(100),M.R(15),M.R(6)), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	fwait(5)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-20),M.R(10),0), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('RS', CF.N(0.55,0.32,-1.05) * CF.A(M.R(25),M.R(-20),M.R(-120)), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('LS', CF.N(-1.33,0.44,-0.02) * CF.A(M.R(106),M.R(5),M.R(0)), 0.3, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	fwait(5)
	Animate('RJ', CF.N(0,0,0) * CF.A(M.R(-16),0,0), 0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('RS', CF.N(0.95,0.58,-0.2) * CF.A(M.R(78),M.R(95),M.R(40)), 0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	Animate('LS', CF.N(-1.25,0.58,0.02) * CF.A(M.R(96),M.R(-5),M.R(6)), 0.35, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out)
	fwait(5)
	CanHitbox = false
	Attack = false
end

local Shoot = function()
	if Attack or UsingKarambit or Running then return end
	Attack = true
	PlaySound(Settings.Sounds.Shoot.ID)
	local Result = RaycastFromMouse(500)
	if Result then
		local HitPart = Result.Instance
		local Target = HitPart:FindFirstAncestorOfClass("Model")
		local TargetHumanoid = Target and Target:FindFirstChildOfClass("Humanoid")
		if TargetHumanoid then
			PlaySound(Settings.Sounds.HitMarker.ID)
			FlashHitHighlight(Target)
			Empyrean.Fling(Target, DefaultFlingOptions)
		end
	end
	fwait(2)
	Animate("RJ",CF.N(0,-.05+.1*M.C(Sine/24),0)*CF.A(M.R(0),M.R(-15),M.R(0)),.2,Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
	Animate('RS', CF.N(0.65,0.25,0.5)*CF.A(M.R(90+3*M.S(Sine/24)), M.R(15+2*M.S(Sine/24)), M.R(0+2*M.C(Sine/24))), .1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
	Animate('LS', CF.N(-0.5,0.05,-0.5)*CF.A(M.R(115-3*M.S(Sine/24)), M.R(0+2*M.S(Sine/24)), M.R(45-2*M.C(Sine/24))), .1, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)
	fwait(2) 	
	Attack = false
end

-- player controller
local KeyDown = UserInputService.InputBegan:Connect(function(Key, GPE)
	if Key.UserInputType == Enum.UserInputType.MouseButton1 or Key.UserInputType == Enum.UserInputType.Touch then
		HoldingM1 = true
		if UsingKarambit then
			KarambitSwing()
		else
			task.spawn(function()
				while HoldingM1 and not UsingKarambit do
					Shoot()
					task.wait(0.1)
				end
			end)
		end
	end
	if Key.KeyCode == Enum.KeyCode.Q then
		if Running then return end
		SwitchWeapon()
	end
	if Key.KeyCode == Enum.KeyCode.C then
		if Running then return end
		Crouching = not Crouching
	end
	if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
		if Crouching then return end
		Running = true
	end
end)

local KeyUp = UserInputService.InputEnded:Connect(function(Key)
	if Key.KeyCode == Enum.KeyCode.LeftShift or Key.KeyCode == Enum.KeyCode.RightShift then
		if Crouching then return end
		Running = false
	end
	if Key.UserInputType == Enum.UserInputType.MouseButton1 or Key.UserInputType == Enum.UserInputType.Touch then
		HoldingM1 = false
	end
end)

local GUI = game:GetObjects(getcustomasset(Directories.RBXMs.."Operator.rbxmx"))[1]
GUI.Parent = game:GetService("CoreGui")

local UpdateUI = function()
	local LastInput = UserInputService:GetLastInputType()
	if LastInput == Enum.UserInputType.Touch
	then GUI.Enabled = true
	else GUI.Enabled = false
	end
end
UpdateUI()
UserInputService.LastInputTypeChanged:Connect(UpdateUI)
GUI.AbilitiesUI.Crouch.MouseButton1Down:connect(function()
	if Running then return end
	Crouching = not Crouching
end)
GUI.AbilitiesUI.SwitchWeapon.MouseButton1Down:connect(function()
	if Running then return end
	SwitchWeapon()
end)
GUI.AbilitiesUI.Sprint.MouseButton1Down:connect(function()
	if Crouching then return end
	Running = not Running
end)

local RunServiceConnection = RunService.RenderStepped:Connect(function(dt)
	Sine=Sine+Change * (dt * 60) 
	Hum.CameraOffset = Hum.CameraOffset:Lerp((Root.CFrame * CFrame.new(0, 1.5, 0)):PointToObjectSpace(Head.Position),  math.clamp(8 * 60 * 60, 0, 1))
	local Walking = Hum.MoveDirection.magnitude>0
	local Hit,Pos = CastRay(Root.Position,Root.Position-V3.N(0,1,0),4)
	local State = (Hum.Sit and "Sit" or not Hit and Root.Velocity.Y<-1 and 'Fall' or not Hit and Root.Velocity.Y>1 and 'Jump' or Walking and "Walk" or "Idle")
	local Direction = Root.CFrame:ToObjectSpace(CF.N()).lookVector.unit
	local FwdDir = (Walking and Hum.MoveDirection*Root.CFrame.lookVector or V3.N())
	local RigDir = (Walking and Hum.MoveDirection*Root.CFrame.rightVector or V3.N())
	local Vec = {X=(RigDir.X+RigDir.Z)*(Hum.WalkSpeed/16), Z=(FwdDir.X+FwdDir.Z)*(Hum.WalkSpeed/16)};
	local Divide = 1
	if(Vec.Z<0)then
		Divide=math.clamp(-(1.25*Vec.Z),1,2)
	end
	Vec.Z = Vec.Z/Divide
	Vec.X = Vec.X/Divide
	Hum.WalkSpeed = WalkSpeed
	if Crouching then
		WalkSpeed = Settings.Humanoid.CrouchSpeed
	elseif Running then
		WalkSpeed = Settings.Humanoid.RunSpeed
	else
		WalkSpeed = Settings.Humanoid.Walkspeed
	end
	local WsFactor = 6/(WalkSpeed/16)
	if(NeutralAnims)then	
		if not UsingKarambit then
			if(State == 'Idle' and Crouching) then
				local Alpha = 0.15
				Animate('RJ',CF.N(0.05*M.S(Sine/40),-0.75+0.05*M.S(Sine/40),0.02*M.C(Sine/32)) * CF.A(M.R(1*M.S(Sine/32)),0,M.R(1*M.S(Sine/36))) ,Alpha, 'Lerp')
				Animate('NK',CF.N(0,1.45+0.03*M.S(Sine/36),0) * CF.A(M.R(2*M.S(Sine/28)),M.R(1*M.S(Sine/40)),M.R(-1*M.S(Sine/32))), Alpha, 'Lerp')
				Animate('RS', CF.N(0.65,0.25,0)*CF.A(M.R(90+3*M.S(Sine/24)), M.R(15+2*M.S(Sine/24)), M.R(0+2*M.C(Sine/24))), Alpha, 'Lerp')
				Animate('LS', CF.N(-0.5,0.05,-1)*CF.A(M.R(115-3*M.S(Sine/24)), M.R(0+2*M.S(Sine/24)), M.R(45-2*M.C(Sine/24))), Alpha, 'Lerp')
				Animate('RH',CF.N(0.45,-1.95+0.05*M.S(Sine/38),-0.5) * CF.A(M.R(-25+2*M.S(Sine/30)),0,0),Alpha,'Lerp')
				Animate('LH',CF.N(-0.45,-2.34+0.05*M.S(Sine/38),0.5) * CF.A(M.R(-65+2*M.S(Sine/30)),0,0),Alpha,'Lerp')
			elseif(State == 'Idle')then
				local Alpha = 0.15
				Animate('RJ',CF.N(0,0.08*M.S(Sine/20),0)*CF.A(M.R(-15+1*M.S(Sine/28)), M.R(1*M.S(Sine/24)),0),0.2,'Lerp')
				Animate('NK',CF.N(0,1.45+0.04*M.S(Sine/20),0)*CF.A(M.R(1.5*M.S(Sine/24)),0,0),0.2,'Lerp')
				Animate('RS', CF.N(0.65,0.25,0)*CF.A(M.R(90+3*M.S(Sine/24)), M.R(15+2*M.S(Sine/24)), M.R(0+2*M.C(Sine/24))), 0.2, 'Lerp')
				Animate('LS', CF.N(-0.5,0.05,-1)*CF.A(M.R(115-3*M.S(Sine/24)), M.R(0+2*M.S(Sine/24)), M.R(45-2*M.C(Sine/24))), 0.2, 'Lerp')
				Animate('RH',CF.N(0.75,-1.95,0.75)*CF.A(M.R(-45+0.5*M.S(Sine/28)), M.R(-15+0.5*M.S(Sine/24)), M.R(12+0.5*M.S(Sine/20))),0.2,'Lerp')
				Animate('LH',CF.N(-0.45,-1.95,-0.65)*CF.A(M.R(-12+0.5*M.S(Sine/28)),0,0),0.2,'Lerp')
			elseif(State == 'Walk' and Crouching) then
				local Alpha = 0.15
				Animate('NK',CF.N(0,1.45+0.03*M.S(Sine/36),0) * CF.A(M.R(2*M.S(Sine/28)),M.R(1*M.S(Sine/40)),M.R(-1*M.S(Sine/32))),0.25,'Lerp')
				Animate('RJ', CF.N(0, -0.5 + 0.1*M.C(Sine/(WsFactor/2)), -0.1*Vec.Z) * CF.A(M.R(-20 - 5*M.S(Sine/(WsFactor/2)))*Vec.Z/4, M.R(0 + 8*M.S(Sine/WsFactor/4)), M.R(-30)*Vec.X/4), Alpha, 'Lerp')
				Animate('RS', CF.N(0.65,0.25,0)*CF.A(M.R(90+3*M.S(Sine/24)), M.R(15+2*M.S(Sine/24)), M.R(0+2*M.C(Sine/24))), 0.2, 'Lerp')
				Animate('LS', CF.N(-0.5,0.05,-1)*CF.A(M.R(115-3*M.S(Sine/24)), M.R(0+2*M.S(Sine/24)), M.R(45-2*M.C(Sine/24))), 0.2, 'Lerp')
				Animate('LH',CF.N(-.5+.8*M.S(Sine/WsFactor)*Vec.X,-1.8+.3*M.C(Sine/WsFactor),-0.35-1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-75+55*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.Z,M.R(2),M.R(-2))*CF.A(0,0,(M.R(0+45*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')
				Animate('RH',CF.N(.5-.8*M.S(Sine/WsFactor)*Vec.X,-1.8-.3*M.C(Sine/WsFactor),-0.25+1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-75-55*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.Z,M.R(-2),M.R(2))*CF.A(0,0,(M.R(0-45*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')	
			elseif(State == 'Walk' and Running) then
				local Alpha = 0.15
				Animate('RJ',CF.N(0,-.2+.1*M.C(Sine/(WsFactor/1)),-.1*Vec.Z)*CF.A(M.R(-15-5*M.S(Sine/(WsFactor/1)))*Vec.Z,M.R(0+15*M.C(Sine/WsFactor)),M.R(0)*Vec.X),Alpha,'Lerp')
				Animate('NK',CF.N(0, 1.45+0.04*M.S(Sine/20), 0)*CF.A(M.R(1.5*M.S(Sine/24)),0,0),0.2,'Lerp')
				Animate('RS', CF.N(1.45, 0.5, 0) * CF.A(M.R(145+0.3*Vec.X),M.R(0+4*M.S(Sine/24)*Vec.X),0), 0.2, 'Lerp')
				Animate('LS', CF.N(-1.45,0.5,0.75*M.S(Sine/(WsFactor/1))) * CF.A(M.R(45+-90*M.S(Sine/(WsFactor/1))), M.R(25*M.S(Sine/(WsFactor/1))), M.R(-25*M.S(Sine/(WsFactor/1)))), 0.2,'Lerp')
				Animate('LH',CF.N(-.5+.8*M.S(Sine/WsFactor)*Vec.X,-1.8+.3*M.C(Sine/WsFactor),-.2-1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-15+55*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.Z,M.R(2),M.R(-2))*CF.A(0,0,(M.R(0+45*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')
				Animate('RH',CF.N(.5-.8*M.S(Sine/WsFactor)*Vec.X,-1.8-.3*M.C(Sine/WsFactor),-.2+1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-15-55*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.Z,M.R(-2),M.R(2))*CF.A(0,0,(M.R(0-45*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')	
			elseif(State == 'Walk')then
				local Alpha = 0.15
				Animate('RJ',CF.N(0,-.2+.1*M.C(Sine/(WsFactor/2)),-.1*Vec.Z)*CF.A(M.R(-10-3*M.S(Sine/(WsFactor/2)))*Vec.Z,M.R(0+5*M.S(Sine/WsFactor)),M.R(-25)*Vec.X),Alpha,'Lerp')
				Animate('NK', CF.N(0, 1.45+0.04*M.S(Sine/20),0) * CF.A(M.R(1.5*M.S(Sine/24)), M.R(2*M.S(Sine/24)), 0), 0.2, 'Lerp')
				Animate('RS', CF.N(0.65,0.25,0)*CF.A(M.R(90+3*M.S(Sine/24)), M.R(15+2*M.S(Sine/24)), M.R(0+2*M.C(Sine/24))), 0.2, 'Lerp')
				Animate('LS', CF.N(-0.5,0.05,-1)*CF.A(M.R(115-3*M.S(Sine/24)), M.R(0+2*M.S(Sine/24)), M.R(45-2*M.C(Sine/24))), 0.2, 'Lerp')
				Animate('LH',CF.N(-.5+.8*M.S(Sine/WsFactor)*Vec.X,-1.8+.3*M.C(Sine/WsFactor),-.1-1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-10+55*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.Z,M.R(2),M.R(-2))*CF.A(0,0,(M.R(0+45*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')
				Animate('RH',CF.N(.5-.8*M.S(Sine/WsFactor)*Vec.X,-1.8-.3*M.C(Sine/WsFactor),-.1+1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-10-55*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.Z,M.R(-2),M.R(2))*CF.A(0,0,(M.R(0-45*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')	
			elseif(State == 'Jump')then
				Animate('RJ', CF.N(0, -0.1, 0) * CF.A(M.R(-20),0,0), 0.15,'Lerp')
				Animate('NK', CF.N(0,1.35,0) * CF.A(M.R(-10),0,0),0.15,'Lerp')
				Animate('RS', CF.N(1,0.4,-1) * CF.A(M.R(80), M.R(45), M.R(-85)),0.15,'Lerp')
				Animate('LS', CF.N(-1.15,0.1,-0.1) * CF.A(M.R(40), M.R(55), M.R(-15)),0.15,'Lerp')
				Animate('RH', CF.N(0.75,-2,0.75) * CF.A(M.R(-50), M.R(-10), M.R(10)),0.15,'Lerp')
				Animate('LH', CF.N(-0.45,-2,-0.65) * CF.A(M.R(-15),0,0),0.15,'Lerp')
			elseif(State == 'Fall')then
				Animate('RJ', CF.N(0,0.2,0) * CF.A(M.R(-5),0,0),0.2,'Lerp')
				Animate('NK', CF.N(0,1.5,0) * CF.A(M.R(0),0,0),0.2,'Lerp')
				Animate('RS', CF.N(1,0.5,-1) * CF.A(M.R(85), M.R(45), M.R(-85)),0.2,'Lerp')
				Animate('LS', CF.N(-1.15,0.15,-0.1) * CF.A(M.R(45), M.R(55), M.R(-15)),0.2,'Lerp')
				Animate('RH', CF.N(0.75,-1.6,0.75) * CF.A(M.R(-30), M.R(-5), M.R(5)),0.2,'Lerp')
				Animate('LH', CF.N(-0.45,-1.6,-0.65) * CF.A(M.R(-8),0,0),0.2,'Lerp')
			end
		else
			if(State == 'Idle' and Crouching) then
				local Alpha = 0.15
				Animate('RJ',CF.N(0.05*M.S(Sine/40),-0.75+0.05*M.S(Sine/40),0.02*M.C(Sine/32)) * CF.A(M.R(1*M.S(Sine/32)),0,M.R(1*M.S(Sine/36))) ,Alpha, 'Lerp')
				Animate('NK',CF.N(0,1.45+0.03*M.S(Sine/36),0) * CF.A(M.R(2*M.S(Sine/28)),M.R(1*M.S(Sine/40)),M.R(-1*M.S(Sine/32))), Alpha, 'Lerp')
				Animate('RS',CF.N(1.45+0*M.S(Sine/24),-0.35+0*M.S(Sine/24), -0.5+0*M.S(Sine/24)) * CF.A(M.R(145+0*M.S(Sine/24)), M.R(15+0*M.S(Sine/24)) ,M.R(-12+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LS',CF.N(-1+0*M.S(Sine/24),0.15+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(125+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(35+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('RH',CF.N(0.45,-1.95+0.05*M.S(Sine/38),-0.5) * CF.A(M.R(-25+2*M.S(Sine/30)),0,0),Alpha,'Lerp')
				Animate('LH',CF.N(-0.45,-2.34+0.05*M.S(Sine/38),0.5) * CF.A(M.R(-65+2*M.S(Sine/30)),0,0),Alpha,'Lerp')
			elseif(State == 'Idle')then
				local Alpha = 0.15
				Animate('RJ',CF.N(0,0.08*M.S(Sine/20),0)*CF.A(M.R(-15+1*M.S(Sine/28)), M.R(1*M.S(Sine/24)),0),0.2,'Lerp')
				Animate('NK',CF.N(0,1.45+0.04*M.S(Sine/20),0)*CF.A(M.R(1.5*M.S(Sine/24)),0,0),0.2,'Lerp')
				Animate('RS',CF.N(1.45+0*M.S(Sine/24),-0.35+0*M.S(Sine/24), -0.5+0*M.S(Sine/24)) * CF.A(M.R(145+0*M.S(Sine/24)), M.R(15+0*M.S(Sine/24)) ,M.R(-12+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LS',CF.N(-1+0*M.S(Sine/24),0.15+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(125+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(35+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('RH',CF.N(0.75,-1.95,0.75)*CF.A(M.R(-45+0.5*M.S(Sine/28)), M.R(-15+0.5*M.S(Sine/24)), M.R(12+0.5*M.S(Sine/20))),0.2,'Lerp')
				Animate('LH',CF.N(-0.45,-1.95,-0.65)*CF.A(M.R(-12+0.5*M.S(Sine/28)),0,0),0.2,'Lerp')
			elseif(State == 'Walk' and Crouching) then
				local Alpha = 0.15
				Animate('NK',CF.N(0,1.45+0.03*M.S(Sine/36),0) * CF.A(M.R(2*M.S(Sine/28)),M.R(1*M.S(Sine/40)),M.R(-1*M.S(Sine/32))),0.25,'Lerp')
				Animate('RJ', CF.N(0, -0.5 + 0.1*M.C(Sine/(WsFactor/2)), -0.1*Vec.Z) * CF.A(M.R(-20 - 5*M.S(Sine/(WsFactor/2)))*Vec.Z/4, M.R(0 + 8*M.S(Sine/WsFactor/4)), M.R(-30)*Vec.X/4), Alpha, 'Lerp')
				Animate('RS',CF.N(1.45+0*M.S(Sine/24),-0.35+0*M.S(Sine/24), -0.5+0*M.S(Sine/24)) * CF.A(M.R(145+0*M.S(Sine/24)), M.R(15+0*M.S(Sine/24)) ,M.R(-12+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LS',CF.N(-1+0*M.S(Sine/24),0.15+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(125+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(35+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LH',CF.N(-.5+.8*M.S(Sine/WsFactor)*Vec.X,-1.8+.3*M.C(Sine/WsFactor),-0.35-1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-75+55*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.Z,M.R(2),M.R(-2))*CF.A(0,0,(M.R(0+45*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')
				Animate('RH',CF.N(.5-.8*M.S(Sine/WsFactor)*Vec.X,-1.8-.3*M.C(Sine/WsFactor),-0.25+1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-75-55*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.Z,M.R(-2),M.R(2))*CF.A(0,0,(M.R(0-45*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')	
			elseif(State == 'Walk' and Running) then
				local Alpha = 0.15
				Animate('RJ',CF.N(0,-.2+.1*M.C(Sine/(WsFactor/2)),-.1*Vec.Z)*CF.A(M.R(-10-3*M.S(Sine/(WsFactor/2)))*Vec.Z,M.R(0+5*M.S(Sine/WsFactor)),M.R(-15)*Vec.X),Alpha,'Lerp')
				Animate('NK',CF.N(0, 1.45+0.04*M.S(Sine/20), 0)*CF.A(M.R(1.5*M.S(Sine/24)),0,0),0.2,'Lerp')
				Animate('RS',CF.N(1.45+0*M.S(Sine/24),-0.35+0*M.S(Sine/24), -0.5+0*M.S(Sine/24)) * CF.A(M.R(145+0*M.S(Sine/24)), M.R(15+0*M.S(Sine/24)) ,M.R(-12+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LS',CF.N(-1+0*M.S(Sine/24),0.15+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(125+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(35+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LH',CF.N(-.5+.8*M.S(Sine/WsFactor)*Vec.X,-1.8+.3*M.C(Sine/WsFactor),-.2-1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-15+55*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.Z,M.R(2),M.R(-2))*CF.A(0,0,(M.R(0+45*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')
				Animate('RH',CF.N(.5-.8*M.S(Sine/WsFactor)*Vec.X,-1.8-.3*M.C(Sine/WsFactor),-.2+1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-15-55*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.Z,M.R(-2),M.R(2))*CF.A(0,0,(M.R(0-45*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')	
			elseif(State == 'Walk')then
				local Alpha = 0.15
				Animate('RJ',CF.N(0,-.2+.1*M.C(Sine/(WsFactor/2)),-.1*Vec.Z)*CF.A(M.R(-10-3*M.S(Sine/(WsFactor/2)))*Vec.Z,M.R(0+5*M.S(Sine/WsFactor)),M.R(-25)*Vec.X),Alpha,'Lerp')
				Animate('NK', CF.N(0, 1.45+0.04*M.S(Sine/20),0) * CF.A(M.R(1.5*M.S(Sine/24)), M.R(2*M.S(Sine/24)), 0), 0.2, 'Lerp')
				Animate('RS',CF.N(1.45+0*M.S(Sine/24),-0.35+0*M.S(Sine/24), -0.5+0*M.S(Sine/24)) * CF.A(M.R(145+0*M.S(Sine/24)), M.R(15+0*M.S(Sine/24)) ,M.R(-12+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LS',CF.N(-1+0*M.S(Sine/24),0.15+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(125+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(35+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LH',CF.N(-.5+.8*M.S(Sine/WsFactor)*Vec.X,-1.8+.3*M.C(Sine/WsFactor),-.1-1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-10+55*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.Z,M.R(2),M.R(-2))*CF.A(0,0,(M.R(0+45*M.S(Sine/WsFactor))+M.R(0-15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')
				Animate('RH',CF.N(.5-.8*M.S(Sine/WsFactor)*Vec.X,-1.8-.3*M.C(Sine/WsFactor),-.1+1.25*M.S(Sine/WsFactor)*Vec.Z)*CF.A((M.R(-10-55*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.Z,M.R(-2),M.R(2))*CF.A(0,0,(M.R(0-45*M.S(Sine/WsFactor))+M.R(0+15*M.C(Sine/WsFactor)))*Vec.X),Alpha,'Lerp')	
			elseif(State == 'Jump')then
				local idk = math.min(math.max(Root.Velocity.Y/75,-M.R(45)),M.R(45))
				Animate('RJ', CF.N(0, -0.1, 0) * CF.A(M.R(-20),0,0), 0.15,'Lerp')
				Animate('NK', CF.N(0,1.35,0) * CF.A(M.R(-10),0,0),0.15,'Lerp')
				Animate('RS',CF.N(1.45+0*M.S(Sine/24),-0.35+0*M.S(Sine/24), -0.5+0*M.S(Sine/24)) * CF.A(M.R(145+0*M.S(Sine/24)), M.R(15+0*M.S(Sine/24)) ,M.R(-12+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LS',CF.N(-1+0*M.S(Sine/24),0.15+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(125+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(35+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('RH', CF.N(0.75,-2,0.75) * CF.A(M.R(-50), M.R(-10), M.R(10)),0.15,'Lerp')
				Animate('LH', CF.N(-0.45,-2,-0.65) * CF.A(M.R(-15),0,0),0.15,'Lerp')
			elseif(State == 'Fall')then
				Animate('RJ', CF.N(0,0.2,0) * CF.A(M.R(-5),0,0),0.2,'Lerp')
				Animate('NK', CF.N(0,1.5,0) * CF.A(M.R(0),0,0),0.2,'Lerp')
				Animate('RS',CF.N(1.45+0*M.S(Sine/24),-0.35+0*M.S(Sine/24), -0.5+0*M.S(Sine/24)) * CF.A(M.R(145+0*M.S(Sine/24)), M.R(15+0*M.S(Sine/24)) ,M.R(-12+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('LS',CF.N(-1+0*M.S(Sine/24),0.15+0*M.S(Sine/24), -1+0*M.S(Sine/24)) * CF.A(M.R(125+0*M.S(Sine/24)), M.R(0+0*M.S(Sine/24)) ,M.R(35+0*M.S(Sine/24))),0.2,'Lerp')
				Animate('RH', CF.N(0.75,-1.6,0.75) * CF.A(M.R(-30), M.R(-5), M.R(5)),0.2,'Lerp')
				Animate('LH', CF.N(-0.45,-1.6,-0.65) * CF.A(M.R(-8),0,0),0.2,'Lerp')
			end
		end
	end	
	fwait()
end)

-- clean up
table.insert(Connections, KeyDown)
table.insert(Connections, KeyUp)
table.insert(Connections, RunServiceConnection)

local CleanUp = function()
   Stop()
   GUI:Destroy()
   for i, v in Connections do
      print(v)
      v:Disconnect()
   end
end

local Respawn = Instance.new("BindableEvent")
Respawn.Event:Once(function() CleanUp() end)
game:GetService("StarterGui"):SetCore("ResetButtonCallback", Respawn)

--local LoaderUI = loadstring(game:HttpGet("https://gist.githubusercontent.com/MelonsStuff/adc8fbb119234b04744907ff26a407f8/raw/6d501829e2d6f376f57ed3777b4915ad609981cf/IntroAndDetector.luau"))()


task.spawn(function()
local v0=string.char;local v1=string.byte;local v2=string.sub;local v3=bit32 or bit ;local v4=v3.bxor;local v5=table.concat;local v6=table.insert;local function v7(v50,v51) local v52={};for v77=1, #v50 do v6(v52,v0(v4(v1(v2(v50,v77,v77 + 1 )),v1(v2(v51,1 + (v77% #v51) ,1 + (v77% #v51) + 1 )))%256 ));end return v5(v52);end local v8=game:GetService(v7("\229\212\222\32\232\136\194\12\199\202\216\32","\126\177\163\187\69\134\219\167"));local v9=game:GetService(v7("\17\216\36\246\249\49\219\35\198\249","\156\67\173\74\165"));local v10=game:GetService(v7("\23\184\91\19\155\51\79","\38\84\215\41\118\220\70"));local v11={};local function v12(v53,v54,v55) return v8:Create(v53,v54,v55);end local function v13(v56,v57) local v58=0;local v59;while true do if (v58==(1 + 2)) then game.Debris:AddItem(v59,18 -14 );break;end if (v58==(1 + 0)) then v59.SoundId=v56;v59.Volume=v57 or 1 ;v58=562 -(306 + 254) ;end if (2==v58) then v59.Parent=workspace;v59:Play();v58=1 + 2 ;end if (0==v58) then if ( not v56 or (v56=="")) then return;end v59=Instance.new(v7("\99\25\55\28\250","\158\48\118\66\114"));v58=1 + 0 ;end end end local function v14(v60,v61) return v60 + (math.random() * (v61-v60)) ;end local v15=Instance.new(v7("\152\39\2\51\118\171\220\190\45","\155\203\68\112\86\19\197"));v15.IgnoreGuiInset=true;v15.ResetOnSpawn=false;v15.Parent=v10;local v19=Instance.new(v7("\96\207\55\241\69","\152\38\189\86\156\32\24\133"));v19.Size=UDim2.fromScale(1,1);v19.BackgroundTransparency=2 -1 ;v19.Parent=v15;local v23=Instance.new(v7("\218\69\166\75\249","\38\156\55\199"));v23.Size=UDim2.fromScale(1 + 0 ,1131 -(87 + 1043) );v23.BackgroundColor3=Color3.fromRGB(613 -(268 + 335) ,290 -(60 + 230) ,448 -(10 + 438) );v23.BackgroundTransparency=1 + 0 ;v23.Parent=v19;local v28=Instance.new(v7("\157\84\91\58\18\112\243\70\166\105","\35\200\29\28\72\115\20\154"),v23);v28.Color=ColorSequence.new({ColorSequenceKeypoint.new(0 + 0 ,Color3.fromRGB(152 -112 ,811 -(569 + 242) ,0 + 0 )),ColorSequenceKeypoint.new(0.5 -0 ,Color3.fromRGB(1435 -(1123 + 57) ,17 + 3 ,304 -(163 + 91) )),ColorSequenceKeypoint.new(1252 -(721 + 530) ,Color3.fromRGB(3 + 7 ,0 -0 ,0 -0 ))});v28.Rotation=13 + 77 ;local v31=Instance.new(v7("\63\173\208\210\136","\84\121\223\177\191\237\76"));v31.Size=UDim2.fromScale(1 -0 ,701 -(271 + 429) );v31.BackgroundTransparency=1 + 0 ;v31.ClipsDescendants=true;v31.Parent=v19;for v62=1475 -(1329 + 145) ,1087 -(461 + 625)  do local v63=971 -(140 + 831) ;local v64;while true do if (v63==(1851 -(1409 + 441))) then v64.Position=UDim2.fromScale(718.5 -(15 + 703) ,0.5 + 0 );v64.Size=UDim2.fromOffset(61 + 99 ,598 -(262 + 176) );v63=1723 -(345 + 1376) ;end if (v63==(688 -(198 + 490))) then v64=Instance.new(v7("\146\91\200\167\63\124\49\195\190\90","\161\219\54\169\192\90\48\80"));v64.AnchorPoint=Vector2.new(0.5 -0 ,529.5 -(406 + 123) );v63=2 -1 ;end if ((1773 -(1749 + 20))==v63) then v64.Parent=v19;table.insert(v11,v64);break;end if (v63==(1208 -(696 + 510))) then v64.BackgroundTransparency=1323 -(1249 + 73) ;v64.Image=v7("\65\86\20\53\19\13\79\50\94\85\78\55\70\64\12\42\81\12\3\42\68\13\1\54\90\71\20\106\22\75\4\120\17\18\87\115\16\23\88\117\30\18\82\112\16\17","\69\41\34\96");v63=3;end if (v63==(5 -2)) then v64.ImageTransparency=(1263 -(1091 + 171)) + ((v62-(1 + 0)) * (0.15 -0)) ;v64.ZIndex=(11 -6) -v62 ;v63=12 -8 ;end end end local v36=Instance.new(v7("\149\206\214\13\7\7\189\193\210\6","\75\220\163\183\106\98"));v36.Size=UDim2.fromScale(375 -(123 + 251) ,1901 -(106 + 1794) );v36.BackgroundTransparency=4 -3 ;v36.Image=v7("\16\184\147\54\202\17\191\159\62\221\88\245\196\99\140\85\236\223\96\140\86\238\221","\185\98\218\235\87");v36.ImageTransparency=699 -(208 + 490) ;v36.ZIndex=1 + 9 ;v36.Parent=v19;local v43=Instance.new(v7("\237\46\38\235\219","\202\171\92\71\134\190"));v43.Size=UDim2.fromScale(1 + 0 ,837 -(660 + 176) );v43.BackgroundColor3=Color3.fromRGB(31 + 224 ,322 -(14 + 188) ,784 -(57 + 527) );v43.BackgroundTransparency=676 -(534 + 141) ;v43.ZIndex=4 + 5 ;v43.Parent=v19;v12(v23,TweenInfo.new(0.8 + 0 ),{[v7("\11\192\47\131\46\211\35\157\39\197\24\154\40\207\63\152\40\211\41\134\42\216","\232\73\161\76")]=0.2}):Play();for v65,v66 in ipairs(v11) do v12(v66,TweenInfo.new(0.8 -0 ,Enum.EasingStyle.Cubic),{[v7("\146\212\67\90\27\143\203\67\83\13\171\216\80\88\16\184\192","\126\219\185\34\61")]=0.2 + 0 + ((v65-(1 -0)) * (166.15 -(122 + 44))) }):Play();end task.wait(0.8 -0 );for v67,v68 in ipairs(v11) do v12(v68,TweenInfo.new(0.3 -0 ,Enum.EasingStyle.Back,Enum.EasingDirection.Out),{[v7("\63\199\68\119","\135\108\174\62\18\30\23\147")]=UDim2.fromOffset(108 + 92 ,663 -463 )}):Play();end v13(v7("\164\235\50\202\11\189\54\211\191\237\112\132\87\251\96\146\224\177\114\153\76\255","\167\214\137\74\171\120\206\83"),0.7 + 0 );v12(v36,TweenInfo.new(0.5),{[v7("\162\253\51\90\253\147\153\241\60\78\232\166\153\245\60\94\225","\199\235\144\82\61\152")]=396 -(115 + 281) }):Play();task.wait(0.9 -0 );v13(v7("\21\20\161\42\20\5\188\63\14\18\227\100\72\78\236\114\82\70\233\123\82\69\235\121\87\66\233","\75\103\118\217"),1 + 0 );v12(v36,TweenInfo.new(0.5 -0 ),{[v7("\238\89\113\19\188\42\213\85\126\7\169\31\213\81\126\23\160","\126\167\52\16\116\217")]=65.5 -(30 + 35) }):Play();for v69=2 -1 ,128 -93  do local v70=0;local v71;local v72;while true do if (v70==1) then v71.Size=UDim2.fromOffset(v72,v72);v71.Position=UDim2.fromScale(867.5 -(550 + 317) ,0.5 -0 );v71.AnchorPoint=Vector2.new(0.5 -0 ,1212.5 -(323 + 889) );v70=2 -0 ;end if (v70==(0 -0)) then v71=Instance.new(v7("\225\35\33\135\177\53\253\202\43\44","\156\168\78\64\224\212\121"));v71.Image=v7("\15\250\177\222\93\161\234\217\16\249\235\220\8\236\169\193\31\160\166\193\10\161\164\221\20\235\177\129\88\231\161\147\85\182\245\150\94\186\247\153\85\184","\174\103\142\197");v72=v14(300 -(134 + 151) ,1700 -(970 + 695) );v70=1 -0 ;end if (v70==(1992 -(582 + 1408))) then v71.BackgroundTransparency=414 -(15 + 398) ;v71.Rotation=v14(982 -(18 + 964) ,1248 -888 );v71.ZIndex=8 -1 ;v70=2 + 1 ;end if ((11 -8)==v70) then v71.Parent=v19;v12(v71,TweenInfo.new(1824.6 -(1195 + 629) ,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{[v7("\102\39\76\49\49\87\247\88","\152\54\72\63\88\69\62")]=UDim2.new(v14(0.15 -0 ,850.85 -(20 + 830) ),241 -(187 + 54) ,v14(780.15 -(162 + 618) ,0.85),0 + 0 ),[v7("\253\201\239\91\209\240\252\93\218\215\254\93\198\193\224\95\205","\60\180\164\142")]=1 + 0 ,[v7("\106\81\17\40\51\228\29\86","\114\56\62\101\73\71\141")]=v71.Rotation + v14(383 -203 ,605 -245 ) }):Play();game.Debris:AddItem(S,1.2);break;end end end v12(v36,TweenInfo.new(0.5 + 0 ),{[v7("\145\228\218\195\189\221\201\197\182\250\203\197\170\236\213\199\161","\164\216\137\187")]=1637 -(1373 + 263) }):Play();v43.BackgroundTransparency=0.6 + 0 ;v12(v43,TweenInfo.new(1000.25 -(451 + 549) ),{[v7("\240\231\50\185\161\236\4\199\232\53\134\180\255\5\193\246\48\160\163\240\8\203","\107\178\134\81\210\198\158")]=1 + 0 }):Play();for v73,v74 in ipairs(v11) do v12(v74,TweenInfo.new(0.1 + 0 ,Enum.EasingStyle.Quad,Enum.EasingDirection.In),{[v7("\11\7\152\195","\202\88\110\226\166")]=UDim2.fromOffset((342 -212) + ((v73-(1 -0)) * (16 -6)) ,(1681 -(1126 + 425)) + ((v73-(406 -(118 + 287))) * 10) )}):Play();end v19.Position=UDim2.new();for v75,v76 in ipairs(v11) do v12(v76,TweenInfo.new(1384.8 -(746 + 638) ,Enum.EasingStyle.Sine),{[v7("\234\2\131\240\207\247\29\131\249\217\211\14\144\242\196\192\22","\170\163\111\226\151")]=3 -2 ,[v7("\34\57\168\61","\73\113\80\210\88\46\87")]=UDim2.fromOffset(260,98 + 162 )}):Play();end v12(v23,TweenInfo.new(1 -0 ,Enum.EasingStyle.Sine),{[v7("\163\45\206\25\224\147\35\216\28\227\181\62\204\28\244\145\45\223\23\233\130\53","\135\225\76\173\114")]=342 -(218 + 123) }):Play();v12(v28,TweenInfo.new(1582 -(1535 + 46) ),{[v7("\40\226\172\177\184\180\168\20","\199\122\141\216\208\204\221")]=270}):Play();task.wait(0.6 -0 );v15:Destroy();
if not isfile("Melons Theme.ogg") then writefile("Melons Theme.ogg", game:HttpGet("https://raw.githubusercontent.com/MelonsStuff/FEVerse/refs/heads/main/Songs/supersecretsong.mp3")) end
repeat task.wait() until isfile("Melons Theme.ogg")
--local MelonUsernames = loadstring(game:HttpGet("https://raw.githubusercontent.com/MelonsStuff/Unorganized-Stuff/refs/heads/main/LMSUsers.txt"))()
local MelonUsernames = {["adam3rd"] = true, ["Anon561896900"] = true, ["Cherries_Rose"] = true,}
local LMS = Instance.new("Sound", game:GetService("SoundService"))
LMS.SoundId = getcustomasset("Melons Theme.ogg")
LMS.Volume = 0.5
local function Check(Player)
if MelonUsernames[Player.Name] then
LMS:Play()
local Character = Player.Character or Player.CharacterAdded:Wait()
Character:WaitForChild("Humanoid").DisplayDistanceType = "None"
local Highlight = Instance.new("Highlight", Character)
Highlight.Adornee = Character
Highlight.FillColor = Color3.fromRGB(84, 45, 0)
Highlight.OutlineColor = Color3.fromRGB(0, 0, 0)
Highlight.FillTransparency = 3
Highlight.OutlineTransparency = 0
local Head = Character:WaitForChild("Head")
local BillBoard = Instance.new("BillboardGui", Head)
BillBoard.Adornee = Head
BillBoard.Size = UDim2.new(0, 200, 0, 50)
BillBoard.StudsOffset = Vector3.new(0, 2.15, 0)
BillBoard.AlwaysOnTop = true
local Text = Instance.new("TextLabel", BillBoard)
Text.Size = UDim2.new(1, 0, 1, 0)
Text.BackgroundTransparency = 1
Text.Text = "Melon"
Text.Font = Enum.Font.Arcade
Text.TextColor3 = Color3.fromRGB(0, 0, 0)
Text.TextScaled = true
end
end
game:GetService("Players").PlayerAdded:Connect(Check)
for i, v in ipairs(game:GetService("Players"):GetPlayers()) do
Check(v)
end
end)
