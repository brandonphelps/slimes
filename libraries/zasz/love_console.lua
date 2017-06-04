local utf8 = require("utf8")

local console = {}

local current_entry = ''
local current_row = 0

local buffer = {}
local buffer_size = 20

local tabs = {}
local tab_height = 20
local tab_width = 50

function console:load()
   -- enable key repeat so backspace can be held down to trigger love.keypressed multiple times.
   love.keyboard.setKeyRepeat(true)
   table.insert(tabs, 'scripts')
   table.insert(tabs, 'console')
end

function console:drawtabs(x, y)
   local offset_x, offset_y = x, y
   for i, v in pairs(tabs) do
      love.graphics.setColor(0, 0, 0, 255)
      love.graphics.rectangle('fill', offset_x, offset_y, tab_width, tab_height)
      love.graphics.setColor(255, 255, 255, 255)
      love.graphics.print(v, offset_x, offset_y)
      offset_x = offset_x + tab_width
   end
end

function console:draw(x, y)
   current_row = 0

   self:drawtabs(x, y)
   love.graphics.setColor(0, 0, 0, 255)
   love.graphics.rectangle('fill', x, y+tab_height, 200, 200)
   love.graphics.setColor(255, 255, 255, 255)

   for i, v in pairs(buffer) do
      love.graphics.printf('> ' .. v, x, y + current_row + tab_height, love.graphics.getWidth())
      current_row = current_row + 15
   end
   love.graphics.printf('> ' .. current_entry, x, y + current_row + tab_height, love.graphics.getWidth())
end

function executetext()
   print('execute text: ' .. current_entry)
   table.insert(buffer, current_entry)
   local i = 0
   func, error = loadstring(current_entry)
   if func then
      if pcall(func) then
	 print('success')
      else
	 print('error')
      end
   else
      table.insert(buffer, 'error')
   end
   current_entry = ''
end

function love.textinput(t)
   console:textinput(t)
end

function love.keypressed(key)
   console:keypressed(key)
end

function console:textinput(t)
   current_entry = current_entry .. t
end

function console:keypressed(key)
   print(key)
   if key == "backspace" then
      -- get the byte offset to the last UTF-8 character in the string.
      local byteoffset = utf8.offset(current_entry, -1)
      
      if byteoffset then
	 -- remove the last UTF-8 character.
	 -- string.sub operates on bytes rather than UTF-8 characters, so we couldn't do string.sub(text, 1, -2).
	 current_entry = string.sub(current_entry, 1, byteoffset - 1)
      end
   elseif key == "return" then
      executetext()
      if #buffer > 20 then
	 table.remove(buffer, 1)
      end
   elseif key == "up" then
      current_entry = buffer[#buffer]
   end
end



return console
