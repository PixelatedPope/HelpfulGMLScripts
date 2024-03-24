function mouse_get_position_accurate(){	
  var _winMX = window_mouse_get_x();	
  var _winMY = window_mouse_get_y();
  var _winW = window_get_width();
  var _winH = window_get_height();
  var _vx = camera_get_view_x(view_camera[0]);
  var _vy = camera_get_view_y(view_camera[0]);
  var _vw = camera_get_view_width(view_camera[0]);
  var _vh = camera_get_view_height(view_camera[0]);

  return {
    x: lerp(_vx, _vx+_vw, _winMX / _winW),
    y: lerp(_vy, _vy+_vh, _winMY / _winH)
  }
}