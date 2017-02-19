AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

local cpuName = "i7-4790";
local cpuMhz = 3600;
local cpuCores = 4;
local cpuImage = 3;

function ENT:Initialize()

	self:SetModel( "models/props_c17/consolebox03a.mdl" )
	self:SetColor( Color( 208, 57, 57 ) );
	
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	self:GetPhysicsObject():Wake();

	self:SetCPUName(  cpuName );
	self:SetCPUMhz(   cpuMhz );
	self:SetCPUCores( cpuCores );
	self:SetCPUImage( cpuImage );

end
