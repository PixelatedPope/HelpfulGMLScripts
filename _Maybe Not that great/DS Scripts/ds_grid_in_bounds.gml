///ds_grid_in_bounds(grid,x,y)
//returns true if the given coordinates are available within the grid.
var _grid=argument[0];
var _x = argument[1];
var _y= argument[2];

return(!(_x<0 ||
         _x>ds_grid_width(_grid)-1 ||
         _y<0 ||
         _y>ds_grid_height(_grid)-1));
