function draw_self_ext_subpixel(_sprite_index = sprite_index, _image_index = image_index, _x = x, _y = y, _image_xscale = image_xscale, _image_yscale = image_yscale, _image_angle = image_angle, _image_blend = image_blend, _image_alpha = image_alpha, _view = view_camera[0]){
  var	_sw = surface_get_width(application_surface),
		  _vw = camera_get_view_width(_view),
		  _ratio = _vw/_sw;

	_x = round(_x/_ratio)*_ratio;
	_y = round(_y/_ratio)*_ratio;
  
  draw_sprite_ext(_sprite_index, _image_index, _x, _y, _image_xscale, _image_yscale, _image_angle, _image_blend, _image_alpha)
}