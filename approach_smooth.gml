///@func approach_smooth(start, end, shift,[snap_distance]);
function approach_smooth(_start, _end, _shift, _snap = math_get_epsilon()){
  //We are close enough
  if(abs(_start-_end) < _snap) 
    return _end;	

  return lerp(_start,_end,_shift);
}