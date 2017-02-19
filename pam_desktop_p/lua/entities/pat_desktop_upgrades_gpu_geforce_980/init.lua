AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


local gpuName = "Geforce GTX 1080";
local gpuMhz = 3200;
local gpuCores = 3500;
local gpuImage = 1;

function ENT:Initialize()

	self:SetModel( "models/props_c17/consolebox03a.mdl" )
	self:SetColor( Color( 41, 128, 185 ) );

	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	self:GetPhysicsObject():Wake();

	self:SetGPUName( gpuName );
	self:SetGPUMhz( gpuMhz );
	self:SetGPUCores( gpuCores );
	self:SetGPUImage( gpuImage );

end
