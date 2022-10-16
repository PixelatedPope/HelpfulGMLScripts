///@func lerp_clamped(val1, val2, pos)
function lerp_clamped(_val1,_val2,_pos) {
	var _min=min(_val1,_val2);
	var _max=max(_val1,_val2);
	return clamp(lerp(_val1,_val2,_pos),_min,_max);
}