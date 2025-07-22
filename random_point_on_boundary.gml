///@func random_point_on_boundary(x1, y1, x2, y2)
function random_point_on_boundary(_x1, _y1, _x2, _y2){
  var _x = _x1;
  var _y = _y1;

  if (choose(0,1)) {
      _x = choose(_x1, _x2);
      _y = irandom_range(_y1, _y2);
  } else {
      _x = irandom_range(_x1, _x2);
      _y = choose(_y1, _y2);
  }
      
  return {x: _x, y: _y}
}