/// @func display_write_all_specs([hori_pos = fa_left], [vert_pos = fa_right], [scale = auto], [bg_alpha = .5])
function display_write_all_specs(_hori_pos = fa_left, _vert_pos = fa_top, _scale = display_get_gui_height() / window_get_height(), _bg_alpha = .5){
  var _dispW = display_get_width(), _dispH = display_get_height(),
      _winW = window_get_width(), _winH = window_get_height(),
      _appW = surface_get_width(application_surface), _appH = surface_get_height(application_surface),
      _guiW = display_get_gui_width(), _guiH = display_get_gui_height();
  
  var _str = "";
  
  var _dispRes =    $"{_dispW} x {_dispH}";
  var _dispAspect = $"{_dispW  /  _dispH}";
	
  _str += $"Display: {_dispRes} - {_dispAspect}\n";
  
  var _winRes =    $"{_winW} x {_winH}";
  var _winAspect = $"{_winW  /  _winH}";
  
  _str += $"Window: {_winRes} - {_winAspect}\n";
  
  var _appRes =    $"{_appW} x { _appH}";
  var _appAspect = $"{_appW  /   _appH}";
  var _appScale =  _winW / _appW == _winH / _appH ? $"{_winW / _appW}" : $"({_winW / _appW} : {_winH / _appH})";
  
  _str += $"App Surface: {_appRes} - {_appAspect} - {_appScale}X\n";
  
  var _guiRes =    $"{_guiW} x { _guiH}";
  var _guiAspect = $"{_guiW  /   _guiH}";
  var _guiScale =  _appW / _guiW == _appH / _guiH ? $"{_appW / _guiW}" : $"({_appW / _guiW} : {_appH / _guiH})";
  
  _str += $"GUI: {_guiRes} - {_guiAspect} - {_guiScale}X\n";
  
  for(var _i = 0; _i < 8 && view_enabled; _i++){ 
    if(!view_visible[_i]) continue;

    var _viewW = camera_get_view_width(view_camera[_i]), _viewH = camera_get_view_height(view_camera[_i]);
    var _viewRes = $"{_viewW} x {_viewH}"
    var _viewAspect = $"{_viewW / _viewH}"
    var _viewScale = _appW / _viewW  == _appH / _viewH ? $"{_appW / _viewW}" : $"({_appW / _viewW} : {_appH / _viewH})";
	var _viewTarget =  camera_get_view_target(view_camera[_i]);
    var _viewPos = $"   @{camera_get_view_x(view_camera[_i])}, {camera_get_view_y(view_camera[_i])} -> {_viewTarget == -4 ? "None" : object_get_name(_viewTarget)}"
    _str += $"View {_i}: {_viewRes} - {_viewAspect} - {_viewScale}X\n";
    _str += _viewPos +"\n"
  }
  
  var _font = draw_get_font();
  draw_set_font(-1)
  var _margin = 10 * _scale;
  var _width = string_width(_str) * _scale + _margin * 2;
  var _height = string_height(_str) * _scale + _margin * 2;
  
  var _x = 0;
  switch(_hori_pos){
	case fa_right:
		_x = _guiW - _width
		break;
	case fa_middle:
	case fa_center:
		_x = _guiW / 2 - _width / 2;
		break;
  }
  
  var _y = 0;
    switch(_vert_pos){
	case fa_bottom:
		_y = _guiH - _height
		break;
	case fa_middle:
	case fa_center:
		_y = _guiH / 2 - _height / 2;
		break;
  }
  
  draw_set_color(c_black);
  draw_set_alpha(_bg_alpha)
  draw_rectangle(_x, _y, _x + _width, _y + _height, false)
  draw_set_alpha(1)
  draw_set_color(c_white);
  draw_set_halign(fa_left)
  draw_set_valign(fa_top)
  draw_text_transformed(_x + _margin, _y + _margin, _str, _scale, _scale, 0);
  
  
  draw_set_font(_font)
}