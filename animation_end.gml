/// @func animation_end(psprite_index],[image_index], [rate])
/// @param [sprite_index] The index of the sprite being animated
/// @param [image_index] The current frame value
/// @param [rate] The rate of change in frames per step if not
///								using built in image_index/image_speed.  
///							  If you don't think you need this.  You probably don't.
///  Returns true if the animation will loop this step.
function animation_end(_sprite = sprite_index, _image = image_index, _rate = undefined) {
  var _type = sprite_get_speed_type(_sprite);
  var _spd = sprite_get_speed(_sprite) * image_speed;
  if(_type == spritespeed_framespersecond)
  	_spd = _spd / room_speed;
  _spd = _rate == undefined ? _spd : _rate;
  return _image + _spd >= sprite_get_number(_sprite);
}