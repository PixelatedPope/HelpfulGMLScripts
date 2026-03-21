///@function seconds_to_timestamp(seconds)
function seconds_to_timestamp(_seconds){
  _seconds = round(_seconds);
  var _m = _seconds div 60;
  var _s = _seconds mod 60;
  if (_s < 10)
    return string(_m) + ":0" + string(_s);
  else
    return string(_m) + ":" + string(_s);
}

///@function steps_to_timestamp(steps)
function steps_to_timestamp(_steps){
	return seconds_to_timestamp(_steps div game_get_speed(gamespeed_fps));
}
