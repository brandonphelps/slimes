

local Tile = GameObject:extend()


function Tile:new(area, x, y, opts)
   Tile.super.new(self, area, x, y, opts)
end

function Tile:update(dt)
   Tile.super.update(self, dt)
end

function Tile:draw()

end

return Tile
