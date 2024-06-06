/// @description Returns the index of the tile at the specified cell within the given tileset.
/// @param tileset_width The width -in pixels- of the base sprite used for the tileset
/// @param tileset_height The height -in pixels- of the base sprite used for the tileset
/// @param tile_width The width -in pixels- of each cell in the tileset.
/// @param tile_height The height -in pixels- of each cell in the tileset.
/// @param x_cell The x position for the desired cell.
/// @param y_cell the y position for the desired cell.

var _tw = argument[2];
var _th = argument[3];
var _w  = argument[0]/_tw;
var _h  = argument[1]/_th;
var _x  = argument[4];
var _y  = argument[5];

if(_x > _w || _y > _h)
	return 0;

return _y*_w+_x;

