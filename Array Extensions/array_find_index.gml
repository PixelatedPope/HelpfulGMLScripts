///@func array_find_index(array, value)
function array_find_index(_array, _val){
	for (var _i = 0 ; _i < array_length(_array) ; _i++){
		if _array[_i] == _val
		{
			return _i
		}
	}
	return -1
}