/// @description ds_grid_change_orientation(grid)
/// @param {real} grid

var _grid = argument0;
var _w = ds_grid_width(_grid);
var _h = ds_grid_height(_grid);

var _new_grid = ds_grid_create(_h,_w);

for(var _y = 0; _y < _h; _y++)
{
	for(var _x = 0; _x < _w; _x++)
	{
		var _value = _grid[# _x,_y];
		_new_grid[# _y,_x]=_value;
	}
}

ds_grid_copy(_grid,_new_grid);
ds_grid_destroy(_new_grid);
