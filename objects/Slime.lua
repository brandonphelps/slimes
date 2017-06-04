

local Slime = GameObject:extend()

function Slime:new(area, x, y, opts)
   Slime.super.new(self, area, x, y, opts)
   self.energy = 10
end

function Slime:update(dt)
   Slime.super.update(self, dt)
end

function Slime:draw()
   love.graphics.circle('fill', self.x, self.y, 10)
end

function Slime:moveTo(tile)
   if self.energy == 10 then
      
   end
end



return Slime
