///ds_grid_add_row(grid index)
//Adds a row to the grid and returns the index of the new row
var _grid = argument[0];
ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);
return(ds_grid_height(_grid)-1);
