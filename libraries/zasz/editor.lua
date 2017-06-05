

local editor = {
   _VERSION = 'editor v0.0.1',

   cursor_x = 0,
   cursor_y = 0,

   delta = 0,

   current_file = nil,
   firstLine = 0,
   lastLine = 0,
}

function editor.load(font)

   editor.font = font or love.graphics.newFont(console.fontSize)
   editor.fontSize = font and font:getHeight() or editor.fontSize
   editor.margin = editor.fontSize
   editor.lineSpacing = 1.25
   editor.lineHeight = editor.fontSize * editor.lineSpacing
   editor.x, editor.y = 0, 0
   
   editor.colors = {}
   editor.colors["input"]      = { r = 23, g = 55, b = 86, a = 190}
   editor.colors["background"] = { r = 23, g = 55, b = 85, a = 255}
   
   editors.resize(love.graphics.getWidth(), love.graphics.getHeight())
end


function editor.update(dt)

end


function editor.draw()
   if not editor.visible then
      return
   end

   love.graphics.push()
   local r, g, b, a = love.graphics.getColor()
   local font = love.graphics.getFont()
   local blend = love.graphics.getBlendMode()
   local cr, cg, cb, ca = love.graphics.getColorMask()
   local sx, sy, sw, sh = love.graphics.getScissor()
   local canvas = love.graphics.getCanvas()

   love.graphics.origin()
   love.graphics.setBlendMode("alpha")
   love.graphics.setColorMask(true, true, true, true)
   love.graphics.setCanvas()

   local color = editor.colors.background
   love.graphics.setColor(color.r, color.g, color.b, color.a)
   love.graphics.rectangle("fill", console.x, console.y, console.w, console.h)
   
   color = editor.colors.input


   love.graphics.setCanvas(canvas)
   love.graphics.pop()
   love.graphics.setFont(font)
   love.graphics.setColor(r, g, b, a)
   love.graphics.setBlendMode(blend)
   love.graphics.setColorMask(cr, cg, cb, ca)
   love.graphics.setScissor(sx, sy, sw, sh)
end
