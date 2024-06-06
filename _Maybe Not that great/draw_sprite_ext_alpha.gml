/// @description draw_sprite_ext_alpha
/// by DifferentName
/// @param sprite
/// @param subimg
/// @param x
/// @param y
/// @param xscale
/// @param yscale
/// @param rot
/// @param col
/// @param alpha
var _blendMode=gpu_get_blendmode_ext();
gpu_set_colorwriteenable(true, true, true, false);
draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
gpu_set_colorwriteenable(false, false, false, true);
gpu_set_blendmode_ext(bm_one, bm_inv_src_alpha);
draw_sprite_ext(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8);
gpu_set_blendmode_ext(_blendMode[0], _blendMode[1]);
gpu_set_colorwriteenable(1,1,1,1);
