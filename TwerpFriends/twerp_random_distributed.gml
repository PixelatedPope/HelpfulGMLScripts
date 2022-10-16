/// @param median
/// @param range
/// @param twerp_type
/// @param [invert=false]
var _med = argument[0];
var _x = argument[1];
var _curve = argument[2];
var _val = twerp_random(_x,_curve,argument_count > 3 ? argument[3] : false);
return _med + choose(1,-1)*_val;
