include("shared.lua")

function ENT:StatusInitialize()
	self:DrawShadow(false)
	self:SetRenderBounds(Vector(-40, -40, -18), Vector(40, 40, 80))
	self.AmbientSound = CreateSound(self, "ambient/energy/electric_loop.wav")
	self.Emitter = ParticleEmitter(self:GetPos())
end

function ENT:StatusThink(owner)
	self.Emitter:SetPos(self:GetPos())
	self.AmbientSound:PlayEx(0.4, 70)
end

local matBolt = Material("Effects/laser1")
local matSprite = Material("effects/yellowflare")
function ENT:Draw()
	local owner = self:GetOwner()
	
	if not owner:IsValid() or owner:IsInvisible() or not owner:GetStatus("weapon_spell_saber") then return end
	
	local bone = owner:LookupBone("valvebiped.bip01_r_hand")
	if bone then
		local pos, ang = owner:GetBonePosition(bone)

		local emitter = self.Emitter
		
		for i=1, 8 do
			local particle = emitter:Add("effects/rollerglow", pos + ang:Right() * 1 + ang:Forward() * 4 + ang:Up() * math.random(-5,-33))
			particle:SetDieTime(0.1)
			particle:SetColor(255,50,0)
			particle:SetStartAlpha(255)
			particle:SetEndAlpha(0)
			particle:SetStartSize(10)
			particle:SetEndSize(10)
			particle:SetRoll(math.Rand(0, 360))
			particle:SetRollDelta(math.Rand(-20, 20))
			particle:SetVelocity(owner:GetVelocity())
		end
		render.SetMaterial(matBolt)
		local bstart = pos + ang:Right() * 2.2 + ang:Forward() * 4 + ang:Up() * -34
		local bend = pos + ang:Right() * 1 + ang:Forward() * 4  + ang:Up() * -7
		for i=1,4 do
			local bpos = pos + ang:Right() * 1 + ang:Forward() * 4 + VectorRand() * math.random(-5,5) + ang:Up() * -25
			local bpos2 = pos + ang:Right() * 1 + ang:Forward() * 4 + VectorRand() * math.random(-6,6) + ang:Up() * -12
			render.StartBeam(4)
			render.AddBeam(bstart, 7, 0, COLOR_YELLOW)
			render.AddBeam(bpos, 7, 0, COLOR_YELLOW)
			render.AddBeam(bpos2, 7, 0, COLOR_YELLOW)
			render.AddBeam(bend, 7, 0, COLOR_YELLOW)
			render.EndBeam()
		end
		render.SetMaterial(matSprite)
		for i=1, math.random(2, 5) do
			render.DrawSprite(bend, 15 + math.sin(CurTime() * 6), 15 + math.sin(CurTime() * 6), COLOR_YELLOW)
			render.DrawSprite(bstart, 4, 4, COLOR_YELLOW)
		end
	end
end
			