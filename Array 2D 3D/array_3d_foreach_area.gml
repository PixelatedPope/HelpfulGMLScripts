function array_3d_foreach_area(_arr, _pos, _area, _func){
  var _x1 = _pos[X]
  var _y1 = _pos[Y]
  var _z1 = _pos[Z]
  for(var _x = _x1; _x < _x1 + _area[X]; _x++){
    for(var _y = _y1; _y < _y1 + _area[Y]; _y++){
      for(var _z = _z1; _z < _z1 + _area[Z]; _z++){
        if(!array_3d_is_in_bounds(_arr, [_x, _y, _z])) continue;
        _func(_arr[_x][_y][_z], _arr, [_x, _y, _z]);
      }
    }
  }
}