function array_3d_get(_arr, _pos){
  if(!array_3d_is_in_bounds(_arr, _pos)) return EMPTY;

  return _arr[_pos[X]][_pos[Y]][_pos[Z]];
}