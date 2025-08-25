//REQUIRED SCRIPTS
//sin_oscillate
//approach

//@func Shake()
function Shake() constructor {
  dir = 0;
  frequency = .1;
  amp = 0;
  falloff = 1;
  startTime = get_timer();
  x = 0;
  y = 0;
  
  start = function(_dir, _amp, _falloff = 1, _frequency = .1) {
    dir = _dir;
    frequency = _frequency;
    amp = _amp;
    falloff = _falloff;
    startTime = get_timer();
  }

  update = function(){
    if(amp == 0) return {x: 0, y: 0}; 
    var _amp = sin_oscillate(-amp, amp, frequency)
    x = lengthdir_x(_amp, dir);
    y = lengthdir_y(_amp, dir);
    amp = approach(amp, 0, falloff);
  }  
}