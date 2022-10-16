///@param min
///@param max
///@param pos
///Works like lerp, but passing a position between 1 and 2 will "reflect" the results.
var _min = argument0;
var _max = argument1;
var _pos = abs(argument2) mod 2;

return _pos > 1 ? lerp(_max,_min,_pos-1) : lerp(_min,_max,_pos);