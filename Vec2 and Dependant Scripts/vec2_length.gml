/// @description returns the length of the given 2D vector
/// @param vector
var _v1 = argument0;

var _tot = 0;
_tot+=_v1[0]*_v1[0];
_tot+=_v1[1]*_v1[1];
if(_tot != 0)
	_tot = sqrt(_tot);
	
return _tot;