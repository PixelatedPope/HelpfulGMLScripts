///@func position_between(lower, upper, value)
function position_between(_val1, _val2, _val3){
  //normalize values
  _val2 -= _val1
  _val3 -= _val1
  return _val3 / _val2;
}