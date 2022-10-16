/// @description Returns a Vector for the steering direction to approach and slow down to reach the given point.
/// @param current_pos_vect
/// @param current_velocity_vect
/// @param target_vect
/// @param max_speed
/// @param slowingradius

var _pos = argument[0];
var _vel = argument[1];
var _target=argument[2];
var _spd = argument[3];
var _slowing_radius=argument[4];

var _desired_velocity=vect2_subtract(_target,_pos);
var _distance=point_distance(_pos[0],_pos[1],_target[0],_target[1]);

// Check the distance to detect whether the target
// is inside the slowing area
if (_distance < _slowing_radius) 
{	// Inside the slowing area
	_desired_velocity = vect2_scale(_desired_velocity,_spd*(_distance/_slowing_radius));
} 
else 
{
	// Outside the slowing area.
	_desired_velocity = vect2_scale(_desired_velocity,_spd);
}

 
// Set the steering based on this
return vect2_subtract(_desired_velocity,_vel);