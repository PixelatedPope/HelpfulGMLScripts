///@func gui_get_y(y, [view = 0])
function gui_get_y(_y, _view){
	var _gh = display_get_gui_height();
	var _vy = camera_get_view_y(view_camera[_view]);
	var _vh = camera_get_view_height(view_camera[_view]);
	return(lerp(0,_gh,(_y-_vy)/_vh));
}