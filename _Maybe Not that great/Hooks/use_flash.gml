///@func use_flash([getVariables])
function use_flash(_getVariables){
  return  {
    __iOwner: id,
    __iColor: c_white,
    __iAlpha: 0,
    __iFlashDec: 0, //how much we reduce the flash each step.
    start: function(_color, _length = 10) {
      __iAlpha = 1;
      __iColor = _color;
      __iFlashDec = 1 / _length;
    },
    draw: function(){
      gpu_set_fog(true,__iColor,-16000,16000);
      var _vars = __iGetVariables();
      draw_sprite_ext(_vars.sprite_index, 
                      _vars.image_index, 
                      _vars.x, 
                      _vars.y, 
                      _vars.image_xscale, 
                      _vars.image_yscale, 
                      _vars.image_angle, 
                      c_white, 
                      __iAlpha * _vars.image_alpha)
      gpu_set_fog(false,0,0,0);
      __iAlpha -= __iFlashDec;
    },
    
    __iGetVariables: _getVariables ?? function() {
      return {
        x: __iOwner.x,
        y:__iOwner. y,
        sprite_index: __iOwner.sprite_index,
        image_index: __iOwner.image_index,
        image_xscale: __iOwner.image_xscale,
        image_yscale: __iOwner.image_yscale,
        image_angle: __iOwner.image_angle,
        image_alpha: __iOwner.image_alpha        
      }
    }
  }
}