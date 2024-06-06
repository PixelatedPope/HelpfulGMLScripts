///ds_grid_floodfill(grid id)
//Returns two things
//A ds_grid with 
//  noone for walls
//  1 for empty space
//  

//var t = get_timer();

var _grid, _w, _h, _empty_cells, _queue, _regions, _region_valid, _incr, _valid, _valid_switch, _xa, _xb, _ya, _yb, _val, _x, _y, _xx, _yy;

_grid = argument[0];
_w = ds_grid_width(_grid);
_h = ds_grid_height(_grid);

_empty_cells = ds_map_create();
_queue = ds_queue_create();

_regions = ds_grid_create(_w, _h);
ds_grid_clear(_regions,noone);
_region_valid = ds_list_create();

for (_y = 0; _y < _h; _y++)
{
  for (_x = 0; _x < _w; _x++)
  {
    if (_grid[#_x, _y] != 0) 
      _regions[# _x, _y]= -1;
    else 
      ds_map_add(_empty_cells, _x + _y * _w, 0);
  }
}

_incr = 0;
_valid_switch = false;
ds_list_add(_region_valid, false);

while (!ds_map_empty(_empty_cells))
{
  _incr++;
  _valid = true;
  ds_list_add(_region_valid, true);
  ds_queue_enqueue(_queue, ds_map_find_first(_empty_cells));

  while (!ds_queue_empty(_queue))
  {
    _val = ds_queue_dequeue(_queue);
    _y = _val div _w;
    _x = _val - _y * _w;

    if (ds_grid_get(_regions, _x, _y) != noone) 
      continue;

    ds_map_delete(_empty_cells, _val);
    ds_grid_set(_regions, _x, _y, _incr);

    if (_x - 1 < 0)
    {
      _xa = 0;
      _xb = _x + 1;
      _valid_switch = true;
    }
    else if (_x + 1 >= _w)
    {
      _xa = _x - 1;
      _xb = _w - 1;
      _valid_switch = true;
    }
    else
    {
      _xa = _x - 1;
      _xb = _x + 1;
    }

    if (_y - 1 < 0)
    {
      _ya = 0;
      _yb = _y + 1;
      _valid_switch = true;
    }
    else if (_y + 1 >= _h)
    {
      _ya = _y - 1;
      _yb = _h - 1;
      _valid_switch = true;
    }
    else
    {
      _ya = _y - 1;
      _yb = _y + 1;
    }

    if (_valid_switch)
    {
      if (_valid)
      { //Found the edge of the grid, this region isn't valid.
        ds_list_replace(_region_valid, _incr, false);
        _valid = false;
      }
      _valid_switch = false;
    }

    //Look at 8 adjacent cells
    for (_yy = _ya; _yy <= _yb; _yy++)
    {
      for (_xx = _xa; _xx <= _xb; _xx++)
      {
        if (_xx == _x) and(_yy == _y) 
          continue;
        if (ds_grid_get(_regions, _xx, _yy) == noone) 
          ds_queue_enqueue(_queue, _xx + _yy * _w);
      }
    }
  }
}

ds_queue_destroy(_queue);
ds_map_destroy(_empty_cells);

var result;
result[0] = _regions;
result[1] = _region_valid;

//show_debug_message("time: " + string(get_timer() - t));

return result;
