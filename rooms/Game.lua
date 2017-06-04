

local Game = Object:extend()

function Game:new()
   self.area = Area()

   self.game_width = 100
   self.game_height = 100
   self.tiles = { }
   local x_offset, y_offset = 0, 0
   
   for i=1,self.game_width do
      for j=1,self.game_height do
	 if math.random() < 0.20 then
	    self.area:addGameObject('GooGeyser', x_offset, y_offset)
	 else
	    if math.random() < 0.20 then
	       self.area:addGameObject('Wall', x_offset, y_offset)
	    else
	       self.area:addGameObject('Grassland', x_offset, y_offset)
	    end
	 end
	 x_offset = x_offset + 20
      end
      y_offset = y_offset + 20
      x_offset = 0
   end

   self.area:addGameObject('Slime', 40, 40)

end

function Game:update(dt)
   self.area:update(dt)
end

function Game:draw()
   self.area:draw()
end

return Game
