///@func array_2d_foreach_adjacent(array, position, function, [skipCenter = true], [dist = 1], [cardinalOnly = true])
function array_2d_foreach_adjacent(_arr, _pos, _func, _skipCenter = true, _dist = 1, _cardnialOnly = true){
  var _xC = _pos[X]
  var _yC = _pos[Y]
  
  for(var _x = _xC - _dist; _x <= _xC + _dist; _x++){
    for(var _y = _yC - _dist; _y <= _yC + _dist; _y++){
        if(!array_2d_is_in_bounds(_arr, [_x, _y])) continue;
        //if(_skipCenter && _x == _xC && _y == _yC && _z == _zC) continue;
        //if(_cardnialOnly && abs(_x) + abs(_y) + abs(_z) > 1) continue; //TODO: This don't work with a distance more than 1. Does it need to? Maybe?
        var _val = _arr[_x][_y];
        _func(_val, _arr, [_x, _y]);
    }
  }
}
