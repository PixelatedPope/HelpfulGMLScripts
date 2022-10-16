///@func array_find_index_ext(array, func, options)
function array_find_index_ext(_array, _func, _options){
	for (var _i = 0 ; _i < array_length(_array) ; _i++){
		if(_func(_array[_i],_options)) return _i;
	}
	return -1
}
