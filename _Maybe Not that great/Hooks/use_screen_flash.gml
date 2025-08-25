///@func use_screen_flash()
///@dependencies: draw_rectangle_sprite
function use_screen_flash(){
  return {
    color: c_white,
    timer: 0,
    length: 0,
    
    set: function(_col, _len) {
      color = _col;
      timer = 0;
      length = _len;
    },

    draw: function() {
      if(timer >= length) return;
      var _alpha = 1 - (timer / length);
      draw_rectangle_sprite(sprPixel, 0, 0, GUI_W, GUI_H, false, color, _alpha);
      timer++;
    }
  }
}