///@param matrix1
///@param matrix2
///@param <matrix3>
///@param <matrix...>


var _m = matrix_multiply(argument[0],argument[1])
for(var _i=2; _i<argument_count; _i++)
{
	_m = matrix_multiply(_m,argument[_i]);
}
return _m;