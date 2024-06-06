/// @description Returns a 2D vector with a length of 1
/// @param vector
var _v1 = argument0;
var _v;

var _tot = 0;
_v[0] = 0;
_v[1] = 0;
_tot+=_v1[0]*_v1[0];
_tot+=_v1[1]*_v1[1];

if(_tot != 0)
{
	_tot = sqrt(_tot);
	_v[0] = _v1[0]/_tot;
	_v[1] = _v1[1]/_tot;
}

return _v;
