/// @description ds_grid_sort_row(_grid, row, ascending?)
/// @param {real} grid
/// @param {real} row
/// @param {bool} ascending?

var _grid = argument0;
var _row = argument1;
var _dir = argument2;

ds_grid_change_orientation(_grid);
ds_grid_sort(_grid,_row,_dir);
ds_grid_change_orientation(_grid);