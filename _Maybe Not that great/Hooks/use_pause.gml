///@func use_pause()
function use_pause(){
  return {
    __iOwner: id,
    __isPaused: false,
    __iTimer: 0,
    __iPrevImageSpeed: undefined,
    
    getIsPaused: function() {
      return __iTimer != 0;  
    },

    update: function() {
      var _prev = __iTimer;
      __iTimer -= (__iTimer > 0);
      if(_prev == 1 && __iTimer == 0) 
        __iEnd();
    	return getIsPaused();
    },

    set: function(_amount) {
      __iTimer = _amount;  
      if(_amount > 0 || _amount == -1) {
        __iStart();
      } else if(__iIsPaused) {
        __iEnd();
      }
    },

    __iStart: function() {
      __iIsPaused = true;
    	if(__iPrevImageSpeed == undefined)
    		__iPrevImageSpeed = __iOwner.image_speed;
      __iOwner.image_speed = 0;
    },

    __iEnd: function() {
      __iIsPaused = false;
      __iOwner.image_speed = __iPrevImageSpeed;
    	__iPrevImageSpeed = undefined;
    }
  }
}