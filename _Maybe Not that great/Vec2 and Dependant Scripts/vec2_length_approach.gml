///@arg current_vec
///@arg target_length
///@arg change_amount
///Returns a vector changed by the give amount towards the target.
var _vec = argument0;
var _tar = argument1;
var _change = argument2;
var _cur_length = vec2_length(_vec);
if(_cur_length < _tar)
{
	_cur_length = min(_cur_length+_change,_tar);	
}
else
{
	_cur_length = max(_cur_length-_change,_tar);	
}
return vec2_set_length(_vec,_cur_length);