

local GooGeyser = Tile:extend()

function GooGeyser:new(area, x, y, opts)
   GooGeyser.super.new(self, area, x, y, opts)
   self.goo = 0
   self.goo_max = 500
   self.update_time = 0
   self.goo_refresh_time = 10
end

function GooGeyser:update(dt)
   self.update_time = self.update_time + dt
   if self.update_time > self.goo_refresh_time then
      self.update_time = self.update_time - self.goo_refresh_time
      self.goo = self.goo + 1
   end
end

function GooGeyser:draw()
   local vidvidness = self.goo / self.goo_max
   love.graphics.setColor(0, vidvidness+115, vidvidness+115, 255)
   love.graphics.rectangle('fill', self.x, self.y, 20, 20)
   love.graphics.setColor(255, 255, 255, 255)
end

return GooGeyser
