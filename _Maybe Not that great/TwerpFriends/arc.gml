/// @description arc(start, peak, end, position, bias)
/// @function arc
/// @param start
/// @param peak
/// @param end
/// @param position
/// @param bias
/// DEPENDS ON INTERPOLATE SCRIPT
var _p = clamp(argument3,0,1);
if(argument3 <= .5)
{
		_p=_p*2;
    return interpolate(argument0,argument1,_p,argument4);
}
else
{
    //var b=1-argument4;
    _p=2*_p-1;
    return interpolate(argument1,argument2,_p,1-argument4);
}
