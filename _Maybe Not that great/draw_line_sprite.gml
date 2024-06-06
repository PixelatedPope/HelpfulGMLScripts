///@func draw_line_sprite(pixel_sprite, x1, y1, x2, y2, [width], [color], [alpha])
function draw_line_sprite(_pixel, _x1, _y1, _x2, _y2, _width = 1, _color = draw_get_color(), _alpha = draw_get_alpha()) {
  if(_width == 0) return;
  var _dir = point_direction(_x1, _y1, _x2, _y2),
      _len = point_distance(_x1, _y1, _x2, _y2) / sprite_get_width(_pixel);

  draw_sprite_ext(_pixel, 0, 
                  _x1+lengthdir_x(_width/2,_dir+90), 
                  _y1+lengthdir_y(_width/2,_dir+90), 
                  _len, _width, _dir, _color, _alpha);
}