/// @func wrap(val, min, max)
function wrap(_val, _min, _max) { 
	//If it is greater than or equal to max or less than min it will wrap around
	var _small = min(_min,_max);
	var _large = max(_min,_max) - _small;
	var _value = _val - _small;

	return _value-floor(_value/_large)*_large + _small;
}