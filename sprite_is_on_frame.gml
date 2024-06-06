/// @description sprite_is_on_frame(frame)
/// @param frame
/// Returns true on the first step the desired frame is displayed.
/// Jon didn't make it don't let him take credit.
function sprite_is_on_frame(_frame) {
	var _ret = (image_index - sprite_get_speed(sprite_index)/(sprite_get_speed_type(sprite_index)==spritespeed_framespergameframe?1:room_speed)*image_speed<(_frame)) && floor(image_index+math_get_epsilon()) == _frame;
	return _ret;
}