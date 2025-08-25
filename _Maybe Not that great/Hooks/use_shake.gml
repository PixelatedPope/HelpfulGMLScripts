///@func use_shake()
///@dependencies: approach, sin_oscillate
function use_shake(){
  return {
    dir: 0,
    frequency: .1,
    amp: 0,
    falloff: 1,
    startTime: get_timer(),
    
    ///@func screenShake(dir,amp,[falloff], [frequency])
    start: function(_dir, _amp, _falloff = 1, _frequency = .1) {
    	dir = _dir;
    	frequency = _frequency;
    	amp = _amp;
    	falloff = _falloff;
    	startTime = get_timer();
    },

    update: function(){
    	if(amp == 0) return {x: 0, y: 0}; 
    	var _amp = sin_oscillate(-amp, amp, frequency)
    	var _x = lengthdir_x(_amp, dir);
    	var _y = lengthdir_y(_amp, dir);
    	amp = approach(amp, 0, falloff);
      return {x: _x, y: _y}
    }  
  }
}