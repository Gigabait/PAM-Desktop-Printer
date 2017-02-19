---------------------------------------------------------------------------------
-- Developed by Pat & Mikael for Xanath Roleplay from 29-04-2016 to **-**-**** --
-- Pat ( Patrick Ratzow ) [ patrickratzow.com ] ( ID64: 76561198202328247 )    --
-- Mikael ( Mikael ******** ) [ goo.gl/W5SrkB ] ( ID64: 76561198020603627 )    --
-- 								               --
-- "Desktop printers"							       --
-- Features motherboards, CPUs, GPUs with SLI enabled, RAM and harddisks       --
-- The purpose of this add-on is to bring a different experience for players   --
-- that like complex things, instead of dull simple things                     --
--								               --
-- If you wish to ask about anything you can write to us here                  --
-- Pat: patrickratzowpp@hotmail.com					       --
-- Mikael: mikael@xanathroleplay.net				               --
---------------------------------------------------------------------------------

include("shared.lua")

local wMod = ScrW() / 1920;
local hMod = ScrH() / 1080;

net.Receive("desktopPrinter_Money", function( len )

	net.ReadEntity().money = net.ReadFloat();

end)

net.Receive( "desktopPrinter_SendTheme", function( len )

	LocalPlayer().desktopPrinter = net.ReadInt(8);

end)

surface.CreateFont( "zaugen_printer_nameFont", {
	font = "Lato",
	size = 23,
	weight = 300,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	outline= false,
} )

surface.CreateFont( "Pat_DesktopPrinter_MOBO0", {
	font = "Lato",
	size = 22.5,
	weight = 300,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	outline= false,
} )


surface.CreateFont( "zaugen_printer_nameFont2", {
	font = "Lato",
	size = 12,
	weight = 300,
	blursize = 0,
	scanlines = 0,
	antialias = true,
	outline= false,
} )



--|---------------------------------[DO NOT TOUCH UNDER]---------------------------------|--

local pam_mobo_1 = Material("materials/pam_d_printers/mobo_image/pam_m_bord.png")
local pam_mobo_2 = Material("materials/pam_d_printers/mobo_image/pam_m_mobo.png")
local pam_mobo_3 = Material("materials/pam_d_printers/mobo_image/pam_m_back.png")

local pam_bat_1 = Material("materials/pam_d_printers/battery_image/pam_b_frame.png")
local pam_bat_3 = Material("materials/pam_d_printers/battery_image/2222.png")

local pam_fan_1 = Material("materials/pam_d_printers/fan_image/pam_f_hole.png")
local pam_fan_2 = Material("materials/pam_d_printers/fan_image/pam_f_fan.png")
local pam_fan_3 = Material("materials/pam_d_printers/fan_image/pam_c_case.png")
local pam_fan_4 = Material("materials/pam_d_printers/fan_image/pam_c_fan.png")
local pam_fan_5 = Material("materials/pam_d_printers/fan_image/pam_c_fanr.png")

local pam_gpu_1 = Material("materials/pam_d_printers/gpu_image/msi-r9-290x.png")
local pam_gpu_2 = Material("materials/pam_d_printers/gpu_image/geforce-gtx-titanx.png")

local pam_cpu_1 = Material("materials/pam_d_printers/cpu_image/1_intel_i3-6300.png")
local pam_cpu_2 = Material("materials/pam_d_printers/cpu_image/2_amd_fx_6300.png")
local pam_cpu_3 = Material("materials/pam_d_printers/cpu_image/3_amd_fx_8350.png")
local pam_cpu_4 = Material("materials/pam_d_printers/cpu_image/4_intel_i5_4460.png")
local pam_cpu_5 = Material("materials/pam_d_printers/cpu_image/5_intel_i7_4770k.png")

local image17 = Material("materials/pam_d_printers/ram_image/pam_r_ram.png")
local image18 = Material("materials/pam_d_printers/gpu_image/amd_270.png")
local image11 = Material("materials/pam_d_printers/bar_image/pam_o_bott.png")
local image12 = Material("materials/pam_d_printers/bar_image/pam_o_mone.png")

--|^-------------------------------[DO NOT TOUCH ABOVE]-------------------------------^|--
function ENT:Draw()

	self:DrawModel()

	if self:GetPos():Distance(EyePos()) > self.desktop.config.hudDisapearDistance then return end

	local Pos = self:GetPos()
	local Ang = self:GetAngles()

	local owner = self:Getowning_ent()
	owner = (IsValid(owner) and owner:Nick()) or DarkRP.getPhrase("unknown")

	local spin = CurTime() * 180
	local spinf = CurTime() * 500

	local pam_Clamp_h = math.Clamp(self:GetHP(), 0, 100)
	local pam_Clamp_a = math.Clamp(self:GetAP(), 0, 100)
	local _ = self.desktop.language[self.desktop.currentLanguage];

	Ang:RotateAroundAxis(Ang:Up(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 10.7, Ang, 0.11)

		if ( self:GetMOBOImage() == 0 ) then

			draw.DrawText(_.nakedPrinterText1.."\n".._.nakedPrinterText2.."\n\n".._.cpu.."\n".._.gpu.."\n".._.ram.."\n".._.hdd, "Pat_DesktopPrinter_MOBO0", 2, -100, Color(255,255,255), TEXT_ALIGN_CENTER );

		end

		if ( self:GetMOBOImage() != 0 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_mobo_3 )
			surface.DrawTexturedRect( -138, -148, 279, 278 )

		end

		if ( self:GetMOBOImage() != 0 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_mobo_2 )
			surface.DrawTexturedRect( -140, -146, 270, 270 )

		end

		if ( self:GetMOBOImage() !=0 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_mobo_1 )
			surface.DrawTexturedRect( -138, -148, 279, 278 )

		end

		--cpu1 1_Intel_i3-6300

		if ( self:GetCPUImage() == 1 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_cpu_1 )
			surface.DrawTexturedRect( -20, -84, 35, 35 )

		end
		--cpu2 2_Amd_fx_6300

		if ( self:GetCPUImage() == 2 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_cpu_2 )
			surface.DrawTexturedRect( -20, -84, 35, 35 )

		end

	  if ( self:GetCPUImage() == 3 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_cpu_3 )
			surface.DrawTexturedRect( -20, -84, 35, 35 )

		end

		if ( self:GetCPUImage() == 4 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_cpu_4 )
			surface.DrawTexturedRect( -20, -84, 35, 35 )

		end

		if ( self:GetCPUImage() == 5 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_cpu_5 )
			surface.DrawTexturedRect( -20, -84, 35, 35 )

		end

		if ( self:GetCPU() != "none" ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_fan_3 )
			surface.DrawTexturedRect( -30, -95, 55, 55 )

		end

		--cpu fan and corruption

		if ( self:GetCPU() != "none" ) then

			if ( self:GetCorruptedPrint() ) then

				surface.SetDrawColor( 255,255,255,255 )
				surface.SetMaterial( pam_fan_5 )
				surface.DrawTexturedRectRotated( -3, -67, 55, 55, spin )

			else

				surface.SetDrawColor( 255,255,255,255 )
				surface.SetMaterial( pam_fan_4 )
				surface.DrawTexturedRectRotated( -3, -67, 55, 55, spinf )

			end

		end
		--ram1

		if ( self:GetRAMAmount() == 1 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( image17 )
			surface.DrawTexturedRect( 53, -123, 6, 117 )

		end
		--ram2

		if ( self:GetRAMAmount() >= 2  ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( image17 )
			surface.DrawTexturedRect( 75, -123, 6, 117 )

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( image17 )
			surface.DrawTexturedRect( 53, -123, 6, 117 )

		end
		--gpu 1 msi-r9-290x

		if ( self:GetGPUImage() == 1 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_gpu_1 )
			surface.DrawTexturedRect( -85, 30, 120, 90 )

		end

		--gpu 2 geforce-gtx-titanx

		if ( self:GetGPUImage() == 2 ) then

			surface.SetDrawColor( 255,255,255,255 )
			surface.SetMaterial( pam_gpu_2 )
			surface.DrawTexturedRect( -85, 30, 120, 90 )

		end

	cam.End3D2D()

	Ang:RotateAroundAxis(Ang:Right(), 90)
	Ang:RotateAroundAxis(Ang:Up(), 270)

	cam.Start3D2D(Pos + Ang:Up() * 15.8, Ang, 0.11)

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( pam_fan_2 )

		if ( self:GetGPU() != "none" ) then
		surface.DrawTexturedRectRotated( -60, -50, 80.5, 80.5, spin )
		else
		surface.DrawTexturedRectRotated( -60, -50, 80.5, 80.5, 0);
		end

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( pam_fan_1 )
		surface.DrawTexturedRect( -100, -90, 80.5, 80.5 )

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( pam_fan_2 )
		if ( self:GetGPU() != "none" ) then
		surface.DrawTexturedRectRotated( 62, -50, 80.5, 80.5, spin )
		else
		surface.DrawTexturedRectRotated( 62, -50, 80.5, 80.5, 0 )
		end

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( pam_fan_1 )
		surface.DrawTexturedRect( 22, -90, 80.5, 80.5 )

	cam.End3D2D()

	Ang:RotateAroundAxis(Ang:Right(), 270)
	Ang:RotateAroundAxis(Ang:Up(), 270)

	cam.Start3D2D(Pos + Ang:Up() * 16.86, Ang, 0.11)

		if self:GetAP() >= 1 then
		draw.RoundedBox(0, -67, -102, pam_Clamp_a * 0.33, 20, Color(41, 128, 185))
		else
		draw.RoundedBox(0, -67, -102, pam_Clamp_h * 0.33, 20, Color(222, 50, 50))
		end

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( pam_bat_1 )
		surface.DrawTexturedRect( -93, -136, 87, 87 )

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( pam_bat_3 )
		surface.DrawTexturedRect( -93, -136, 87, 87 )

	cam.End3D2D()

	Ang:RotateAroundAxis(Ang:Right(), 360)
	Ang:RotateAroundAxis(Ang:Up(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 16.86, Ang, 0.11)

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( image12 )
		surface.DrawTexturedRect( -134, -93, 176, 87 )

		surface.SetDrawColor( 255,255,255,255 )
		surface.SetMaterial( pam_bat_3 )
		surface.DrawTexturedRect( -134, -93, 176, 87 )

		local string;

		if ( self.desktop.config.printType == 1 ) then

			string = _.currencyPrefix..""..(self.money or 0);

		elseif ( self.desktop.config.printType == 2 ) then

			string = (self.money or 0).." ".._.points;

		elseif ( self.desktop.config.printType == 3 ) then

			string = (self.money or 0).." ".._.points;

		elseif ( self.desktop.config.printType == 4 ) then

			string = (self.money or 0).." ".._.shortExperience;

		end

		draw.SimpleText(string, "zaugen_printer_nameFont", -50, -59, Color(235,235,235), TEXT_ALIGN_CENTER )

		if self:GetAP() >= 1 then
		draw.SimpleText(_.armor, "zaugen_printer_nameFont2", 92, -84, Color(41, 128, 185), TEXT_ALIGN_CENTER )
		else
		draw.SimpleText(_.health, "zaugen_printer_nameFont2", 92, -84, Color(222, 50, 50), TEXT_ALIGN_CENTER )
		end

	cam.End3D2D()

end

function ENT:Think()
end

--|---------------------------------[VGUI HUD BELOW]---------------------------------|--
local wMod = ScrW() / 1920;
local hMod = ScrH() / 1080;

surface.CreateFont( "desktopPrinter_Menu_PartFont", {
font = "Lato",
size = 37*hMod,
weight = 500,
antialias = true;
} )

surface.CreateFont( "desktopPrinter_Menu_NameFont", {
font = "Lato",
size = 58*hMod,
weight = 1300,
antialias = true;
} )

surface.CreateFont( "desktopPrinter_Menu_WithdrawFont", {
font = "Lato",
size = 32*hMod,
weight = 1300,
antialias = true;
} )

surface.CreateFont( "desktopPrinter_Menu_BarFont", {
font = "Lato",
size = 40*hMod,
weight = 500,
antialias = true;
} )

surface.CreateFont( "desktopPrinter_Menu_CloseFont", {
font = "Lato",
size = 58*hMod,
weight = 500,
antialias = true;
} )

surface.CreateFont( "desktopPrinter_Menu_CategoryTitle", {
font = "Lato",
size = 40*hMod,
weight = 600,
antialias = true;
} )

surface.CreateFont( "desktopPrinter_Menu_helpPanelText", {
font = "Lato",
size = 32*hMod,
weight = 500,
antialias = true;
} )

local motherboardIcon;
local gpuIcon;
local cpuIcon;
local ramIcon;
local ssdIcon;
LocalPlayer().desktopPrinter_Theme = 1;

function ENT:desktopMenu()

	local animationConfig = self.desktop.config.animationOrder;
	local helpPanelShown = true;
	local wMod = ScrW() / 1920;
	local hMod = ScrH() / 1080;
	local _ = self.desktop.language[self.desktop.currentLanguage];
	local __ = self.desktop.theme[LocalPlayer().desktopPrinter_Theme or 1];
	local health = self:GetHP();
	local armor = self:GetAP();

	if ( __.icons == "Dark" ) then
		motherboardIcon   = Material("pam_d_printers/icons/motherboard.png");
		cpuIcon 		  = Material("pam_d_printers/icons/cpu.png");
		gpuIcon 		  = Material("pam_d_printers/icons/gpu.png");
		ramIcon 		  = Material("pam_d_printers/icons/ram.png");
		ssdIcon 		  = Material("pam_d_printers/icons/ssd.png");
	else
		motherboardIcon   = Material("pam_d_printers/icons/light_motherboard.png");
		cpuIcon 		  = Material("pam_d_printers/icons/light_cpu.png");
		gpuIcon 		  = Material("pam_d_printers/icons/light_gpu.png");
		ramIcon 		  = Material("pam_d_printers/icons/light_ram.png");
		ssdIcon 		  = Material("pam_d_printers/icons/light_ssd.png");
	end

	desktopPrinterFrame = vgui.Create("DFrame");
	desktopPrinterFrame:SetSize( 885*wMod, 550*hMod );
	desktopPrinterFrame:SetTitle( "" )
	desktopPrinterFrame:SetVisible( true )
	desktopPrinterFrame:SetDraggable( false )
	desktopPrinterFrame:ShowCloseButton( false )
	desktopPrinterFrame:SetDeleteOnClose( false )
	desktopPrinterFrame:MakePopup();
	desktopPrinterFrame:SetPos( -desktopPrinterFrame:GetWide(), ScrH() / 2 - (desktopPrinterFrame:GetTall()/2) );
	desktopPrinterFrame.Paint = function( s, w, h )

		draw.RoundedBox( 0, 0, 0, w - (10*wMod), h, __.backgroundColor );

		// Header
		draw.RoundedBox( 0, 0, 0, w - (10*wMod), 70*hMod, __.headerColor );

		// Header border, a little res fix
		draw.RoundedBox( 0, 0, 70*hMod, w - (10*wMod), 3*hMod, __.headerBorderColor );

		// Fixes the border res fix, yes weird, look at border before animation comes in without this if you dont understand
		draw.RoundedBox( 0, 0, 72*hMod, w - (10*wMod), 1*hMod, __.backgroundColor );

	end

	desktopPrinterFrame:MoveTo( ScrW() / 2 - ( desktopPrinterFrame:GetWide() / 2 ), ScrH() / 2 - ( desktopPrinterFrame:GetTall() /2 ), 0.3, 0, 2 );

	// this panel is the general slide down.
	local informationPanel = vgui.Create( "DPanel", desktopPrinterFrame );
	informationPanel:SetSize( desktopPrinterFrame:GetWide(), desktopPrinterFrame:GetTall() - ( 115*hMod ) );
	informationPanel:SetPos( 0, -informationPanel:GetTall() );
	informationPanel.Paint = function( s, w, h )

		// Health bar

		health = math.min(100, (health == self:GetHP() and health) or Lerp(0.1, health, self:GetHP()))
		armor = math.min(100, (armor == self:GetAP() and armor) or Lerp(0.1, armor, self:GetAP()))

		draw.RoundedBox( 0, 0, 0, ((health*8.75)*wMod), 45*hMod, __.healthBarColor );
		draw.SimpleText( self:GetHP().."/100", "desktopPrinter_Menu_BarFont", w/2, 22.5*hMod, __.healthBarTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );

		// Armor bar
		draw.RoundedBox( 0, 0, 45*hMod, ((armor*8.75)*wMod), 45*hMod, __.armorBarColor );
		draw.SimpleText( self:GetAP().."/100", "desktopPrinter_Menu_BarFont", w/2, 67.5*hMod, __.armorBarTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );

		surface.SetDrawColor( color_white );
		surface.SetMaterial( motherboardIcon );
		surface.DrawTexturedRect( 175*wMod, 115*hMod, 78*wMod, 78*hMod );

		if ( self:GetMOBO() == "none" ) then
		draw.SimpleText( _.noMotherboard, "desktopPrinter_Menu_PartFont", 220*wMod, 235*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		else
		draw.SimpleText( "1/1 "..self:GetMOBO(), "desktopPrinter_Menu_PartFont", 220*wMod, 235*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		end

		surface.SetDrawColor( color_white );
		surface.SetMaterial( ssdIcon );
		surface.DrawTexturedRect( 480*wMod, 115*hMod, 78*wMod, 78*hMod );

		if ( self:GetHDDGB() <= 0 ) then
		draw.SimpleText( _.noHDD, "desktopPrinter_Menu_PartFont", 515*wMod, 235*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		else
		draw.SimpleText( "1/1 "..self:GetHDDGB().." GB", "desktopPrinter_Menu_PartFont", 515*wMod, 235*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		end

		surface.SetDrawColor( color_white );
		surface.SetMaterial( ramIcon );
		surface.DrawTexturedRect( 700*wMod, 115*hMod, 78*wMod, 78*hMod );

		if ( self:GetRAM() == "none" ) then
		draw.SimpleText( _.noRAM, "desktopPrinter_Menu_PartFont", 735*wMod, 235*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		else
		draw.SimpleText( self:GetRAMAmount().."/"..self:GetRAMSlots().." "..self:GetRAMGB().." GB "..self:GetRAM():upper(), "desktopPrinter_Menu_PartFont", 735*wMod, 235*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		end

		surface.SetDrawColor( color_white );
		surface.SetMaterial( gpuIcon );
		surface.DrawTexturedRect( 175*wMod, 270*hMod, 78*wMod, 78*hMod );

		if ( self:GetGPU() == "none" ) then
		draw.SimpleText( _.noGPU, "desktopPrinter_Menu_PartFont", 220*wMod, 380*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		else
		draw.SimpleText( self:GetGPUAmount().."/"..self:GetMaxGPUs().." "..self:GetGPU():upper(), "desktopPrinter_Menu_PartFont", 220*wMod, 380*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		end

		surface.SetDrawColor( color_white );
		surface.SetMaterial( cpuIcon );
		surface.DrawTexturedRect( 480*wMod, 270*hMod, 78*wMod, 78*hMod );

		if ( self:GetCPU() == "none" ) then
		draw.SimpleText( _.noCPU, "desktopPrinter_Menu_PartFont", 515*wMod, 380*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		else
		draw.SimpleText( self:GetCPUAmount().."/"..self:GetMaxCPUs().." "..self:GetCPU():upper(), "desktopPrinter_Menu_PartFont", 515*wMod, 380*hMod, __.partTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );
		end

	end

	// this help panel is the general slide down.
	local helpPanel = vgui.Create( "DScrollPanel", desktopPrinterFrame );
	helpPanel:SetSize( desktopPrinterFrame:GetWide(), desktopPrinterFrame:GetTall() - ( 115*hMod ) );
	helpPanel:SetPos( -desktopPrinterFrame:GetWide(), informationPanel:GetTall() - ( 362*hMod ) );
	helpPanel.Paint = function( s, w, h )

	end

	local sbar = helpPanel:GetVBar()
	function sbar:Paint( w, h ) draw.RoundedBox( 0, 0, 0, w, h, Color( 0, 0, 0, 0 ) ) end
	function sbar.btnUp:Paint( w, h ) draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) ) end
	function sbar.btnDown:Paint( w, h ) draw.RoundedBox( 0, 0, 0, w, h, Color( 200, 100, 0, 0 ) ) end
	function sbar.btnGrip:Paint( w, h ) draw.RoundedBox( 0, 0, 0, w, h, Color( 100, 200, 0, 0 ) ) end

	local layout = vgui.Create("DListLayout", helpPanel );
	layout:SetPos( 0, 0 );
	layout:SetSize( helpPanel:GetWide(), helpPanel:GetTall() );


	// this button is the ? (help) button.
	local helpButton = vgui.Create("DButton", desktopPrinterFrame );
	helpButton:SetSize( 57.5*wMod, 70*hMod );
	helpButton:SetPos( desktopPrinterFrame:GetWide() + helpButton:GetWide(), 0 );
	helpButton:SetText("");
	helpButton.Paint = function( s, w, h )

		draw.SimpleText( "?", "desktopPrinter_Menu_WithdrawFont", w/2, h/2, __.closeAndQuestionMarkTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );

	end
	helpButton.DoClick = function( self )

		if ( helpPanelShown ) then

			helpPanelShown = false;

		else

			helpPanelShown = true;

		end

		moveInformationPanel();

	end

	local themeButton = vgui.Create("DButton", desktopPrinterFrame );
	themeButton:SetSize( 57.5*wMod, 70*hMod );
	themeButton:SetPos( desktopPrinterFrame:GetWide() + helpButton:GetWide() + themeButton:GetWide(), 0 );
	themeButton:SetText("");
	themeButton.Paint = function( s, w, h )

		draw.SimpleText( "<>", "desktopPrinter_Menu_WithdrawFont", w/2, h/2, __.closeAndQuestionMarkTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );

	end
	themeButton.DoClick = function( s, w, h )

		local switchOrder;
		local ply = LocalPlayer();

		if ( ply.desktopPrinter_Theme == 1 ) then

			switchOrder = 2;
			ply.desktopPrinter_Theme = switchOrder;

		elseif ( ply.desktopPrinter_Theme == 2 ) then

			switchOrder = 1;
			ply.desktopPrinter_Theme = switchOrder;

		else

			switchOrder = 2;
			ply.desktopPrinter_Theme = switchOrder;

		end

		net.Start("desktopPrinter_SwitchTheme");
			net.WriteInt( switchOrder or 2, 8 );
		net.SendToServer();

		desktopPrinterFrame:MoveTo(1920*wMod, ScrH() / 2 - (desktopPrinterFrame:GetTall() / 2), 0.3, 0, 2, function() desktopPrinterFrame:Remove() self:desktopMenu() end)


	end

	function moveInformationPanel()

		if ( helpPanelShown ) then

			informationPanel:MoveTo( 0, informationPanel:GetTall() - ( 362*hMod ), 0.35, 0.35, 2 );
			helpPanel:MoveTo( -desktopPrinterFrame:GetWide(), informationPanel:GetTall() - ( 362*hMod ), 0.35, 0, 2 );

		else

			informationPanel:MoveTo( -desktopPrinterFrame:GetWide(), informationPanel:GetTall() - ( 362*hMod ), 0.35, 0.0, 2 );
			helpPanel:MoveTo( 0, informationPanel:GetTall() - ( 362*hMod ), 0.35, 0.35, 2 );

		end

	end

	// this panel is the slide in for name

	local ownerNick = self:Getowning_ent()
	ownerNick = (IsValid(ownerNick) and ownerNick:Nick()) or DarkRP.getPhrase("unknown")

	surface.SetFont( "desktopPrinter_Menu_NameFont" );
	local w,h = surface.GetTextSize( ownerNick or "UNKNOWN" );

	local panel = vgui.Create( "DPanel", desktopPrinterFrame );
	panel:SetSize( w + (30*wMod), 72*hMod );
	panel:SetPos( -panel:GetWide(), 0 )
	panel.Paint = function( s, w, h )

		draw.SimpleText( ownerNick, "desktopPrinter_Menu_NameFont", 15*wMod, 34*hMod, __.headerTextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER );

	end

	function moveNamePanel()

		local delay;
		local time;

		if ( animationConfig == 1 ) then

			delay = 0.0;
			time = 0.3;

		elseif ( animationConfig == 2 ) then

			delay = 0.0;
			time = 0.3;

		elseif ( animationConfig == 3 ) then

			delay = 0.0;
			time = 0.3;

		elseif ( animationConfig == 4 ) then

			delay = 0.1;
			time = 0.3;

		elseif ( animationConfig == 5 ) then

			delay = 0.2;
			time = 0.3;

		end


		panel:MoveTo( desktopPrinterFrame, 0, time, delay, -5 );

	end

	// this is the withdraw button
	local button = vgui.Create("DButton", desktopPrinterFrame );
	button:SetSize( desktopPrinterFrame:GetWide() - (5*wMod), 45*hMod );
	button:SetPos( -(5*wMod), desktopPrinterFrame:GetTall() + button:GetTall() );
	button:SetText("");
	button.Paint = function( s, w, h )

		local hover = s:IsHovered();

		if ( !hover ) then

			draw.RoundedBox( 0, 0, 0, w, h, __.withdrawColor );

		else

			draw.RoundedBox( 0, 0, 0, w, h, __.withdrawHoverColor );

		end

		local string;

		if ( self.desktop.config.printType == 1 ) then

			string = _.currencyPrefix..""..(self.money or 0);

		elseif ( self.desktop.config.printType == 2 ) then

			string = (self.money or 0).." ".._.points;

		elseif ( self.desktop.config.printType == 3 ) then

			string = (self.money or 0).." ".._.points;

		elseif ( self.desktop.config.printType == 4 ) then

			string = (self.money or 0).." ".._.experience;

		end


		draw.SimpleText( _.withdraw.." "..string, "desktopPrinter_Menu_WithdrawFont", w/2, h/2 - 2, __.withdrawTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );


	end
	button.DoClick = function()

		if ( tonumber(self.money or 0) >= 1 ) then

			net.Start( "desktopPrinter_Withdraw" );
				net.WriteEntity( self );
			net.SendToServer();

		end

	end

	function moveWithdrawPanel()

		local delay;
		local time;

		if ( animationConfig == 1 ) then

			delay = 0.0;
			time = 0.3;

		elseif ( animationConfig == 2 ) then

			delay = 0.1;
			time = 0.3;

		elseif ( animationConfig == 3 ) then

			delay = 0.2;
			time = 0.3;

		elseif ( animationConfig == 4 ) then

			delay = 0.1;
			time = 0.3;

		elseif ( animationConfig == 5 ) then

			delay = 0.1;
			time = 0.3;

		end


		button:MoveTo( -(5*wMod), desktopPrinterFrame:GetTall() - button:GetTall() + ( 2*hMod ), time, delay, 1);

	end

	// close button
	local button = vgui.Create("DButton", desktopPrinterFrame );
	button:SetSize( 70*wMod, 70*hMod );
	button:SetPos( desktopPrinterFrame:GetWide() + (button:GetWide()), 0 );
	button:SetText("");
	button.Paint = function( s, w, h )

		draw.SimpleText( "X", "desktopPrinter_Menu_WithdrawFont", w/2, h/2, __.closeAndQuestionMarkTextColor, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER );

	end
	button.DoClick = function( self )

		desktopPrinterFrame:MoveTo(1920*wMod, ScrH() / 2 - (desktopPrinterFrame:GetTall() / 2), 0.3, 0, 2, function() desktopPrinterFrame:Remove() end)

	end

	function moveXPanel()

		local delay;
		local time;

		if ( animationConfig == 1 ) then

			delay = 0.0;
			time = 0.3;

		elseif ( animationConfig == 2 ) then

			delay = 0.1;
			time = 0.3;

		elseif ( animationConfig == 3 ) then

			delay = 0.2;
			time = 0.3;

		elseif ( animationConfig == 4 ) then

			delay = 0.1;
			time = 0.3;

		elseif ( animationConfig == 5 ) then

			delay = 0.0;
			time = 0.3;

		end

		button:MoveTo( desktopPrinterFrame:GetWide() - button:GetWide() - (5*wMod), 0, time, delay, -1 );
		helpButton:MoveTo( ( desktopPrinterFrame:GetWide() - (helpButton:GetWide() + button:GetWide()) ) - (5*wMod), 0, time, delay, -1 );
		themeButton:MoveTo(  desktopPrinterFrame:GetWide() - (helpButton:GetWide() + button:GetWide() + themeButton:GetWide()) - (5*wMod), 0, time, delay, -1 );

	end

	// HELP PANEL STUFF.

	local howWorkPanelDown = true;
	local howWorkPanelCollapsing = true;
	local howWorkPanelDecreaseSpeed = RealFrameTime() * 350;
	local howWorkPanelShouldChange = false;

	local howWorkButton = vgui.Create( "DButton" );
	howWorkButton:SetText( "" );
	howWorkButton:SetSize( 0, 47.5*hMod );
	howWorkButton:Dock( FILL );
	howWorkButton:DockMargin( 10*wMod, 10*hMod, 21*wMod, 0 );
	howWorkButton.Paint = function( self, w, h )

		if ( !self:IsHovered() ) then
		draw.RoundedBox( 0, 0, 0, w, h, __.dropDownTitleColor );
		else
		draw.RoundedBox( 0, 0, 0, w, h, __.dropDownTitleHoverColor );
		end

		draw.SimpleText( _.helpButton1Title, "desktopPrinter_Menu_CategoryTitle", 5*wMod, h/2 - (2.5*hMod), __.dropDownTitleTextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER );

	end
	howWorkButton.DoClick = function( self )

		if ( howWorkPanelCollapsing ) then

			howWorkPanelCollapsing = false;

		else

			howWorkPanelCollapsing = true;

		end

		howWorkPanelShouldChange = true;

	end

	function moveHowWorkPanel()

		if ( howWorkPanelShown ) then

			howWorkPanel:MoveTo( desktopPrinterFrame:GetWide() + howWorkPanel:GetWide(), 0, 0.15, 0.0, 1 );

		else

			howWorkPanel:MoveTo( 0, 0, 0.15, 0.0, 1 );

		end

	end

	local howWorkPanel = vgui.Create( "DPanel" );
	howWorkPanel:SetSize( 0, 340*hMod );
	howWorkPanel:Dock( FILL );
	howWorkPanel:DockMargin( 10*wMod, 0, 21*wMod, 0 );
	howWorkPanel.Paint = function( self, w, h )

		// background,
		draw.RoundedBox( 0, 0, 0, w, h, __.dropDownPanelColor );
		// pixel left
		draw.RoundedBox( 0, 0, 0, 1*wMod, h, __.dropDownTitleColor );
		// pixel bot
		draw.RoundedBox( 0, 0, h - (1*hMod), w, 1*hMod, __.dropDownTitleColor );
		// pixel right
		draw.RoundedBox( 0, w - (1*wMod), 0, 1*wMod, h, __.dropDownTitleColor );

	end

	local howWorkPanelLabel = vgui.Create("DLabel", howWorkPanel );
	howWorkPanelLabel:SetPos( 7.5*wMod, 5*hMod );
	howWorkPanelLabel:SetSize( howWorkPanel:GetWide() - (10*wMod), howWorkPanel:GetTall() - (10*hMod) );
	howWorkPanelLabel:SetTextColor( __.dropDownTextColor );
	howWorkPanelLabel:SetFont( "desktopPrinter_Menu_helpPanelText" );
	howWorkPanelLabel:SetContentAlignment( 7 );
	howWorkPanelLabel:SetWrap( true );
	howWorkPanelLabel:SetText( _.helpButton1 );

	function howWorkPanel:Think()

		if ( howWorkPanelCollapsing ) then

			if ( howWorkPanelCollapsing ) then

				if ( howWorkPanelDown ) then

					if ( howWorkPanel:GetTall() >= 0.01 ) then

						howWorkPanel:SetTall( howWorkPanel:GetTall() - howWorkPanelDecreaseSpeed );

					else

						howWorkPanelDown = false;
						howWorkPanelCollapsing = false;

					end

				else

					if ( howWorkPanel:GetTall() <= 340*hMod ) then

						howWorkPanel:SetTall( howWorkPanel:GetTall() + howWorkPanelDecreaseSpeed );

					else

						howWorkPanelDown = true;
						howWorkPanelCollapsing = false;

					end

				end

			end

		end

		howWorkPanelLabel:SetSize( howWorkPanel:GetWide() - (10*wMod), howWorkPanel:GetTall() - (10*hMod) );

	end

	// Terms.

	local howWorkTermsPanelDown = true;
	local howWorkTermsPanelCollapsing = true;
	local howWorkTermsPanelDecreaseSpeed = RealFrameTime() * 350;
	local howWorkTermsPanelShouldChange = false;

	local howWorkTermsButton = vgui.Create( "DButton" );
	howWorkTermsButton:SetText( "" );
	howWorkTermsButton:SetSize( 0, 47.5*hMod );
	howWorkTermsButton:Dock( FILL );
	howWorkTermsButton:DockMargin( 10*wMod, 10*hMod, 21*wMod, 0 );
	howWorkTermsButton.Paint = function( self, w, h )

		if ( !self:IsHovered() ) then
		draw.RoundedBox( 0, 0, 0, w, h, __.dropDownTitleColor );
		else
		draw.RoundedBox( 0, 0, 0, w, h, __.dropDownTitleHoverColor );
		end

		draw.SimpleText( _.helpButton2Title, "desktopPrinter_Menu_CategoryTitle", 5*wMod, h/2 - (2.5*hMod), __.dropDownTitleTextColor, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER );

	end
	howWorkTermsButton.DoClick = function( self )

		if ( howWorkTermsPanelCollapsing ) then

			howWorkTermsPanelCollapsing = false;

		else

			howWorkTermsPanelCollapsing = true;

		end

		howWorkTermsPanelShouldChange = true;

	end

	function moveHowWorkTermsPanel()

		if ( howWorkTermsPanelShown ) then

			howWorkTermsPanel:MoveTo( desktopPrinterFrame:GetWide() + howWorkTermsPanel:GetWide(), 0, 0.25, 0.0, 1 );

		else

			howWorkTermsPanel:MoveTo( 0, 0, 0.25, 0.0, 1 );

		end

	end

	local howWorkTermsPanel = vgui.Create( "DPanel" );
	howWorkTermsPanel:SetSize( 0, 340*hMod );
	howWorkTermsPanel:Dock( FILL );
	howWorkTermsPanel:DockMargin( 10*wMod, 0, 21*wMod, 0 );
	howWorkTermsPanel.Paint = function( self, w, h )

		// background,
		draw.RoundedBox( 0, 0, 0, w, h, __.dropDownPanelColor );
		// pixel left
		draw.RoundedBox( 0, 0, 0, 1*wMod, h, __.dropDownTitleColor );
		// pixel bot
		draw.RoundedBox( 0, 0, h - (1*hMod), w, 1*hMod, __.dropDownTitleColor );
		// pixel right
		draw.RoundedBox( 0, w - (1*wMod), 0, 1*wMod, h, __.dropDownTitleColor );

	end

	local howWorkTermsPanelLabel = vgui.Create("DLabel", howWorkTermsPanel );
	howWorkTermsPanelLabel:SetPos( 7.5*wMod, 5*hMod );
	howWorkTermsPanelLabel:SetSize( howWorkTermsPanel:GetWide() - (10*wMod), howWorkTermsPanel:GetTall() - (10*hMod) );
	howWorkTermsPanelLabel:SetTextColor( __.dropDownTextColor );
	howWorkTermsPanelLabel:SetFont( "desktopPrinter_Menu_helpPanelText" );
	howWorkTermsPanelLabel:SetContentAlignment( 7 );
	howWorkTermsPanelLabel:SetWrap( true );
	howWorkTermsPanelLabel:SetText( _.helpButton2 )

	function howWorkTermsPanel:Think()

		if ( howWorkTermsPanelCollapsing ) then

			if ( howWorkTermsPanelCollapsing ) then

				if ( howWorkTermsPanelDown ) then

					if ( howWorkTermsPanel:GetTall() >= 0.01 ) then

						howWorkTermsPanel:SetTall( howWorkTermsPanel:GetTall() - howWorkTermsPanelDecreaseSpeed );

					else

						howWorkTermsPanelDown = false;
						howWorkTermsPanelCollapsing = false;

					end

				else

					if ( howWorkTermsPanel:GetTall() <= 340*hMod ) then

						howWorkTermsPanel:SetTall( howWorkTermsPanel:GetTall() + howWorkTermsPanelDecreaseSpeed );

					else

						howWorkTermsPanelDown = true;
						howWorkTermsPanelCollapsing = false;

					end

				end

			end

		end

		howWorkTermsPanelLabel:SetSize( howWorkPanel:GetWide() - (10*wMod), howWorkTermsPanel:GetTall() - (10*hMod) );

	end

	layout:Add( howWorkButton );
	layout:Add( howWorkPanel );
	layout:Add( howWorkTermsButton );
	layout:Add( howWorkTermsPanel );

	informationPanel:MoveTo( 0, informationPanel:GetTall() - ( 364*hMod ), 0.35, 0.3, 1, function() moveNamePanel() moveXPanel() moveWithdrawPanel() end);

end

net.Receive("desktopPrinter_Menu", function( len ) net.ReadEntity():desktopMenu(); end)
