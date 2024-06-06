function array_2d_init(_width, _height, _value, _clone=false){
  var _arr = [];
  for(var _x = 0; _x < _width; _x++){
    for(var _y = 0; _y < _height; _y++){
      _arr[_x][_y] = _clone ? variable_clone(_value) : _value;
    }
  }
  return _arr;
}