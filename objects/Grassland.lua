
local Grassland = Tile:extend()


function Grassland:new(area, x, y, opts)
   Grassland.super.new(self, area, x, y, opts)
end

function Grassland:update(dt)
   Grassland.super.update(self, dt)
end

function Grassland:draw()
   love.graphics.setColor(0, 255, 0, 255)
   love.graphics.rectangle('fill', self.x, self.y, 20, 20)
   love.graphics.setColor(255, 255, 255, 255)
end

return Grassland
