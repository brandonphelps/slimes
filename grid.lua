


function newGrid(displayWidth, displayHeight, cellWidth, cellHeight)
   local grid = {}

   grid.displayWidth = displayWidth
   grid.displayHeight = displayHeight
   grid.cellWidth = cellWidth
   grid.cellHeight = cellHeight

   return grid
end


function gridPositions(x, y, grid)
   if x < 0 then
      x = 0
   end

   if y < 0 then
      y = 0
   end

   return grid.cellWidth * x, grid.cellHeight * y
end
