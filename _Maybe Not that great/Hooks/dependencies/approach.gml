///@func approach(start, end, shift)
function approach(_start, _end, _shift){
  if (_start < _end)
      return min(_start + _shift, _end); 
  else
      return max(_start - _shift, _end);
}