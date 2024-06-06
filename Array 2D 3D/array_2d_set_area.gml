function array_2d_set_area(_arr, _pos, _w, _h, _val){
  for(var _x = _pos[X]; _x < _pos[X]+_w; _x++){
    for(var _y = _pos[Y]; _y < _pos[Y]+_h; _y++){
      if(!array_2d_is_in_bounds(_arr, [_x, _y])) continue;
      _arr[_x][_y] = _val;
    }
  }
}