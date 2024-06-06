/// @description camera_matrix_get_properties
/// @param camera

/*returns an array with the following information
0 = Width
1 = Height
2 = Center X
3 = Center Y
4 = Left Bound
5 = Top Bound
*/

var _view_mtx = camera_get_view_mat( argument0 );
var _proj_mtx = camera_get_proj_mat( argument0 );
var _return;
_return[0] = 2/_proj_mtx[0];
_return[1] = 2/_proj_mtx[5];
_return[2] = -_view_mtx[12];
_return[3] = -_view_mtx[13];
_return[4] = _return[2] - _return[0]/2;
_return[5] = _return[3] -_return[1]/2;

return _return;