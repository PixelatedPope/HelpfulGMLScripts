function array_2d_get(_arr, _pos){
  if(!array_2d_is_in_bounds(_arr, _pos)) return EMPTY;

  return _arr[_pos[X]][_pos[Y]];
}