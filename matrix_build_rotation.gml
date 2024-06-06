///@func matrix_build_rotation(x, y, z)
function matrix_build_rotation(_x, _y, _z){
  return matrix_build(0,0,0,_x,_y,_z,1,1,1);
}