///@func matrix_combine(matrix1, matrix2, ...);
function matrix_combine(){ 
  var _m = matrix_multiply(argument[0],argument[1])
  for(var _i=2; _i<argument_count; _i++) {
  	_m = matrix_multiply(_m,argument[_i]);
  }
  return _m;
}