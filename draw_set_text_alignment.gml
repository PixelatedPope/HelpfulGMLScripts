#macro fa_left_bottom 1
#macro fa_center_bottom 2
#macro fa_right_bottom 3
#macro fa_left_middle 4
#macro fa_center_middle 5
#macro fa_right_middle 6
#macro fa_left_top 7
#macro fa_center_top 8
#macro fa_right_top 9
//Why the above values?  Look at your numpad.

///@func draw_set_text_alignment(alignment, [color], [font])
function draw_set_text_alignment(_alignment, _color = draw_get_color(), _font = draw_get_font()) {
  switch(_alignment)
  {
      case fa_left_bottom: draw_set_halign(fa_left);   draw_set_valign(fa_bottom); break;
      case fa_center_bottom: draw_set_halign(fa_center); draw_set_valign(fa_bottom); break;
      case fa_right_bottom: draw_set_halign(fa_right);  draw_set_valign(fa_bottom); break;
      case fa_left_middle: draw_set_halign(fa_left);   draw_set_valign(fa_middle); break;
      case fa_center_middle: draw_set_halign(fa_center); draw_set_valign(fa_middle); break;
      case fa_right_middle: draw_set_halign(fa_right);  draw_set_valign(fa_middle); break;
      case fa_left_top: draw_set_halign(fa_left);   draw_set_valign(fa_top); break;
      case fa_center_top: draw_set_halign(fa_center); draw_set_valign(fa_top); break;
      case fa_right_top: draw_set_halign(fa_right);  draw_set_valign(fa_top); break;
  }
  draw_set_color(_color);
  draw_set_font(_font);
}