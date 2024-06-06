/// @description cubic_bezier(start,end,position,x1,y1,x2,y2)
/// @function cubic_bezier
/// @param start
/// @param end
/// @param position
/// @param x1
/// @param y1
/// @param x2
/// @param y2
var eps = math_get_epsilon();
math_set_epsilon(.000000000000001);

var pos=clamp(argument2,0,1);;
var p0,p1,p2,p3;
p0=0;
p1=clamp(argument3,0,1);
p2=clamp(argument5,0,1);
p3=1;

// Determine t
var t;
if (pos == 0) 
  t=0;
else if (pos == 1) 
  t=1; 
else 
{ // Calculate t
  var a = -p0 + 3 * p1 - 3 * p2 + p3;
  var b = 3 * p0 - 6 * p1 + 3 * p2;
  var c = -3 * p0 + 3 * p1;
  var d = p0 - pos;
  var temp = solve_cubic(a,b,c,d);
  if(temp == noone)
  {
    math_set_epsilon(eps);
    return noone;
  }
  else
    t = temp;
}

// Calculate y from t
p1=argument4;
p2=argument6;
var u=1-t;
var result= u*u*u * p0
    + 3 * t * u*u * p1
    + 3 * t*t * u * p2
    + t*t*t * p3;

math_set_epsilon(eps);
return lerp(argument0,argument1,result);

