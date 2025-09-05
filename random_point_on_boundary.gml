///@func random_point_on_boundary(x1, y1, x2, y2, [exclude_top = false], [_exclude_bottom = false], [exclude_right = false], [exclude_left = false])
function random_point_on_boundary(_x1, _y1, _x2, _y2, _ex_top = false, _ex_bot = false, _ex_right = false, _ex_left = false){
  var _x = _x1;
  var _y = _y1;
  if(_ex_left && _ex_right && _ex_top && _ex_bot) return;
  
  var _spawn_on_side = choose(false, true)
  if(_spawn_on_side && _ex_left && _ex_right)
    _spawn_on_side = false;
  else if(!_spawn_on_side && _ex_top && _ex_bot)
    _spawn_on_side = true;
   
  if (_spawn_on_side) { //left / right edge
    _x = choose(_x1, _x2);
    if(_x == _x1 && _ex_left) _x = _x2;
    if(_x == _x2 && _ex_right) _x = _x1;
    
    _y = irandom_range(_y1, _y2);
  } else { //top / bottom edge
    _x = irandom_range(_x1, _x2);
    
    _y = choose(_y1, _y2);
    if(_y == _y1 && _ex_top) _y = _y2;
    if(_y == _y2 && _ex_bot) _y = _y1;
  }
      
  return {x: _x, y: _y}
}