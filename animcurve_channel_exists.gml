function animcurve_channel_exists(_curve, _channel_name_or_id){
	var _struct = animcurve_get(_curve)	
	
	if(is_string(_channel_name_or_id))
		return array_any(_struct.channels, method({_channel_name_or_id}, function(_el){
			return _el.name ==	_channel_name_or_id;
		}))
	else
		return array_length(_struct.channels) < _channel_name_or_id;
}