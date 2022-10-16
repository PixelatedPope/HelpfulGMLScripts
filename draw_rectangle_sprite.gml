///@func draw_rectangle_sprite(pixel_sprite,x1, y1, x2, y2, outline, color, alpha);
function draw_rectangle_sprite(_pixel, _x1, _y1, _x2, _y2, _outline, _color = draw_get_color(), _alpha = draw_get_alpha()) {
  if(_outline) { 
    draw_sprite_ext(_pixel,0, _x1+1, _y1, _x2-_x1-2, 1, 0, _color,_alpha); //top
    draw_sprite_ext(_pixel,0, _x1, _y2-1, _x2-_x1, 1, 0, _color,_alpha); //bottom 
    draw_sprite_ext(_pixel,0, _x1, _y1, 1, _y2-_y1-1, 0, _color,_alpha); //left 
    draw_sprite_ext(_pixel,0, _x2-1,_y1, 1, _y2-_y1-1, 0, _color,_alpha); //rirght
  } else { 
    draw_sprite_ext(_pixel,0,_x1,_y1,_x2-_x1,_y2-_y1,0,_color,_alpha);
  }
}