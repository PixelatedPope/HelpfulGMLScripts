function gui_get_maximized_bounds(){
	var _gui_w = display_get_gui_width();
	var _gui_h = display_get_gui_height();
	var _win_w = window_get_width();
	var _win_h = window_get_height();

	var _gui_win_scale = min(_win_w / _gui_w, _win_h / _gui_h);
	var _gui_aspect = _gui_w / _gui_h;
	var _win_aspect = _win_w / _win_h;

	if(_win_aspect > _gui_aspect){
		var _gui_pixel_w = _gui_w * _gui_win_scale;
		var _w_dif = (_win_w - _gui_pixel_w) / 2;

		return {
			left: 	-(_w_dif / _gui_win_scale),
			top: 0,
			right: _gui_w + (_w_dif / _gui_win_scale),
			bottom: _gui_h
		}
	} else if (_win_aspect < _gui_aspect){
		var _gui_pixel_h = _gui_h * _gui_win_scale;
		var _h_dif = (_win_h - _gui_pixel_h) / 2;
		return {
			left: 0,
			top: -(_h_dif / _gui_win_scale),
			right: _gui_w,
			bottom: _gui_h + (_h_dif / _gui_win_scale)
		}
	}
	
	return {
		left: 0,
		top: 0,
		right: _gui_w,
		bottom: _gui_h
	}
}