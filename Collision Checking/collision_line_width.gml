///@func collision_line_width(x1, y1, x2, y2, width,object)
//Requires an object with a sprite that is 
//  1. greater than 32x32 tall 
//  2. Rotated Rectangle Collision Mask. 
//  3. middle left origin 
//  4. called obj_sensor.  If you name it something different change it in this code.
function collision_line_width(_x1, _y1, _x2, _y2, _w, _obj){
	if(!instance_exists(obj_sensor)) 
		instance_create_depth(0,0,0,obj_sensor);
	with(obj_sensor){
		x=_x1;
		y=_y1;
		image_angle = point_direction(_x1,_y1,_x2,_y2);
		image_xscale = point_distance(_x1,_y1,_x2,_y2) / sprite_get_width(sprite_index);
		image_yscale = _w / sprite_get_height(sprite_index);

		return place_meeting(x, y, _obj);
	}
}