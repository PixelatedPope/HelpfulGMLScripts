///ds_grid_get_adjacent_count(grid, x, y, number,is 8 dir <options>);
//return the number cells above, below, left and right that match the given number.
//If "is 4 dir" is set to true, will only check cardinal directions.
//Otherwise, will check diagonal connections as well.

var _grid=argument[0];
var _x=argument[1];
var _y=argument[2];
var _num=argument[3];
var _8dir=false;
if(argument_count>4)
    _8dir=argument[4];

var _count=0;
for(var _i=0;_i<3+4*_8dir;_i++)
{
    var _xx=_x+lengthdir_x(1,_i*90-45*_8dir);
    var _yy=_y+lengthdir_y(1,_i*90*_8dir);
    if(ds_grid_in_bounds(_grid,_xx,_yy))
    {
        var _val=_grid[# _xx,_yy];
        if(_val == _num)
            _count++;
    }
}
return(_count);
