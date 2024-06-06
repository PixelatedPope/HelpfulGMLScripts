#macro JUKEBOX global.__jukebox
JUKEBOX = {
  duckVolumeFactor: .25, 
  priority: 100,
  volume: .75,
  
  queue: [],
  queuePosition: 0,
  queueCrossfadeLength: 2000,
  currentSong: noone,
  
  isDucked: false,
  currentVolume: 1,
  timeSource: noone,
  debugView: undefined
}

///@function jukebox_change_settings([volume],[duckVolumeFactor],[songPriority])
function jukebox_change_settings(_volume = undefined, _duckVol = undefined, _priority = undefined){
  if(_volume != undefined && _volume != JUKEBOX.volume){
    JUKEBOX.volume = clamp(_volume, 0, 1);
    __jukebox_internal_update_volume();
  }
  if(_duckVol != undefined){
    JUKEBOX.duckVolumeFactor = _duckVol;
    __jukebox_internal_update_volume();
  }
  if(_priority != undefined) JUKEBOX.priority = _priority;  
}

///@function jukebox_play_song(song, [fadeIn = 0ms], [fadeOut = 0ms], [crossfade = false])
function jukebox_play_song(_song, _fadeIn = 0, _fadeOut = 0, _cross = false){
  if(!audio_is_playing(JUKEBOX.currentSong)){
    __jukebox_internal_play(_song, _fadeIn);
    return;
  }
  
  if(audio_is_playing(_song)) return;
  
  if(_cross){
    __jukebox_internal_stop(_fadeOut);
    __jukebox_internal_play(_song, _fadeIn);
  } else {
    __jukebox_internal_stop(_fadeOut, method({_song, _fadeIn}, function(){ __jukebox_internal_play(_song, _fadeIn); }))
  }
}

///@function jukebox_stop_song([fadeOut = 0]);
function jukebox_stop_song(_fadeOut = 0) {
    __jukebox_internal_stop(_fadeOut);
    JUKEBOX.currentSong = noone;
}

///@function jukebox_toggle_duck([lengthMs = 0])
function jukebox_toggle_duck(_length = 0){
  JUKEBOX.isDucked = !JUKEBOX.isDucked;
  audio_sound_gain(JUKEBOX.currentSong, JUKEBOX.volume * (JUKEBOX.isDucked ? JUKEBOX.duckVolumeFactor : 1), _length);
  JUKEBOX.currentVolume = JUKEBOX.volume * (JUKEBOX.isDucked ? JUKEBOX.duckVolumeFactor : 1);
}

///@function jukebox_queue(song array, [clearQueue = false], [startNow = true])
function jukebox_queue(_songs, _clear = false, _startNow = true){
  if(_clear) jukebox_queue_clear();

  array_foreach(_songs, function(_x){
    array_push(JUKEBOX.queue, _x); 
  })

  if(_startNow){
    JUKEBOX.queuePosition = 0;
    __jukebox_internal_start();
  }
}

///@function jukebox_queue_start([track])
function jukebox_queue_start(_pos = JUKEBOX.queuePosition){
  JUKEBOX.queuePosition = clamp(_pos, 0, array_length(JUKEBOX.queue));
  __jukebox_internal_start();
}

///@function jukebox_queue_clear()
function jukebox_queue_clear(){
  JUKEBOX.queue = [];
  JUKEBOX.queuePosition = 0;
}

///@function jukebox_play_next()
function jukebox_play_next(){
  if(time_source_exists(JUKEBOX.timeSource))
    time_source_destroy(JUKEBOX.timeSource);
  JUKEBOX.queuePosition++;
  if(JUKEBOX.queuePosition >= array_length(JUKEBOX.queue))
    JUKEBOX.queuePosition = 0;
  __jukebox_internal_start();
}

///@function jukebox_play_previous()
function jukebox_play_previous(){
  if(time_source_exists(JUKEBOX.timeSource))
    time_source_destroy(JUKEBOX.timeSource);
  JUKEBOX.queuePosition--;
  if(JUKEBOX.queuePosition < 0)
    JUKEBOX.queuePosition = array_length(JUKEBOX.queue)-1;
  __jukebox_internal_start();
}

///@function jukebox_toggle_pause()
function jukebox_toggle_pause(){
  if(audio_is_paused(JUKEBOX.currentSong)){
    audio_resume_sound(JUKEBOX.currentSong);
    if(time_source_exists(JUKEBOX.timeSource)) time_source_resume(JUKEBOX.timeSource);
  } else {
    audio_pause_sound(JUKEBOX.currentSong); 
    if(time_source_exists(JUKEBOX.timeSource)) time_source_pause(JUKEBOX.timeSource);  
  }
}

///@func jukebox_debug(songArray)
function jukebox_debug(_songs){
  call_later(1, time_source_units_seconds, method({_songs}, function(){__jukebox_internal_debug(_songs)}), true);
}

///@func jukebox_queue_debug()
function jukebox_queue_debug(){
  call_later(1, time_source_units_seconds, function(){__jukebox_internal_queue_debug()}, true);
}

function __jukebox_internal_update_volume(){
  JUKEBOX.currentVolume = JUKEBOX.volume * (JUKEBOX.isDucked ? JUKEBOX.duckVolumeFactor : 1);
  if(!audio_is_playing(JUKEBOX.currentSong)) return;
  audio_sound_gain(JUKEBOX.currentSong, JUKEBOX.currentVolume, 0);
}

function __jukebox_internal_play(_song, _fadeIn, _loop = true){
  var _bgm = audio_play_sound(_song, JUKEBOX.priority, _loop, _fadeIn == 0 ? JUKEBOX.currentVolume : 0);
  if(_fadeIn != 0)
    audio_sound_gain(_bgm, JUKEBOX.currentVolume, _fadeIn);
  JUKEBOX.currentSong = _bgm;
}

function __jukebox_internal_stop(_fadeOut, _onStop = function(){}){
  if(!audio_is_playing(JUKEBOX.currentSong)) return;
  audio_sound_gain(JUKEBOX.currentSong, 0, _fadeOut);
  if(_fadeOut <=0){
    audio_stop_sound(JUKEBOX.currentSong);
    _onStop();
    return;
  }
  
  call_later(
    _fadeOut/1000, 
    time_source_units_seconds, 
    method({oldSong: JUKEBOX.currentSong, _onStop}, function(){
      audio_stop_sound(oldSong)
      _onStop();
    }))
}

function __jukebox_internal_start(){
  if(array_length(JUKEBOX.queue) == 0) return;
  if(audio_is_playing(JUKEBOX.currentSong))
    __jukebox_internal_stop(JUKEBOX.queueCrossfadeLength)
  
  __jukebox_internal_play(JUKEBOX.queue[ JUKEBOX.queuePosition], JUKEBOX.queueCrossfadeLength);
  var _length = audio_sound_length(JUKEBOX.currentSong);
  JUKEBOX.timeSource = time_source_create(time_source_global, _length, time_source_units_seconds, __jukebox_internal_on_song_end);
  time_source_start(JUKEBOX.timeSource);
}

function __jukebox_internal_on_song_end(){
  jukebox_play_next();
}

function __jukebox_internal_seconds_to_time(_seconds){
  _seconds = round(_seconds);
  var _m = _seconds div 60;
  var _s = _seconds mod 60;
  return string("{0}:{1}{2}", _m, _s < 10 ? "0" : "", _s);
}

function __jukebox_internal_debug_volume_controls(){
  var _size = 20;
  dbg_text("Volume")
  dbg_same_line()
  dbg_button("-", function(){ jukebox_change_settings(JUKEBOX.volume - .05) }, _size, _size);
  dbg_same_line()
  dbg_text(string(round(JUKEBOX.volume * 100)));
  dbg_same_line()
  dbg_button("+", function(){ jukebox_change_settings(JUKEBOX.volume + .05) }, _size, _size)
}

function __jukebox_internal_debug(_songs){
  if(JUKEBOX.debugView != undefined)
    dbg_view_delete(JUKEBOX.debugView);
    
  JUKEBOX.debugView = dbg_view("Jukebox", true,20,100,600);
  var _isPlaying = audio_is_playing(JUKEBOX.currentSong);
  
  dbg_section(_isPlaying 
    ? string("Currently Playing: {0}  ---  {1} / {2}", 
      audio_get_name(JUKEBOX.currentSong),
      __jukebox_internal_seconds_to_time(audio_sound_get_track_position(JUKEBOX.currentSong)),
      __jukebox_internal_seconds_to_time(audio_sound_length(JUKEBOX.currentSong)))
    : "Currently Playing: --- 0:00 / 0:00");
  __jukebox_internal_debug_volume_controls()
  if(_isPlaying){
    dbg_button(audio_is_paused(JUKEBOX.currentSong) ? "Resume" : "Pause", function(){ 
      jukebox_toggle_pause() 
    });
    dbg_same_line()
    dbg_button("Stop", function(){ 
      jukebox_stop_song(); 
    });
    dbg_same_line()
    dbg_button(JUKEBOX.isDucked ? "Unduck" : "Duck", function(){ 
      jukebox_toggle_duck(500); 
    });
  }
  dbg_section("Basic");
  array_foreach(_songs, method({_songs}, function(_x, _i){
    dbg_button(audio_get_name(_x), method({_x}, function(){  jukebox_play_song(_x, 0, 1000); }))
    if(_i != array_length(_songs)-1)
      dbg_same_line();
  }))

  dbg_section("Cross Fade");
    array_foreach(_songs, method({_songs}, function(_x, _i){
    dbg_button(audio_get_name(_x), method({_x}, function(){  jukebox_play_song(_x, 2000, 2000, true); }))
    if(_i != array_length(_songs)-1)
      dbg_same_line();
  }))
}

function __jukebox_internal_queue_debug(){
  if(JUKEBOX.debugView != undefined)
    dbg_view_delete(JUKEBOX.debugView);
    
  JUKEBOX.debugView = dbg_view("Jukebox", true,20,100,600);
  
  dbg_section(string("Currently Playing: {0}  ---  {1} / {2}", 
    audio_get_name(JUKEBOX.queue[JUKEBOX.queuePosition]),
    __jukebox_internal_seconds_to_time(audio_sound_get_track_position(JUKEBOX.currentSong)),
    __jukebox_internal_seconds_to_time(audio_sound_length(JUKEBOX.currentSong))));
  
  __jukebox_internal_debug_volume_controls()
  
  dbg_button("Next",function(){ 
    jukebox_play_next() 
  });
  dbg_same_line()
  dbg_button("Prev",function(){ 
    jukebox_play_previous() 
  });
  dbg_same_line()
  dbg_button(audio_is_paused(JUKEBOX.currentSong) ? "Resume" : "Pause", function(){ 
    jukebox_toggle_pause() 
  });
  dbg_same_line()
    dbg_button(JUKEBOX.isDucked ? "Unduck" : "Duck", function(){ 
      jukebox_toggle_duck(500); 
    });
  
  dbg_section("Playlist");
  array_foreach(JUKEBOX.queue, function(_x, _index){
    dbg_text(string("    {0}: {1} {2}", _index+1, audio_get_name(_x), _index == JUKEBOX.queuePosition ? " < NOW PLAYING": ""));  
  });  
}
