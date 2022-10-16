/// @param min
/// @param max
/// @param twerp_type
/// @param [invert=false]
var _min = argument[0];
var _max = argument[1];
var _curve = argument[2];
var _val = twerp_random(_max-_min,_curve,argument_count > 3 ? argument[3] : false);
return _min + _val;
