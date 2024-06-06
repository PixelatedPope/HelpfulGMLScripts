function array_3d_set(_arr, _pos, _val){
  if(!array_3d_is_in_bounds(_arr, _pos)) throw("Attempted to set OOB value for 3D Array");
  _arr[_pos[X]][_pos[Y]][_pos[Z]] = _val;
}