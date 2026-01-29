function gui_x_to_room(_x, _view = 0){
	var _gw = display_get_gui_width();
	var _vx = camera_get_view_x(view_camera[_view]);
	var _vw = camera_get_view_width(view_camera[_view]);
	return(lerp(_vx, _vx + _vw, _x / _gw));
}