function draw_cone(_x1, _y1, _dist, _dir, _angle, _smoothness = 10) {
  _smoothness= max(1,round(_smoothness));

  draw_primitive_begin(pr_trianglefan);
  var _col = draw_get_color();
  var _alpha = draw_get_alpha();
  var _start_angle =_dir-_angle/2;
  var _angle_inc =_angle/_smoothness;

  draw_vertex_colour(_x1,_y1,_col,_alpha);
  for(var _i=_start_angle; _i<=_start_angle+_angle;_i+=_angle_inc)
  {
    draw_vertex_colour(_x1+lengthdir_x(_dist, _i),
                       _y1+lengthdir_y(_dist, _i),
                       _col,_alpha);
  }
  draw_primitive_end();
}
