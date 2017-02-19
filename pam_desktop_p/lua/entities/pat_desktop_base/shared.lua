---------------------------------------------------------------------------------
-- Developed by Pat & Mikael for Xanath Roleplay from 29-04-2016 to **-**-**** --
-- Pat ( Patrick Ratzow ) [ tgs.anapps.dk ] ( ID64: 76561198202328247 )        --
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


ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = "Desktop"
ENT.Author = "Pat"
ENT.Spawnable = false
ENT.AdminSpawnable = false

function ENT:SetupDataTables()

	self:NetworkVar("Int", 0, "price")
	self:NetworkVar("Entity", 0, "owning_ent")

	self:NetworkVar("Int", 1, "Money");
	self:NetworkVar("Float", 0, "HP");
	self:NetworkVar("Float", 1, "AP");

	-- CPU
	self:NetworkVar("Int", 2, "CPUMhz");
	self:NetworkVar("Int", 3, "CPUCores");
	self:NetworkVar("Int", 13, "CPUAmount");
	self:NetworkVar("Int", 14, "MaxCPUs");
	self:NetworkVar("Int", 15, "CPUImage");
	self:NetworkVar("String", 0, "CPU");

	-- RAM
	self:NetworkVar("Int", 4, "RAMGB");
	self:NetworkVar("Int", 5, "RAMMhz");
	self:NetworkVar("String", 1, "RAM");
	self:NetworkVar("Int", 18, "RAMAmount");

	-- HDD
	self:NetworkVar("Int", 6, "HDDGB");

	-- GPU
	self:NetworkVar("Int", 7, "GPUAmount")
	self:NetworkVar("Int", 8, "GPUMhz");
	self:NetworkVar("Int", 9, "GPUCores");
	self:NetworkVar("String", 2, "GPU");
	self:NetworkVar("Bool", 1, "CorruptedPrint");
	self:NetworkVar("Int", 17, "GPUImage");

	-- MOBO
	self:NetworkVar("String", 3, "MOBO");
	self:NetworkVar("Int", 10, "MaxGPUs");
	self:NetworkVar("Int", 11, "MaxCPUs");
	self:NetworkVar("Int", 12, "RAMSlots");
	self:NetworkVar("Int", 16, "MOBOImage");

	self:NetworkVar("Bool", 0, "PrinterEnabled");

end
