///ds_grid_is_in_bounds(grid,x,y)
//Returns true if the coordinate given is within the bounds of the ds_grid.
var _grid=argument[0];
var _w=ds_grid_width(_grid);
var _h=ds_grid_height(_grid);

return(argument[1] >= 0 && argument[2] >= 0 &&
       argument[1] < _w && argument[2] < _h); 
   
