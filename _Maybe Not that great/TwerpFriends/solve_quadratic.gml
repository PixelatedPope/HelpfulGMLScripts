var a=argument0;
var b=argument1;
var c=argument2;

var result = (-b + sqrt((b*b) - 4 * a * c)) / (2 * a);
if (result >= 0 && result <= 1) 
  return result;

result = (-b - sqrt((b * b) - 4 * a * c)) / (2 * a);
if (result >= 0 && result <= 1) 
  return result;

show_debug_message("quadratic returning -4");
return noone;
