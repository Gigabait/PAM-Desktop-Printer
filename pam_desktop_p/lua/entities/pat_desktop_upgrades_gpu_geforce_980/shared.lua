ENT.Type = "anim"
ENT.Base = "base_gmodentity"
ENT.PrintName = ""
ENT.Author = "Pat"
ENT.Spawnable = false;
ENT.AdminSpawnable = false;

function ENT:SetupDataTables()

	self:NetworkVar("Entity", 0, "owning_ent")

	self:NetworkVar("String", 0, "GPUName");
	self:NetworkVar("Int", 0, "GPUMhz");
	self:NetworkVar("Int", 1, "GPUCores");
	self:NetworkVar("Int", 2, "GPUImage");
	
end
