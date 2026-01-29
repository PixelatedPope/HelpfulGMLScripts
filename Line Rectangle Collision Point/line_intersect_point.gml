///@func line_intersect_point(x1,y1,x2,y2,x3,y3,x4,y4)
//Returns an array with the x and y position for the intersection point.
function line_intersect_point(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4){
	var _t = lines_intersect(_x1, _y1, _x2, _y2, _x3, _y3, _x4, _y4, true);
	if(_t > 0 && _t <=1) {
	  var _point;
	  _point[0]= _x1 + _t * (_x2 - _x1);
	  _point[1]=_y1 + _t * (_y2 - _y1);
  
	  return _point;
	} else {
	  return noone;
	}
}
