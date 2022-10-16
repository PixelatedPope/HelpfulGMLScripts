/// @description returns a 2D vector array with the length scaled by the passed value.
/// @param vec
/// @param real

var _v1 = vec2_normalize(argument0);
var _scale = argument1;
var _v;

var _tot = 0;
_v[0] = _v1[0]*_scale;
_v[1] = _v1[1]*_scale;

return _v;