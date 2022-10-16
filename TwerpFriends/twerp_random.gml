/// @param x
/// @param twerp_type
/// @param [invert=false]
var _x = argument[0];
var _invert = argument_count>2 ? argument[2] : false;
while(true)
{ 
  var _ran = random(1);
  var _twerp = twerp(argument[1],0,_x,_ran);
  var _random = random(_x);
	
	if(_invert && _random>_twerp) 
		return _random;
	else if(!_invert && _random < _twerp)
		return _random;
}