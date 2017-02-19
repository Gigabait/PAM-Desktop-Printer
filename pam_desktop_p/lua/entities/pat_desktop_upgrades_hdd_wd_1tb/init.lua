AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


local hddGB = 1000;

function ENT:Initialize()

	self:SetModel( "models/props_c17/consolebox03a.mdl" )
	self:SetColor( Color( 41, 183, 125 ) );
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	self:GetPhysicsObject():Wake();

	self:SetHDDGB( hddGB );

end
