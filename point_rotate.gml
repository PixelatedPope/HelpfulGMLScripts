///point_rotate(x, y, angle): array[x, y]
//Rotates point by provided angle (in degrees)

//Getting cos/sin of the angle
var ang_rad = degtorad(-argument2);
var ang_cos = cos(ang_rad), ang_sin = sin(ang_rad);

//Rotating the point
var result;
result[1] = argument0 * ang_sin + argument1 * ang_cos;
result[0] = argument0 * ang_cos - argument1 * ang_sin;

return result;
