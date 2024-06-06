///@func display_get_best_fit(desired width, desired height, [display width],[display height])
///Returns an array with ideal width, height, and full screen zoom factor.
///Optional arguments for checking what your game would look like on different resolutions.
function display_get_best_fit(_w, _h, _dispW = display_get_width(), _dispH = display_get_height()) {
  var _options = [];
  
	for(var _i = 100; _i > 1; _i--) {
		if(_dispW % _i != 0 || _dispH % _i != 0) continue;
		array_push(_options, _i);
	}
  
  var _closest = infinity;
  var _best = 0;
  for(var _i = 0; _i< array_length(_options); _i++) {
    var _scale = _options[_i];
    var _width = _dispW / _scale;
    var _height = _dispH / _scale;
    var _dist = point_distance(_w,_h,_width,_height);
    if(_dist < _closest) {
      _closest = _dist;
      _best = _scale;
    }
  }

  return [_dispW / _best, _dispH / _best, _best];
}