///@func position_between(value, lower, upper)
function position_between(_val, _low, _up){
  //normalize values
  _up -= _low
  _val -= _low
  return _val / _up;
}