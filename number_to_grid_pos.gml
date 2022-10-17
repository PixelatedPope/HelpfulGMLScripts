///@func number_to_grid_pos(num, width)
function number_to_grid_pos(_num, _width){
    var _y = _num div  _width;
    var _x = _num - (_y * _width);
    return {x: _x, y: _y};
}