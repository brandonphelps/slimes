

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
   
   
end

function editor.update(dt)

end


function editor.draw(x, y)

end
