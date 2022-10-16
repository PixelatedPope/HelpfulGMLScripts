///@func use_twerp_value(start value)
///@dependencies twerp
function use_twerp_value(_default){
  return {
    current: _default,
    start: _default,
    target: _default,
    length: 1,
    timer: 0,
    twerpType: TwerpType.out_elastic,
    
    set: function(_target, _length, _type = TwerpType.out_elastic) {
      start = current;
      target = _target;  
      length = _length;
      timer = 0;
      twerpType = _type;
    },

    update: function() {
      current = twerp(twerpType,start, target, timer / length);
      if(timer < length)
         timer++
      return current;
    }  
  }
}