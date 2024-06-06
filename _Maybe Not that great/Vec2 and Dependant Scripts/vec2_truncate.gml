/// @description if the vector exceeds the given length, it will be returned truncated to max length.
/// @param vector
/// @param max_length
var _vec=argument0;
var _len=argument1;

if(vec2_length(_vec) > _len)
    _vec=vec2_scale(_vec,_len);
return _vec;