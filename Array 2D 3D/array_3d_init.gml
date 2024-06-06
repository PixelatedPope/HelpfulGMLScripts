function array_3d_init(_width, _height, _depth, _value, _clone=false){
  var _arr = [];
  for(var _x = 0; _x < _width; _x++){
    for(var _y = 0; _y < _height; _y++){
      for(var _z = 0; _z < _depth; _z++){
        _arr[_x][_y][_z] = _clone ? variable_clone(_value) : _value;
      }
    }
  }
  return _arr;
}