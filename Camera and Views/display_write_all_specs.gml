/// @func display_write_all_specs([x],[y], [scale]);
function display_write_all_specs(_x = 5, _y = 5, _scale = 1){
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
  
	for(var _i = 0; _i < 8 && view_enabled; _i++)
	{ 
		if(!view_visible[_i]) continue;
    
    var _viewW = camera_get_view_width(view_camera[_i]), _viewH = camera_get_view_height(view_camera[_i]);
    var _viewRes = $"{_viewW} x {_viewH}"
    var _viewAspect = $"{_viewW / _viewH}"
    var _viewScale = _appW / _viewW  == _appH / _viewH ? $"{_appW / _viewW}" : $"({_appW / _viewW} : {_appH / _viewH})";
    
    _str += $"View {_i}: {_viewRes} - {_viewAspect} - {_viewScale}X\n";
	}
	draw_text_transformed(_x,_y,_str, _scale, _scale, 0);
}