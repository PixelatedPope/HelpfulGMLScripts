/// @description merge_color_multi(pos,col1,col2,col3,...)
/// @arg pos
/// @arg color1
/// @arg color2
/// @arg [value3...]

var _pos = argument[0] mod 1,
    _count = argument_count-2,
    _color = floor(_pos / (1/_count))+1;
_pos *= _count;
return merge_color(argument[_color],argument[_color+1], _pos mod 1);
//return merge_color_rainbow(argument[_color],argument[_color+1], _pos mod 1);
