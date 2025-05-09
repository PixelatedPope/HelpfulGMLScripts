///@func angle_clamp(angle, center, arc)
function angle_clamp(_angle, _center_dir, _arc){
  var _half_arc = _arc / 2;
  var _dif = angle_difference(_angle, _center_dir)
  if(abs(_dif) < _half_arc) return _angle;
  
  return _center_dir + _half_arc * sign(_dif)
}