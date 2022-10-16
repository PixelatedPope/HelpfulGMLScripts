///is_between(value,bound a,bound b,[or equal to])
function is_between(_x, _bound_a, _bound_b, _equal_to = false) {
    var _left = min(_bound_a, _bound_b);
    var _right = max(_bound_a, _bound_b);
    return !_equal_to ? (_left < _x && _x < _right) : (_left <= _x && _x <= _right);
}