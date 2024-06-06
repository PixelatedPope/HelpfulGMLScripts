function array_2d_is_in_bounds(_arr, _pos){
  return _pos[X] >= 0 && _pos[X] < array_length(_arr) &&
         _pos[Y] >= 0 && _pos[Y] < array_length(_arr[0])
}
