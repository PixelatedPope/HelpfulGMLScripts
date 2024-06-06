///ds_grid_insert_row(index,row position)
//Inserts a row in the grid at the given position.

var _grid = argument[0];
//show_debug_message("Resizing grid for insert...");
ds_grid_resize(_grid,ds_grid_width(_grid),ds_grid_height(_grid)+1);


var _row = argument[1];
ds_grid_set_grid_region(_grid,_grid,0,_row,ds_grid_width(_grid),ds_grid_height(_grid)-1-_row,
                        0,_row+1);
//show_debug_message("Insert Complete!");
