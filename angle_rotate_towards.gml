///@func angle_rotate_towards(current, target, velocity, [direction])
function angle_rotate_towards(_current, _target, _velocity, _direction = sign(angle_difference(_current, _target))) {
	_velocity = abs(_velocity);
  var _remaining = angle_difference(_current, _target);
  if(_remaining == 0) return _target;  
  
  
  return abs(_remaining) < _velocity && sign(_remaining) == _direction 
         ? _target 
         : _current - _velocity * _direction;
}