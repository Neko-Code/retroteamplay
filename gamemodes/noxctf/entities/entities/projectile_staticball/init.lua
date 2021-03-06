AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

include('shared.lua')

ENT.CounterSpell = COUNTERSPELL_DESTROY
ENT.Inversion = INVERSION_SETOWNER_REVERSE_TARGET_VELOCITY

function ENT:Initialize()
	self:DrawShadow(false)
	self:PhysicsInitSphere(16)
	self:SetSolid(SOLID_VPHYSICS)
	local phys = self:GetPhysicsObject()
	if phys:IsValid() then
		phys:EnableMotion(true)
		phys:Wake()
	end

	self.DeathTime = CurTime() + 10

	self.Target = NULL
	self.NextZap = 0
end

function ENT:Think()
	if self.PhysicsData then
		self:Explode(self.PhysicsData.HitPos, self.PhysicsData.HitNormal)
	end

	if self.DeathTime <= CurTime() then
		self:Explode()
		self:Remove()
		return
	end

	local mypos = self:GetPos()
	local owner = self:GetOwner()
	if owner:IsValid() then
		local myteam = self:GetTeamID()
		local target = self.Target
		if target:IsValid() and target:Alive() and target:GetPos():Distance(mypos) <= 750 and IsVisible(self:GetPos(), target:NearestPoint(mypos)) then
			local nearest = target:NearestPoint(mypos)
			self:GetPhysicsObject():SetVelocityInstantaneous((nearest - mypos):GetNormal() * 32)

			if self.NextZap <= CurTime() then
				self.NextZap = CurTime() + 0.25
				for _, ent in pairs(ents.FindInSphere(mypos, 200)) do
					if ent.SendLua and ent:Alive() and ent:Team() ~= myteam and IsVisible(self:GetPos(), nearest) and ent:IsVisibleTarget(owner) then
						local effectdata = EffectData()
							effectdata:SetOrigin(self:GetPos())
							effectdata:SetStart(nearest)
						util.Effect("StaticBallCharge", effectdata)
						ent:TakeSpecialDamage(2, DMGTYPE_SHOCK, owner, self)
					end
				end
			end
		else
			for _, ent in pairs(ents.FindInSphere(self:GetPos(), 400)) do
				if ent:IsPlayer() and ent:Alive() and ent:Team() ~= myteam and IsVisible(mypos, ent:NearestPoint(mypos)) then
					if ent:IsVisibleTarget(owner) then
						self.Target = ent
						break
					end
				end
			end
		end
	end
end

function ENT:PhysicsCollide(data, phys)
	self.PhysicsData = data
	self:NextThink(CurTime())
end

function ENT:Explode(hitpos, hitnormal)
	if self.Exploded then return end
	self.Exploded = true
	self.DeathTime = 0

	hitpos = hitpos or self:GetPos()
	hitnormal = hitnormal or Vector(0, 0, 1)

	local owner = self:GetOwner()
	if not owner:IsValid() then owner = self end

	local effectdata = EffectData()
		effectdata:SetOrigin(hitpos)
		effectdata:SetNormal(hitnormal)
		effectdata:SetScale(2)
	util.Effect("random_explosion_plasma", effectdata)

	ExplosiveDamage(owner, hitpos, 100, 10, 0, 1, 10, self, DMGTYPE_SHOCK)

	self:NextThink(CurTime())
end
