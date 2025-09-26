///@func draw_sprite_3d([sprite_index], [image_index], [x], [y], [image_xscale], [image_yscale], [x_angle], [y_angle], [z_angle], [image_blend], [image_alpha])
///DEPENDENCIES: matrix_combine(), matrix_build_scale(), matrix_build_rotation(), matrix_build_translation()
///WARNING: this is SLOW. 90 times slower than draw_sprite_ext!!!! Use very sparingly. 
///More Warnings: This won't really work with shaders. You'd probably have to modify it to return the surface, and then draw that surface with your shader.
///Ultimately, I don't really recommend using it, but feel free to learn from it.
function draw_sprite_3d(_sprite_index = sprite_index, _image_index = image_index, _x = x, _y = y, _image_xscale = image_xscale, _image_yscale = image_yscale, _image_x_angle = 0, _image_y_angle = 0, _image_z_angle = image_angle, _image_blend = image_blend, _image_alpha = image_alpha){
  //Requires you to be using view 0;
  static __surfaces = ds_map_create();
  static __threeDee = camera_create();
  
  static __surface_scale = 2;
  
  static __ratio = .866; //Do not change
  static __fov = 60; //Do not change
  static __magic_number = 1024;  //Do not change
 
  var _surf = __surfaces[? _sprite_index]
  var _w = sprite_get_width(_sprite_index) * __surface_scale;
  var _h = sprite_get_height(_sprite_index) * __surface_scale;
  if(_surf == undefined || !surface_exists(_surf)){
    _surf = surface_create(_w, _h);
  }
  
  surface_set_target(_surf);
  draw_clear_alpha(0,0);
  
  var _distance_from_screen = _h * __ratio; //why height instead of width? *shrug* It works, though.

  var _threedee_projection = matrix_build_projection_perspective_fov(__fov, -(_w / _h), 0, __magic_number);
  var _threedee_view = matrix_build_lookat(_w / 2, _h / 2, _distance_from_screen, _w / 2, _h / 2, 0, 0, 1, 0);
  
  camera_set_proj_mat(__threeDee, _threedee_projection);
  camera_set_view_mat(__threeDee, _threedee_view);
  camera_apply(__threeDee);
  
  var _xoff = sprite_get_xoffset(_sprite_index)
  var _yoff = sprite_get_yoffset(_sprite_index)
  
  var _scale = matrix_build_scale(_image_xscale, _image_yscale, 0);
  var _rotate1 = matrix_build_rotation(0, 0, _image_z_angle);
  var _rotate = matrix_build_rotation(-_image_x_angle, _image_y_angle, 0)
  var _pos = matrix_build_translation( _w / 2, _h / 2, 0);
  
  matrix_set(matrix_world, matrix_combine(_scale, _rotate1, _rotate, _pos))
  draw_sprite_ext(_sprite_index, _image_index, 0, 0, 1, 1, 0 , _image_blend, 1)
  matrix_set(matrix_world, matrix_build_identity()); 
  
  surface_reset_target();
  
  draw_surface_ext(_surf, _x - _w/2, _y - _h / 2, 1, 1, 0, c_white, _image_alpha);
  __surfaces[? _sprite_index] = _surf;
}