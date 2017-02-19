ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = ""
ENT.Author = "Pat"
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

function ENT:SetupDataTables()

	self:NetworkVar("Entity", 0, "owning_ent")

	self:NetworkVar("String", 0, "CPUName");
	self:NetworkVar("Int", 0,    "CPUMhz");
	self:NetworkVar("Int", 1,    "CPUCores");
	self:NetworkVar("Int", 2,    "CPUImage");

end
