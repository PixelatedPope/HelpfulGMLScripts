///@func camera_set_view_pos_subpixel(cam,x,y)
function camera_set_view_pos_subpixel(_cam, _x, _y) {
	var	_sw = surface_get_width(application_surface),
		_vw = camera_get_view_width(_cam),
		_ratio = _vw/_sw;

	_x = round(_x/_ratio)*_ratio;
	_y = round(_y/_ratio)*_ratio;

	camera_set_view_pos(_cam,_x,_y);
}