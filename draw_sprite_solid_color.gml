///@func draw_sprite_solid_color(sprite_index, image_index, x, y, xscale, yscale, angle, color, alpha)
function draw_sprite_solid_color(_spr = sprite_index, _img = image_index, _x = x, _y = y, _xs = image_xscale, _ys = image_yscale, _ang = image_angle, _col = image_blend, _a = image_alpha) {
	gpu_set_fog(true,_col,-16000,16000);
	draw_sprite_ext(_spr,_img,_x,_y,_xs,_ys,_ang,_col,_a);
	gpu_set_fog(false,0,0,0);
}