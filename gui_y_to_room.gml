function gui_y_to_room(_y, _view = 0){
	var _gh = display_get_gui_height();
	var _vy = camera_get_view_y(view_camera[_view]);
	var _vh = camera_get_view_height(view_camera[_view]);
	return(lerp(_vy, _vy + _vh, _y / _gh));
}