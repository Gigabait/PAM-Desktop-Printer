---------------------------------------------------------------------------------
-- Developed by Pat & Mikael                                                   --
-- Pat ( Patrick Ratzow ) [ patrickratzow.com ] ( ID64: 76561198202328247 )    --
-- Mikael ( Mikael Savanovic ) [ goo.gl/W5SrkB ] ( ID64: 76561198020603627 )   --
-- 																			   --
-- "Desktop printers"														   --
-- Features motherboards, CPUs, GPUs with SLI enabled, RAM and harddisks       --
-- The purpose of this add-on is to bring a different experience for players   --
-- that like complex things, instead of dull simple things                     --
--																			   --
-- If you wish to ask about anything you can write to us here                  --
-- Pat: patrickratzowpp@hotmail.com											   --
-- Mikael: 																	   --
---------------------------------------------------------------------------------


AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString( "desktopPrinter_Money" );
util.AddNetworkString( "desktopPrinter_Menu" );
util.AddNetworkString( "desktopPrinter_Withdraw" );

net.Receive( "desktopPrinter_Withdraw", function( len, ply )
	local self = net.ReadEntity();

	if ( self:GetPos():Distance(ply:GetPos()) <= 300 ) then

			if ( self.money >= 1 ) then

				if ( self.desktop.config.printType == 1 ) then
					ply:addMoney(self.money)
				elseif ( self.desktop.config.printType == 2 ) then
					ply:PS2_AddStandardPoints(self.money);
				elseif ( self.desktop.config.printType == 3 ) then
					ply:PS_GivePoints(self.money);
				elseif ( self.desktop.config.printType == 4 ) then
					ply:addXP(self.money);
				end

				DarkRP.notify(ply, 1, 3, "You withdrew "..DarkRP.formatMoney(self.money).."!");

				self.money = 0;

				net.Start("desktopPrinter_Money");
					net.WriteEntity( self );
					net.WriteFloat( 0 );
				net.Broadcast();


			else

			-- do smth here

			end

		end

end)

function ENT:desktopPrint( msg )

	if ( self.desktop.debug ) then

		print( msg );

	end

end

local time = CurTime();

function ENT:Use( ply )

	if ( CurTime() >= time ) then

		net.Start("desktopPrinter_Menu");
			net.WriteEntity( self );
		net.Send( ply );
		time = CurTime() + 0.3;

	end

end

function ENT:Initialize()

	self:SetModel( self.desktop.config.printerModel )
	self:SetName( self.desktop.config.printerName );
	self:SetMaterial( self.desktop.config.printerMaterial );
	self:SetColor( self.desktop.config.printerColor );

	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	self:GetPhysicsObject():Wake();
	self:SetPrinterEnabled(true);

	-- CPU
	self:SetCPU("none");
	self:SetCPUMhz( 3400 );
	self:SetCPUCores( 4 );
	self:SetCPUAmount( 0 );
	self:SetCPUImage( 0 );

	-- RAM
	self:SetRAM("none");
	self:SetRAMMhz( 0 );
	self:SetRAMGB( 0 );
	self:SetRAMAmount( 0 );

	-- HDD
	self:SetHDDGB( 0 );

	-- GPU
	self:SetGPU("none");
	self:SetGPUAmount(0);
	self:SetGPUMhz(0);
	self:SetGPUCores(0);
	self:SetGPUImage(0);

	-- MOBO
	self:SetMOBO("none");
	self:SetMaxGPUs(0);
	self:SetMaxCPUs(0);
	self:SetRAMSlots(0);
	self:SetMOBOImage(0);

	self:SetHP( self.desktop.config.startHealth );
	self:SetAP( self.desktop.config.startArmor );

	self.money = 0;

	net.Start("desktopPrinter_Money");
		net.WriteEntity( self );
		net.WriteFloat( 0 );
	net.Broadcast();

	self.beenTouchedBy = {};
	self.sound = CreateSound(self, Sound("ambient/levels/labs/equipment_printer_loop1.wav"));
	self.sound:SetSoundLevel(52);
	self.sound:PlayEx(1, 100);

	self:Print();

end

function ENT:Print()

	if ( !IsValid(self) ) then

		return false;

	end

	if ( !self:GetPrinterEnabled() ) then return; end
	if ( self:GetCPU() == "none" ) then return; end
	if ( self:GetRAM() == "none" ) then return; end
	if ( self:GetGPU() == "none" ) then return; end
	if ( self:GetMOBO() == "none" ) then return; end

	local _ = self.desktop.config;
	local owner = self.dt.owning_ent;

	local ramAlgorithm = ( 100 / self:GetRAMMhz() ) * _.ramPrintSpeedModifier;
	local cpuAlgorithm = math.Round( ( self:GetCPUMhz() * self:GetCPUCores() ) / _.cpuPrintModifier );
	local gpuAlgorithm = math.Round( ( ( self:GetGPUMhz() + self:GetGPUCores() ) / _.gpuCorruptModifier ) * self:GetGPUAmount() );
	local harddiskAlgorithm = math.Round( _.moneyPerGigabyte * self:GetHDDGB() );

	self:desktopPrint("[PAM] RAM algorithm (print speed) equals "..ramAlgorithm);
	self:desktopPrint("[PAM] CPU algorithm (print amount) equals "..cpuAlgorithm);
	self:desktopPrint("[PAM] GPU algorithm (gpu corrupt percentage) equals "..gpuAlgorithm);
	self:desktopPrint("[PAM] HDD algorithm (storage amount) equals "..harddiskAlgorithm);

	if ( ramAlgorithm == math.huge ) then

		self:desktopPrint("[PAM] RAM algorithm (print speed) was infinite, please report this to author. Set it to 20 meanwhile");
		ramAlgorithm = 20;

	end

	timer.Create( "printTimer"..self:EntIndex(), ramAlgorithm, 0, function()

		local rng = math.random(1,100);

		self:desktopPrint("[PAM] GPU random number generator (RNG) equals "..rng);

		local group = _.vipGroups[owner:GetUserGroup()] or { modifier = 1 };

		if ( rng <= gpuAlgorithm ) then

			self.money = math.Round( self.money + ( (cpuAlgorithm/100 * _.corruptMoneyPercentage) * group.modifier ) );

			self:SetCorruptedPrint(true);

			timer.Simple( 3, function()

				if ( IsValid(self) ) then

					self:SetCorruptedPrint(false);

				end

			end)

		else

			self.money = math.Round( self.money + (cpuAlgorithm * group.modifier) );

		end

		if ( tonumber(self:GetMoney()) >= harddiskAlgorithm ) then

			self.money = harddiskAlgorithm;

		end

		net.Start("desktopPrinter_Money");
			net.WriteEntity( self );
			net.WriteFloat( self.money );
		net.Broadcast();

	end)

end

function ENT:OnTakeDamage( dmg )

	if ( self:GetAP() >= 1 ) then

		local damage = dmg:GetDamage();
		local armor = self:GetAP();

		self:SetAP( armor - damage );

		if ( ( armor - damage ) <= -1  ) then

			self:SetHP( self:GetHP() + ( armor - damage ) ); -- if I minus it'll add as - - = +

		end

	elseif ( self:GetHP() >= 1 && self:GetAP() <= 0 ) then

		self:SetHP( self:GetHP() - dmg:GetDamage() );

	end

	if ( self:GetHP() <= 0 ) then

		self:Remove();

	end

end

function ENT:Touch( ent )

	if ( !self.beenTouchedBy[ent] ) then

		timer.Simple(0.01, function()

		if ( ent:IsPlayer() ) then return; end

		self:desktopPrint("["..ent:GetClass().."]");

		if ( string.StartWith(ent:GetClass(), "pat_desktop_upgrades_gpu_" ) ) then

			self:desktopPrint("[pat_desktop_upgrades_gpu_] prefix. Entity: ["..ent:GetClass().."]" );

			self:desktopPrint("[pat_desktop_upgrades_gpu_] prefix. Inside function");

			if ( self:GetGPU() != ent:GetGPUName() ) then self:SetGPUAmount(0); end

			if ( self:GetGPUAmount() >= self:GetMaxGPUs() ) then self:desktopPrint("[pat_desktop_upgrades_gpu_] prefix. Max amount of GPUs reached"); return end

			self:SetGPU(ent:GetGPUName());
			self:SetGPUAmount(self:GetGPUAmount() + 1);
			self:SetGPUMhz(ent:GetGPUMhz());
			self:SetGPUCores(ent:GetGPUCores());
			self:SetGPUImage(ent:GetGPUImage());
			ent:Remove()

		elseif ( string.StartWith(ent:GetClass(), "pat_desktop_upgrades_cpu_" ) ) then

			self:desktopPrint("[pat_desktop_upgrades_cpu_] prefix. Entity: "..ent:GetClass());

			if ( self:GetCPU() != ent:GetCPUName() ) then self:SetCPUCores(0); self:SetCPUAmount( 0 ) end

			if ( self:GetCPUAmount() >= self:GetMaxCPUs() ) then
			self:desktopPrint("[pat_desktop_upgrades_cpu_] prefix. Max amount of CPUs reached");
			return false;
			end

			self:SetCPU(ent:GetCPUName());
			self:SetCPUMhz(ent:GetCPUMhz());
			self:SetCPUCores(ent:GetCPUCores() + self:GetCPUCores() );
			self:SetCPUAmount( self:GetCPUAmount() + 1 );
			self:SetCPUImage( ent:GetCPUImage() );
			ent:Remove();


		elseif ( string.StartWith(ent:GetClass(), "pat_desktop_upgrades_ram_" ) ) then

			self:desktopPrint("[pat_desktop_upgrades_ram_] prefix. Entity: "..ent:GetClass());

			if ( self:GetRAM() != ent:GetRAMName() ) then self:SetRAMGB(0); self:SetRAMAmount(0); end
			if ( self:GetRAMAmount() >= self:GetRAMSlots() ) then return; end

			self:desktopPrint("[pat_desktop_upgrades_ram_] Inside function");

			self:SetRAM(ent:GetRAMName());
			self:SetRAMMhz(ent:GetRAMMhz())
			self:SetRAMGB(ent:GetRAMGB() + self:GetRAMGB() );
			self:SetRAMAmount( self:GetRAMAmount() + 1 );
			ent:Remove();

		elseif ( string.StartWith( ent:GetClass(), "pat_desktop_upgrades_hdd_" ) ) then

			self:desktopPrint("[pat_desktop_upgrades_hdd_] prefix. Entity: "..ent:GetClass());

			--self:SetHDD(ent:GetHDDName());
			self:SetHDDGB(ent:GetHDDGB());
			ent:Remove();

		elseif ( string.StartWith(ent:GetClass(), "pat_desktop_upgrades_mobo") ) then

			self:desktopPrint("[pat_desktop_upgrades_mobo_] prefix. Entity: "..ent:GetClass());

			self:SetMOBO(ent:GetMOBOName());
			self:SetMaxGPUs(ent:GetMaxGPUs());
			self:SetMaxCPUs(ent:GetMaxCPUs());
			self:SetRAMSlots(ent:GetRAMSlots());
			self:SetMOBOImage(ent:GetMOBOImage());
			ent:Remove();

		end

		timer.Destroy("printTimer"..ent:EntIndex());

			self:Print();

		end)

		self.beenTouchedBy[ent] = true;

        timer.Simple(0.5, function()

			if ( IsValid(self) ) then

        		self.beenTouchedBy[ent] = false;

			end;

        end)

	end

end

function ENT:Think()
end

function ENT:OnRemove()

	self.beenTouchedBy = {};

	if ( timer.Exists("printTimer"..self:EntIndex()) ) then

		timer.Destroy("printTimer"..self:EntIndex());

	end


	if (self.sound) then
		self.sound:Stop();
	end

end
