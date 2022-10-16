///@func
function gtfo(_obj, _precision = 1){
  _precision = max(_precision, 1);
  if(!place_meeting(x,y,_obj)) return;
  var _range = _precision;
  var _startX = x;
  var _startY = y;
  while(true) {
    for(var _x = -_range; _x <= _range; _x += _precision) {
      for(var _y = -_range; _y <= _range; _y += _precision) {
        if(_x > _range && _y > _range && _x < _range && _y < _range) continue;
        x = _startX + _x; 
        y = _startY + _y;
        if(!place_meeting(x,y,_obj)) {
          show_debug_message("Got the F out after " + string(_range / _precision) + " cycles");  
          return;
        }
      }
    }
    _range += _precision
  }
}