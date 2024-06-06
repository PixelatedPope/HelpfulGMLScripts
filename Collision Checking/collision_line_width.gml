///@func collision_line_width(x1, y1, x2, y2, width,object)
function collision_line_width(_x1, _y1, _x2, _y2, _w, _obj){
	if(!instance_exists(obj_sensor)) //Requires an object with a sprite that is greater than 32x32 tall with a middle left origin called obj_sensor.  Or whatever.
		instance_create_depth(0,0,0,obj_sensor);
	obj_sensor.x=_x1;
	obj_sensor.y=_y1;
	obj_sensor.image_angle = point_direction(_x1,_y1,_x2,_y2);
	obj_sensor.image_xscale = point_distance(_x1,_y1,_x2,_y2) / sprite_get_width(obj_sensor.sprite_index);
	obj_sensor.image_yscale = _w / sprite_get_height(obj_sensor.sprite_index);

	return place_meeting(_obj.x,_obj.y,obj_sensor);
}