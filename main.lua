

Object = require('libraries/classic/classic')
Input = require('libraries/boipushy/Input')
Timer = require('libraries/hump/timer')
Area = require('rooms/Area')
Game = require('rooms/Game')
GameObject = require('objects/GameObject')
Tile = require('objects/Tile')
GooGeyser = require('objects/GooGeyser')
Wall = require('objects/Wall')
Grassland = require('objects/Grassland')
Slime = require('objects/Slime')

-- Utilities = require('utilities')

console = require('libraries/love-console/console')

player = {id = '1', room = '1'}


function addRoom(room_type, room_name, ...)
   local room = _G[room_type](room_name, ...)
   rooms[room_name] = room
   return room
end

function gotoRoom(room_type, room_name, ...)
   if current_room and rooms[room_name] then
      if current_room.deactivate then
	 current_room.deactivate()
      end

      current_room = rooms[room_name]
      if current_room.activate then
	 current_room.activate()
      end
   else
      current_room = addRoom(room_type, room_name, ...)
   end
end

function move(x, y)
   if current_room then
      current_room.area.game_objects[1].x = x
      current_room.area.game_objects[1].y = y
   end
end

function love.load()
   rooms = {}
   current_room = nil
   gotoRoom('Game', 'game')
   console.load()
   console.setPos(10, 30)
   console.i('hello')
end


function love.update(dt)
   require('libraries/lovebird/lovebird').update()
   console.update(dt)
   if current_room then
      current_room:update(dt)
   end

end

function love.draw()

   if current_room then
      current_room:draw()
   end
   console.draw()
end

function love.keypressed(key)
   if console.keypressed(key) then
      return
   end

   if key == "escape" then
      love.event.quit()
   end
end

function love.textinput(t)
   console.textinput(t)
end

function love.resize(w, h)
   console.resize(w, h)
end

