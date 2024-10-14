function merge_struct(_target, _struct, _overwrite = false){
  struct_foreach(_struct, method({_target}, function(_name, _value){
    if(!_overwrite && _target[$ _name] != undefined) return;
    _target[$ _name] = _value;
  }))
}