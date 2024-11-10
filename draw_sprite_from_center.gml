///@func draw_sprite_from_center(sprite, image, x, y, xscale, yscale, rot, col, alpha)
function draw_sprite_from_center(_spr, _img, _x, _y, _xscale, _yscale, _rot, _col, _alpha){
  var _originX = sprite_get_xoffset(_spr) - sprite_get_width(_spr) / 2;
  var _originY = sprite_get_yoffset(_spr) - sprite_get_height(_spr) / 2;
  
  _originX *= _xscale;
  _originY *= _yscale;

  matrix_set(matrix_world, matrix_build(_x,_y,0,0,0,_rot,1,1,1));
					 
  draw_sprite_ext(_spr, _img ,_originX, _originY,_xscale,_yscale,0,_col,_alpha);
  matrix_set(matrix_world,matrix_build_identity());
}