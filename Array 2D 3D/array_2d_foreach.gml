function array_2d_foreach(_arr, _func){
  var _width = array_length(_arr);
  var _height = array_length(_arr[0]);
  
  for(var _x = 0; _x < _width; _x++){
    for(var _y = 0; _y < _height; _y++){
      _func(_arr[_x][_y], _arr, [_x, _y]);
    }
  }
}
