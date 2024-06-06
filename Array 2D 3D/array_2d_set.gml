function array_2d_set(_arr, _pos, _val){
  if(!array_2d_is_in_bounds(_arr, _pos)) throw("Attempted to set OOB value for 2D Array");
  _arr[_pos[X]][_pos[Y]] = _val;
}