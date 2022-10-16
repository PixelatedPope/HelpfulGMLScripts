/// @description Returns a 2D Vector for the steering direction to approach the given point.
/// @param current_pos_vector
/// @param current_vel_vector
/// @param target_vect
/// @param max_speed
var _pos = argument[0];
var _vel = argument[1]
var _target = argument[2];
var _desired_velocity=vect2_scale(vect2_subtract(_target,_pos),argument[3]);

return vect2_subtract(_desired_velocity,_vel);