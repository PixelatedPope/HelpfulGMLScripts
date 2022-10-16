#define draw_text_transformed_d3d
///draw_text_transformed_d3d(x,y,string,xscale,yscale,angle)

var _x=argument[0];
var _y=argument[1];
var _str=argument[2];
var _xscale=argument[3];
var _yscale=argument[4];
var _angle=argument[5];

d3d_transform_set_scaling(_xscale,_yscale,1);
d3d_transform_add_rotation_z(_angle);
d3d_transform_add_translation(_x,_y,0);
draw_text(0,0,_str);
d3d_transform_set_identity();


