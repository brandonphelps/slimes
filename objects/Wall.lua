

local Wall = Tile:extend()


function Wall:new(area, x, y, opts)
   Wall.super.new(self, area, x, y, opts)
end

function Wall:update(dt)

end

function Wall:draw()
   love.graphics.setColor(128, 128, 128, 255)
   love.graphics.rectangle('fill', self.x, self.y, 20, 20)
   love.graphics.setColor(255, 255, 255, 255)
end

return Wall
