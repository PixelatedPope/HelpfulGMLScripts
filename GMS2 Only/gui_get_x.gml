///@func gui_get_x(x, [view = 0])
function gui_get_x(_x, _view = 0) {
	var _gw = display_get_gui_width();
	var _vx = camera_get_view_x(view_camera[_view]);
	var _vw = camera_get_view_width(view_camera[_view]);
	return(lerp(0,_gw,(_x-_vx)/_vw));
}