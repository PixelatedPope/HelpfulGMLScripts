///@func audio_play_sound_spaced(sound, priority, loop, [min time between in ms], [gain], [offset], [pitch], [_listener_mask])
function audio_play_sound_spaced(_id, _priority, _loops, _min_time_between = 1_000, _gain = undefined, _offset = undefined, _pitch = undefined, _listener_mask = undefined){
  static history = {}
  
  var _lastPlayed = history[$ _id];
  if(_lastPlayed == undefined || current_time - _lastPlayed > _min_time_between){
    history[$ _id] = current_time;
    return audio_play_sound(_id, _priority, _loops, _gain, _offset, _pitch, _listener_mask);
  }
}