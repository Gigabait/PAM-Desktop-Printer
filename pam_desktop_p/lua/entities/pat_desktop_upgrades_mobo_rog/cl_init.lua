include("shared.lua")

function ENT:Draw()

  self:DrawModel();

  local Pos = self:GetPos()
	local Ang = self:GetAngles()

  Ang:RotateAroundAxis(Ang:Up(), 90)

	cam.Start3D2D(Pos + Ang:Up() * 8.2, Ang, 0.11)

    draw.RoundedBox(0, -100, -100, 200, 200, Color( 29, 29, 29, 245 ) );
    draw.DrawText("Motherboard\n"..self:GetMOBOName().."\nCPU slots: "..self:GetMaxCPUs().."\nGPU slots: "..self:GetMaxGPUs().."\nRAM slots: "..self:GetRAMSlots(), "zaugen_printer_nameFont", 0, -65, Color(255,255,255), TEXT_ALIGN_CENTER )

	cam.End3D2D()

end
