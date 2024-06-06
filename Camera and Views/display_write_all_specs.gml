/// @func display_write_all_specs([x],[y]);
function display_write_all_specs(_x = 5, _y = 5){
	var _str="Display: "+string(display_get_width())+" x "+string(display_get_height())+" ("+string(display_get_width()/display_get_height())+")";
	_str+="\nWindow: "+string(window_get_width())+" x "+string(window_get_height())+" ("+string(window_get_width()/window_get_height())+")";
	_str+="\nGUI: "+string(display_get_gui_width())+" x "+string(display_get_gui_height())+" ("+string(display_get_gui_width()/display_get_gui_height())+")";
	_str+="\nApp Surface: "+string(surface_get_width(application_surface))+" x "+string(surface_get_height(application_surface))+" ("+string(surface_get_width(application_surface)/surface_get_height(application_surface))+")";
	for(var _i=0; _i<8 && view_enabled; _i++)
	{
		if(!view_visible[_i]) continue;
		_str+="\nView["+string(_i)+"]: "+string(camera_get_view_width(view_camera[_i]))+" x "+string(camera_get_view_height(view_camera[_i]))+" ("+string(camera_get_view_width(view_camera[_i])/camera_get_view_height(view_camera[_i]))+")";
		_str+="\n       x: "+string(camera_get_view_x(view_camera[_i]));
		_str+="\n       y: "+string(camera_get_view_y(view_camera[_i]));	
	}
	draw_text(_x,_y,_str);
}