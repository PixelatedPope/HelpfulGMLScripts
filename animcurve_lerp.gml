///@func animcurve_lerp(curve, channel, val1, val2, position)
function animcurve_lerp(_curve, _channel, _val1, _val2, _position){
  var _pos = animcurve_channel_evaluate(animcurve_get_channel(_curve, _channel), _position);
  return lerp(_val1, _val2, _pos) 
}