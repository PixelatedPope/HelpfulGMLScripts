/// @description sprite_is_on_frame(frame)
/// @param frame
/// Returns true on the first step the desired frame is displayed.
/// by Gleb Tsereteli
function sprite_is_on_frame(_frame) {
    var _speed = image_speed / (game_get_speed(gamespeed_fps) / sprite_get_speed(sprite_index));
    
    var _positive = (_speed > 0);
    var _min = _positive ? _frame : _frame + 1 + _speed;
    var _max = _positive ? _frame + _speed : _frame + 1;
    
    return ((image_index >= _min) and (image_index < _max));
}