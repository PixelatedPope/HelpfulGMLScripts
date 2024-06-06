var a = argument0;
var b = argument1;
var c = argument2;
var d = argument3;

if (a == 0) 
  return solve_quadratic(b, c, d);
if (d == 0) 
{
  show_debug_message("d == 0");
  return 0;
}
b /= a;
c /= a;
d /= a;
var q = (3.0 * c - (b*b)) / 9.0;
var r = (-27.0 * d + b * (9.0 * c - 2.0 * (b * b))) / 54.0;
var disc = q*q*q + r*r;
var term1 = b / 3.0;

if (disc > 0) 
{
  var s = r + sqrt(disc);
  if(s<0)
    s=-power(-s,1/3);
  else
    s=power(s,1/3);
  
  var t = r - sqrt(disc);
  if(t<0)
    t = -power(-t,1/3);
  else
    t = power(t,1/3);
  
  var result = -term1 + s + t;
  if (result >= 0 && result <= 1) 
    return result;
} 
else if (disc == 0) 
{
  var r13 
  if(r<0)
    r13 = -power(-r,1/3);
  else
    r13 = power(r,1/3);

  var result = -term1 + 2.0 * r13;
  if (result >= 0 && result <= 1) 
    return result;

  result = -(r13 + term1);
  if (result >= 0 && result <= 1) 
    return result;
} 
else 
{
  q = -q;
  var dum1 = q * q * q;
  dum1 = arccos(r / sqrt(dum1));
  var r13 = 2.0 * sqrt(q);

  var result = -term1 + r13 * cos(dum1 / 3.0);
  if (result >= 0 && result <= 1) 
    return result;

  result = -term1 + r13 *cos((dum1 + 2.0 * pi) / 3.0);
  if (result >= 0 && result <= 1) 
    return result;

  result = -term1 + r13 * cos((dum1 + 4.0 * pi) / 3.0);
  if (result >= 0 && result <= 1) 
    return result;
}

show_debug_message("Disc:" +string(disc));
return noone;

