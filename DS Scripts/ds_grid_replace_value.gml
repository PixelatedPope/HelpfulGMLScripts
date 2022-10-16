/// @description ds_grid_replace_value
/// @param grid
/// @param current_value
/// @param replace_value

var _grid = argument0;
var _w = ds_grid_width(_grid);
var _h = ds_grid_height(_grid);
for(var _x = 0; _x<_w; _x++)
{
	for(var _y = 0; _y<_h; _y++)
	{
		if( _grid[# _x,_y] == argument1)
			_grid[#_x,_y] = argument2;
	}
}