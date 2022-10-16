/// @description merge_color_rainbow()
/// @param color1
/// @param color2
/// @param amount
 
var _col1 = [color_get_hue(argument0),
             color_get_saturation(argument0),
             color_get_value(argument0)];
var _col2 = [color_get_hue(argument1),
             color_get_saturation(argument1),
             color_get_value(argument1)];

//This makes blending towards white look better.
if(_col1[1] == 0)  _col1[0] = _col2[0];
if(_col2[1] == 0)  _col2[0] = _col1[0];
//This make blending towards black look better.
if(_col1[2] == 0)  _col1[1] = _col2[1];
if(_col2[2] == 0)  _col2[1] = _col1[1];

//Find shortest path to target hue
var _dif = _col2[0] - _col1[0];
if(abs(_dif) > 128)
  _col1[0]+=(sign(_dif)*256);

//Wrap value between 0 <= 255
var _hue = lerp(_col1[0],_col2[0],argument2);
_hue = _hue-floor(_hue/256)*256; 

return make_color_hsv(round(_hue),
                      lerp(_col1[1],_col2[1],argument2),
                      lerp(_col1[2],_col2[2],argument2));