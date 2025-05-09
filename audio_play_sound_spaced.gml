///@func audio_play_sound_spaced(sound, priority, loop, [min time between], [gain = 1])
function audio_play_sound_spaced(_id, _priority, _loops, _min_time_between = 100, _gain = 1){
  static history = {}
  
  var _assetName = audio_get_name(_id)
  var _lastPlayed = history[$ _assetName];
  if(_lastPlayed == undefined || current_time - _lastPlayed > _min_time_between){
    history[$ _assetName] = current_time;
    return audio_play_sound(_id, _priority, _loops, _gain);
  }
}