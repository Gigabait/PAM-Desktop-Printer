AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")


local moboName = "ROG Ultimate";
local moboMaxGPUs = 2;
local moboMaxCPUs = 1;
local moboRAMSlots = 2;

function ENT:Initialize()

	self:SetModel( "models/props_c17/consolebox03a.mdl" )
	self:SetColor( Color( 102, 51, 153 ) );
	
	self:PhysicsInit( SOLID_VPHYSICS )
	self:SetMoveType( MOVETYPE_VPHYSICS )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetUseType( SIMPLE_USE )

	self:GetPhysicsObject():Wake();

	self:SetMOBOName( moboName );
	self:SetMaxGPUs( moboMaxGPUs );
	self:SetMaxCPUs( moboMaxCPUs );
	self:SetRAMSlots( moboRAMSlots );
	self:SetMOBOImage( 1 ); -- add image switch support later


end
