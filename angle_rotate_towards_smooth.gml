/// @func angle_rotate_towards_smooth(start, end, amount)
function angle_rotate_towards_smooth(a, b, i) {
    var angle = a + angle_difference(b, a);
    return lerp(a, angle, i);
}
