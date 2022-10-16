///@func array_shuffle(array);
function array_shuffle(_arr) {
	var _len = array_length(_arr);
	for(var _i = 0; _i < _len; _i++) {
		var _r = irandom_range(_i, _len-1),
				_a1 = _arr[_i],
				_a2 = _arr[_r];
		
		_arr[@ _i] = _a2;
		_arr[@ _r] = _a1;
	}
}