///ds_grid_draw(grid,x,y,headers list <noone to omit>,Show Row Numbers, Starting Row <0 by default>, Row Count <-1 for all>)
//Draws the content of the grid as a table.
//Not the most efficient script: USE ONLY FOR DEBUGGING!

var _grid = argument[0];
var _x = argument[1];
var _y = argument[2];
var _headers=argument[3];
var _show_row_numbers=argument[4];
var _start_row=clamp(argument[5],0,ds_grid_height(_grid)-1);
var _max_count;
if(argument[6]<0)
  _max_count=ds_grid_height(_grid);
else
  _max_count=clamp(argument[6],1,ds_grid_height(_grid)-1);

if(ds_grid_height(_grid)-_start_row < _max_count)
{
  _start_row=ds_grid_height(_grid)-_max_count;
}


var _padding = 5;
var _spacer = "| ";

var _header_height=0;

var _column_widths, _row_heights;

//Get column widths
//init column_widths and row_heights array
for (var _xx = 0; _xx < ds_grid_width(_grid); _xx++)
{
  _column_widths[_xx] = 0;
}
for (var _yy = 0; _yy < ds_grid_height(_grid); _yy++)
{
  _row_heights[_yy] = 0;
}

//Find max column widths and max row heights
var _cw = 0;
var _ch = 15;
for (var _xx = 0; _xx < ds_grid_width(_grid); _xx++)
{
  for (var _yy = 0; _yy < ds_grid_height(_grid); _yy++)
  {
    _cw = string_width(_spacer + string(ds_grid_get(_grid, _xx, _yy)));
    _ch = string_height(string(ds_grid_get(_grid, _xx, _yy)));
    if (_cw > _column_widths[_xx])
      _column_widths[_xx] = _cw;
    if (_ch > _row_heights[_yy])
    {
      _row_heights[_yy] = _ch;
    }
  }
}

if(_headers != noone)
{ //Add Column Headers
  for(var _i=0; _i<ds_list_size(_headers);_i++)
  {
    var _txt = _headers[| _i];
    var _w = string_width(_spacer+_txt);
    var _h = string_height(_txt);
    if(_w > _column_widths[_i])
      _column_widths[_i]=_w;
    if(_h > _header_height)
      _header_height=_h;
  }
}

//Actually Draw the grid;
draw_set_valign(fa_top);
draw_set_halign(fa_left);
var _y_orig=_y;
for(var _xx=0; _xx<ds_grid_width(_grid);_xx++)
{
  _y=_y_orig;
  if(_headers != noone)
  {
    draw_text(_x,_y, "| " +string(_headers[| _xx]));
    draw_line(_x+3,_y+_header_height-2,_x+_column_widths[_xx]+10,_y+_header_height-2);
    _y += _header_height;
  }
  

  for(var _yy=_start_row;_yy<_start_row+_max_count;_yy++)
  {
    if(_xx==0 && _show_row_numbers)
    {
      draw_set_halign(fa_right);
      draw_text(_x-5,_y,string(_yy));
      draw_set_halign(fa_left);
    }
    draw_text(_x, _y, "| " + string(ds_grid_get(_grid, _xx, _yy)));
    _y += _row_heights[_yy];
  }

  _x += _column_widths[_xx] + _padding;
}


