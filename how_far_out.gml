///@func how_far_out(value, min, max)
function how_far_out(_val, _min, _max){
  if(_val < _min) 
      return _val - _min;
  if(_val > _max) 
      return _val - _max;
	return 0;
}