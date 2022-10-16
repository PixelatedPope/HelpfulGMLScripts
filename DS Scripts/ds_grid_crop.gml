///ds_grid_crop(grid, croppable value,margin);
//Cuts all of the unneeded space out of the grid.  Returns a copy of the cropped grid.
var _grid = argument0;
var _val = argument1;
var _margin = argument2;
//Find the bounds
var _min_x = 100000;
var _max_x = -1;
var _min_y = 100000;
var _max_y = -1;

for (var _x = 0; _x < ds_grid_width(_grid); _x++)
{
  for (var _y = 0; _y < ds_grid_height(_grid); _y++)
  {
    if (_grid[#_x, _y] != _val)
    {
      if (_x < _min_x) _min_x = _x;
      if (_x > _max_x) _max_x = _x;
      if (_y < _min_y) _min_y = _y;
      if (_y > _max_y) _max_y = _y;
    }
  }
}
var _cropped_grid = ds_grid_create(_max_x - _min_x + 1 + _margin * 2, _max_y - _min_y + 1 + _margin * 2);
ds_grid_set_grid_region(_cropped_grid,_grid,
			_min_x - _margin, _min_y - _margin, 
			_max_x + 1 + _margin, _max_y + 1 + _margin, 
			0, 0);
ds_grid_destroy(_grid);
return _cropped_grid;