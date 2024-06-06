///collision_point_line_to_rectangle(l-x1, l-y1, l-x2, l-y2, r-x1, r-y1, r-x2, r-y2) 
//Returns a vector with the x and y position of the collision between the given line and the given rectangle.
//If no intersection is found, will not return an array 
//(so check to see if an array is returned before working with the result.
var _x1 = argument[0];
var _y1 = argument[1];
var _x2 = argument[2];
var _y2 = argument[3];
var _x3 = argument[4];
var _y3 = argument[5];
var _x4 = argument[6];
var _y4 = argument[7];

var _point;
//Top Edge
_point = line_intersect_point(_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y3);
if(is_array(_point))
  return(_point);

//Left Edge
_point = line_intersect_point(_x1,_y1,_x2,_y2,_x3,_y3,_x3,_y4);
if(is_array(_point))
  return(_point);
//Right Edge
_point = line_intersect_point(_x1,_y1,_x2,_y2,_x4,_y3,_x4,_y4);
if(is_array(_point))
  return(_point);
//Bottom Edge
_point = line_intersect_point(_x1,_y1,_x2,_y2,_x3,_y4,_x4,_y4);
if(is_array(_point))
  return(_point);

return noone;
