/// @description draw_text_transformed_gpu
/// @param x
/// @param y
/// @param string
/// @param xscale
/// @param yscale
/// @param angle
/// Translated from GMS1 by Kirill Zolovkin

var _x=argument[0];
var _y=argument[1];
var _str=argument[2];
var _xscale=argument[3];
var _yscale=argument[4];
var _angle=argument[5];

var _mtx = matrix_build(_x,_y,0,0,0,_angle,_xscale,_yscale,1);
matrix_set(matrix_world,_mtx);
draw_text(0,0,_str);
matrix_set(matrix_world,matrix_build_identity());