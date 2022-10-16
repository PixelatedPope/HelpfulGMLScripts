///@func is_or(value, is_this, or_this, ...)
function is_or(_value) {
	for(var _i=1; _i<argument_count; _i++){
	  if(_value == argument[_i])
		return true;
	}
	return false;
}