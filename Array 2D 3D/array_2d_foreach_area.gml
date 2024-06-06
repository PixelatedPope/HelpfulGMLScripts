function array_2d_foreach_area(_arr, _pos, _area, _func){
  var _x1 = _pos[X]
  var _y1 = _pos[Y]
  for(var _x = _x1; _x < _x1 + _area[X]; _x++){
    for(var _y = _y1; _y < _y1 + _area[Y]; _y++){
      if(!array_2d_is_in_bounds(_arr, [_x, _y])) continue;
      _func(_arr[_x][_y], _arr, [_x, _y]);
    }
  }
}