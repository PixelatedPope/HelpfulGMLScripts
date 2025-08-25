///@func use_blur()
///@dependencies: shdRadialBlur, shdMotionBlur, twerp
function use_blur(){
  return {
    uIntensity: shader_get_uniform(shdRadialBlur, "u_fIntensity"),
    uPosition: shader_get_uniform(shdMotionBlur, "pos"),
    intensity: 0,
    shader: shdRadialBlur,
    start: 0,
    length: 1,
    timer: 0,
    dir: 0,

    startRadial: function(_amount, _length){
      shader = shdRadialBlur;
      start = _amount;
      length = _length;
      timer = 0;
    },

    startMotion: function(_amount, _length, _dir) {
      shader = shdMotionBlur;
      start = _amount;
      length = _length;
      dir = _dir;
      timer = 0;
    },
  
    setShader: function(){
      intensity = twerp(TwerpType.inout_elastic,start , 0, timer / length);
	
      if(timer < length)
        timer++ 
      var _x = lengthdir_x(intensity, dir);
      var _y = lengthdir_y(intensity, dir);

      shader_set(shader);

      if (shader == shdRadialBlur)
      	shader_set_uniform_f(uIntensity, intensity);
      else
      	shader_set_uniform_f(uPosition, _x, _y);
    }
  }
}