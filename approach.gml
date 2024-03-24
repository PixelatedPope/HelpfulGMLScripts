///@func approach(start, end, shift)
function approach(_start, _end, _shift){
  return _start < _end ? min(_start + _shift, _end) : max(_start - _shift, _end);
}