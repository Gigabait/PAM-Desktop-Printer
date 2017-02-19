ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = ""
ENT.Author = "Pat"
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

function ENT:SetupDataTables()

	self:NetworkVar("Entity", 0, "owning_ent")

	self:NetworkVar("String", 0, "MOBOName");
	self:NetworkVar("Int", 0,    "MaxGPUs");
	self:NetworkVar("Int", 1,    "MaxCPUs");
	self:NetworkVar("Int", 2,    "RAMSlots");
	self:NetworkVar("Int", 3,    "MOBOImage");


end
