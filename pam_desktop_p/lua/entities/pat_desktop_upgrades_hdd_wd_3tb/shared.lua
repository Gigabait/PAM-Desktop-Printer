ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = ""
ENT.Author = "Pat"
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

function ENT:SetupDataTables()

	self:NetworkVar("Entity", 0, "owning_ent")

	self:NetworkVar("Int", 0,    "HDDGB");

end
