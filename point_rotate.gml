///@func point_rotate(x, y, angle): array[x, y]
//Rotates point by provided angle (in degrees) around 0,0
function point_rotate(_x, _y, _angle) {
  var _angRad = degtorad(_angle);
  var _angCos = cos(_angRad), _angSin = sin(_angRad);

  return [
    _x * _angCos + _y * _angSin,
    _y * _angCos + _x * _angSin
  ]
}