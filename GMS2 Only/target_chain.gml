/// @description target_chain(list,object,max_distance)
/// @param list
/// @param object
/// @param max_dist
var _list = argument0;
var _obj = argument1;
var _max_dist = argument2;

var _nearest = noone;
var _near_dist = _list/0; //Infinity
with(_obj)
{
	if(id == other) continue; //This is me.
	if(ds_list_find_index(_list,id)!= -1) continue; //already on the list
	var _dist = point_distance(other.x,other.y,x,y);
	if(_dist >= _near_dist || _dist > _max_dist) continue;
	_nearest=id;
	_near_dist=_dist;
}

with(_nearest)
{
	ds_list_add(_list,id);
	target_chain(_list,_obj,_max_dist);
}