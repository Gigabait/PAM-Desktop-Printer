ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = ""
ENT.Author = "Pat"
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

function ENT:SetupDataTables()

	self:NetworkVar("Entity", 0, "owning_ent")

	self:NetworkVar("String", 0, "RAMName");
	self:NetworkVar("Int", 0,    "RAMMhz");
	self:NetworkVar("Int", 1,    "RAMGB");
	self:NetworkVar("Int", 2,    "RAMImage");

end
