local CurrentSpellButton

function MakepSpells()
	if pSpells then
		pSpells:Remove()
		pSpells = nil
	end

	local cv_A = GetConVar("nox_useactionbar")
	local UsingActionBar = cv_A:GetBool()

	if MySelf:NumCastableSpells() == 0 then
		MySelf:ChatPrint("Your class can not cast any spells or use abilities and thus can not use this menu.")
		return
	end

	local pw = 480
	local ph = 600

	local Window = vgui.Create("DFrame")
	Window:SetSize(pw, ph)
	Window:Center()
	Window:SetTitle("Hotkeys - " .. MySelf:GetPlayerClassTable().Name)
	Window:SetVisible(true)
	Window:SetDraggable(false)
	Window:SetKeyboardInputEnabled(false)
	Window:MakePopup()
	pSpells = Window

	local cy = 72
	local cx = 32
	local SpellsSorted = MySelf:GetCastableSpells()
	for i=1, #SpellsSorted do
		button = vgui.Create("SpellBindingSelectButton", Window)
		button.SpellID = SpellsSorted[i]
		button:SetPos(cx, cy)
		button:SetSize(32, 32)

		cx = cx + 32
		if cx >= pw - 32 then
			cx = 32
			cy = cy + 32
		end
	end

	local dX = pw * 0.5 - 80
	local dY = ph * 0.5 - 80

	local x = dX

	if not UsingActionBar then
		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_FORWARD + IN_MOVELEFT
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 64

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_FORWARD
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 64

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_FORWARD + IN_MOVERIGHT
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dY = dY + 32
		dX = dX - 96

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_FORWARD + IN_MOVELEFT
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_FORWARD
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_FORWARD + IN_MOVERIGHT
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX - 64
		dY = dY + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_MOVELEFT
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX - 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_MOVELEFT
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 96

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_MOVERIGHT
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_MOVERIGHT
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX - 96
		dY = dY + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_BACK + IN_MOVELEFT
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_BACK
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_BACK + IN_MOVERIGHT
		button.Set = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX - 96
		dY = dY + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_MOVELEFT + IN_BACK
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 64

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_BACK
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

		dX = dX + 64

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = IN_BACK + IN_MOVERIGHT
		button.Set = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)

	else
		dX = dX/2
		x = x/2
		surface.SetFont("Default")

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 10
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("S1")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 11
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("S2")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 12
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("S3")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 13
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("S4")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 14
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("S5")

		dX = dX + 48

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 15
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("Q")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 16
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("E")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 17
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("R")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 18
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("F")

		dX = x
		dY = dY + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 1
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("1")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 2
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("2")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 3
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("3")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 4
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("4")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 5
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("5")

		dX = dX + 48

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 6
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("q")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 7
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("e")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 8
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("r")

		dX = dX + 32

		local button = vgui.Create("SpellBindingButton", Window)
		button.Bind = 9
		button:SetPos(dX, dY)
		button:SetSize(32, 32)
		surface.SetTextPos(dX+4, dY)
		surface.DrawText("f")
	end

	if UsingActionBar then
		local kbutton = vgui.Create("DButton", Window)
		kbutton:SetSize(128, 32)
		kbutton:Center()
		local x,y = kbutton:GetPos()
		kbutton:SetPos(x, dY+128)
		kbutton:SetText("Change Key Bindings")
		kbutton.DoClick = function() showKBMenu() end
	end

	local label = vgui.Create("DLabel", Window)
	label.OldPaint = label.Paint
	label.Paint = function(lab)
		if CurrentSpellButton then
			label:SetText(CurrentSpellButton.Name)
			label:SetTextColor(COLOR_CYAN)
			label:SetFont("DefaultBold")
			surface.SetFont("DefaultBold")
			local texw, texh = surface.GetTextSize(CurrentSpellButton.Name)
			label:SetSize(texw, texh)
			label:SetPos(lab:GetParent():GetWide() * 0.5 - texw * 0.5, 32)
			--label:SetVisible(true)
		else
			--label:SetVisible(false)
			label:SetText(" ")
		end
		--label:OldPaint()
	end
	--label:Think()

	local label = vgui.Create("DLabel", Window)
	label.OldPaint = label.Paint
	label.Paint = function(lab)
		if CurrentSpellButton then
			label:SetText(CurrentSpellButton.Desc)
			label:SetTextColor(COLOR_GOLD)
			surface.SetFont("Default")
			local texw, texh = surface.GetTextSize(CurrentSpellButton.Desc)
			label:SetSize(texw, texh)
			label:SetPos(lab:GetParent():GetWide() * 0.5 - texw * 0.5, 36 + texh)
			--label:SetVisible(true)
		else
			--label:SetVisible(false)
			label:SetText(" ")
		end
		--label:OldPaint()
	end
	--label:Think()

	surface.SetFont("Default")
	local getw, geth = surface.GetTextSize("Set")

	local y = ph - 11 * geth
	local x = 32

	local label = vgui.Create("DLabel", Window)
	local txt = "Click on a spell up top and then click on a slot to assign it to a speedkey."
	label:SetPos(x, y)
	label:SetSize(surface.GetTextSize(txt))
	label:SetTextColor(color_white)
	label:SetText(txt)
	label:SetFont("Default")

	y = y + geth

	local label = vgui.Create("DLabel", Window)
	local txt = "Right click a speedkey to clear it."
	label:SetPos(x, y)
	label:SetSize(surface.GetTextSize(txt))
	label:SetTextColor(color_white)
	label:SetText(txt)
	label:SetFont("Default")

	y = y + geth

	local label = vgui.Create("DLabel", Window)
	local txt = "Spells set configs are saved on your computer by class name."
	label:SetPos(x, y)
	label:SetSize(surface.GetTextSize(txt))
	label:SetTextColor(color_white)
	label:SetText(txt)
	label:SetFont("Default")

	y = y + geth

	local label = vgui.Create("DLabel", Window)
	local txt = "Some classes do not use spells and this menu will be blank if so."
	label:SetPos(x, y)
	label:SetSize(surface.GetTextSize(txt))
	label:SetTextColor(color_white)
	label:SetText(txt)
	label:SetFont("Default")

	y = y + geth

	if UsingActionBar then
		local label = vgui.Create("DLabel", Window)
		local txt = "Spells are cast on others by default. Hold Alt to cast on yourself."
		label:SetPos(x, y)
		label:SetSize(surface.GetTextSize(txt))
		label:SetTextColor(color_white)
		label:SetText(txt)
		label:SetFont("Default")
	end

	if not UsingActionBar then
		local label = vgui.Create("DLabel", Window)
		local txt = "  - Hold right mouse button and move in that direction for spell set 1."
		label:SetPos(x, y)
		label:SetSize(surface.GetTextSize(txt))
		label:SetTextColor(color_white)
		label:SetText(txt)
		label:SetFont("Default")

		y = y + geth

		local label = vgui.Create("DLabel", Window)
		local txt = "  - Hold right AND left mouse button and move in that direction for spell set 2."
		label:SetPos(x, y)
		label:SetSize(surface.GetTextSize(txt))
		label:SetTextColor(color_white)
		label:SetText(txt)
		label:SetFont("Default")

		y = y + geth

		local label = vgui.Create("DLabel", Window)
		local txt = "  - Cast your active spell by pushing your sprint key."
		label:SetPos(x, y)
		label:SetSize(surface.GetTextSize(txt))
		label:SetTextColor(color_white)
		label:SetText(txt)
		label:SetFont("Default")

		y = y + geth * 2
	end
	--[[local label = vgui.Create("DLabel", Window)
	local txt = "You can bind spells directly to keys with the console. Example: bind \"t\" \"cast fire bolt\""
	label:SetPos(x, y)
	label:SetSize(surface.GetTextSize(txt))
	label:SetTextColor(color_white)
	label:SetText(txt)
	label:SetFont("Default")]]
end

local PANEL = {}
function PANEL:OnMousePressed(mc)
	if MySelf:NumCastableSpells() == 0 or not BINDBUTTONSPELL and mc ~= MOUSE_RIGHT then return end

	local set = self.Set
	local bind = self.Bind
	local class = MySelf:GetPlayerClass()

	local cv_A = GetConVar("nox_useactionbar")
        local UsingActionBar = cv_A:GetBool()


	if mc == MOUSE_LEFT then
		if not UsingActionBar then
			SPELL_SHEETS[class][bind][set] = Spells[BINDBUTTONSPELL].Name
			nospellshint = false

			surface.PlaySound("buttons/button9.wav")
			GAMEMODE:SaveSpellSheet(class)
		else
			SPELL_SHEETS_A[class][bind] = Spells[BINDBUTTONSPELL].Name
			nospellshint = false

			surface.PlaySound("buttons/button9.wav")
			GAMEMODE:SaveSpellSheetA(class)
		end
	elseif mc == MOUSE_RIGHT then
		if not UsingActionBar then
			SPELL_SHEETS[class][bind][set] = "-"

			surface.PlaySound("buttons/button9.wav")
			GAMEMODE:SaveSpellSheet(class)
		else
			SPELL_SHEETS_A[class][bind]= "-"

			surface.PlaySound("buttons/button9.wav")
			GAMEMODE:SaveSpellSheetA(class)
		end
	end
end

local cv_A = GetConVar("nox_useactionbar")

function PANEL:Paint()
	if MySelf:NumCastableSpells() == 0 then return true end

  local UsingActionBar = cv_A:GetBool()
	local tab = nil

	if not UsingActionBar then
		tab = NameToSpell[ SPELL_SHEETS[MySelf:GetPlayerClass()][self.Bind][self.Set] ]
	else
		tab = NameToSpell[ SPELL_SHEETS_A[MySelf:GetPlayerClass()][self.Bind] ]
	end

	if tab then
		surface.SetMaterial(Spells[tab].Icon)
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawTexturedRect(0, 0, self:GetWide(), self:GetTall())
	else
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	end
	--draw.RoundedBox(8, 0, 0, self:GetWide(), self:GetTall(), bgColor)
	--draw.SimpleText(tab.Icon, "Default", self:GetWide() / 2, self:GetTall() / 2, fgColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

	return true
end
vgui.Register("SpellBindingButton", PANEL, "Button")


local PANEL = {}
function PANEL:DoClick()
	if BINDBUTTONSPELL and BINDBUTTONSPELL == self.SpellID then
		BINDBUTTONSPELL = nil
		surface.PlaySound("buttons/button18.wav")
	else
		BINDBUTTONSPELL = self.SpellID
		surface.PlaySound("buttons/button17.wav")
	end
end
function PANEL:Paint()
	local x, y = self:GetPos()
	local parentx, parenty = self:GetParent():GetPos()
	x, y = x + parentx, y + parenty
	local mx, my = gui.MousePos()
	local wid, hei = self:GetSize()
	local csb = mx >= x and mx <= x + wid and my >= y and my <= y + hei
	if csb then
		CurrentSpellButton = Spells[self.SpellID]
	end

	if BINDBUTTONSPELL then
		if BINDBUTTONSPELL == self.SpellID then
			surface.SetDrawColor(140, 255, 140, 255)
		else
			surface.SetDrawColor(130, 130, 130, 255)
		end
	elseif csb then
		surface.SetDrawColor(255, 255, 255, 255)
		surface.DrawOutlinedRect(0, 0, self:GetWide(), self:GetTall())
	else
		surface.SetDrawColor(255, 255, 255, 255)
	end

	surface.SetMaterial(Spells[self.SpellID].Icon)
	surface.DrawTexturedRect(0, 0, self:GetWide(), self:GetTall())

	return true
end
vgui.Register("SpellBindingSelectButton", PANEL, "Button")

function showKBMenu()
	local panel = vgui.Create("DFrame")
	panel:SetSize(400,300)
	panel:Center()
	panel:SetTitle("Change Key Bindings")
	panel.Paint = function(self, w, h)
		draw.RoundedBox(16, 0, 0, w, h, Color(0,0,0,255))
	end

	BindingKey = true
	panel.OnClose = function() BindingKey = false end

	local x = (panel:GetWide() - 9*32 - 16)/2
	local y = panel:GetTall()/2 - 16

	local dX = x

	for k,v in pairs(KeyBinds) do
		if k == 6 then dX = dX + 16 end

		local button = vgui.Create("DButton", panel)
		button:SetSize(32,32)
		button:SetPos(dX, y)
		button:SetTextColor(Color(255,255,255,255))

		button.Paint = function(self, w, h)
			surface.DrawOutlinedRect(0, 0, w, h)

			local letter = string.upper(input.GetKeyName(KeyBinds[k]))
			self:SetText(letter)
		end

		button.DoClick = function()
			RebindKey(button, k)
		end

		dX = dX + 32
	end

	local label = vgui.Create("DLabel", panel)
	local txt = "Hold a key, then click the slot you would like to bind to that key."
	label:SetText(txt)
	label:SetSize(surface.GetTextSize(txt))
	label:Center()
	local x, _ = label:GetPos()
	label:SetPos(x, y+64)

	local label = vgui.Create("DLabel", panel)
	txt = "You can bind to most keys and even gamepad buttons."
	label:SetText(txt)
	label:SetSize(surface.GetTextSize(txt))
	label:Center()
	local x, _ = label:GetPos()
	label:SetPos(x, y+96)

	panel:MakePopup()
end

function RebindKey(button, keypos)
	local keys = {KEY_0, KEY_1, KEY_2, KEY_3, KEY_4, KEY_5, KEY_6, KEY_7, KEY_8, KEY_9,
		KEY_A, KEY_B, KEY_C, KEY_D, KEY_E, KEY_F, KEY_G, KEY_H, KEY_I, KEY_J, KEY_K, KEY_L,
		KEY_M, KEY_N, KEY_O, KEY_P, KEY_Q, KEY_R, KEY_S, KEY_T, KEY_U, KEY_V, KEY_W, KEY_X,
		KEY_Y, KEY_Z, KEY_PAD_0, KEY_PAD_1, KEY_PAD_2, KEY_PAD_3, KEY_PAD_4, KEY_PAD_5,
		KEY_PAD_6, KEY_PAD_7, KEY_PAD_8, KEY_PAD_9, KEY_PAD_DIVIDE, KEY_PAD_MULTIPLY,
		KEY_PAD_MINUS, KEY_PAD_PLUS, KEY_PAD_DECIMAL, KEY_LBRACKET,
		KEY_RBRACKET, KEY_SEMICOLON, KEY_APOSTROPHE, KEY_COMMA, KEY_PERIOD, KEY_SLASH,
		KEY_BACKSLASH, KEY_MINUS, KEY_EQUAL, KEY_BACKSPACE, KEY_XBUTTON_A, KEY_XBUTTON_B,
		KEY_XBUTTON_X, KEY_XBUTTON_Y, KEY_XBUTTON_LEFTSHOULDER, KEY_XBUTTON_RIGHTSHOULDER,
		KEY_XBUTTON_BACK, KEY_XBUTTON_START, KEY_XBUTTON_STICK1, KEY_XBUTTON_STICK2,
		KEY_XBUTTON_UP, KEY_XBUTTON_DOWN, KEY_XBUTTON_LEFT, KEY_XBUTTON_RIGHT,
		KEY_XBUTTON_LTRIGGER, KEY_XBUTTON_RTRIGGER}

	local newKey

	button:SetTextColor(Color(0,255,0,255))

	for k,v in pairs(keys) do
		if input.IsKeyDown(v) then
			newKey = v
			break
		end
	end

	button:SetTextColor(Color(255,255,255,255))

	if newKey == nil then return end

	KeyBinds[keypos] = newKey
	SaveKeyBinds()
end
