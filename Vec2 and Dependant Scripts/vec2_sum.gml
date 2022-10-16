/// @description Adds any number of 2D vectors together.
/// @param vec1
/// @param vec2
/// @param [vec3...]

var _v=vec2_zero();
for(var _i=0; _i< argument_count; _i++)
{
	var _vec = argument[_i];
	_v[0] += _vec[0];
	_v[1] += _vec[1];
}
return _v;