///@func array_filter(array, filterFunction)
function array_filter(_arr, _func){
	var _return = [];
	for(var _i = 0; _i < array_length(_arr); _i++){
		var _item = _arr[_i];
		if(_func(_item))
			array_push(_return, _item);
	}
	return _return;
}