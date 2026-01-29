///@func lines_intersect(x1,y1,x2,y2,x3,y3,x4,y4,segment)
//
//  Returns a vector multiplier (t) for an intersection on the
//  first line. A value of (0 < t <= 1) indicates an intersection 
//  within the line segment, a value of 0 indicates no intersection, 
//  other values indicate an intersection beyond the endpoints.
//
//      x1,y1,x2,y2     1st line segment
//      x3,y3,x4,y4     2nd line segment
//      segment         If true, confine the test to the line segments.
//
//  By substituting the return value (t) into the parametric form
//  of the first line, the point of intersection can be determined.
//  eg. x = x1 + t * (x2 - x1)
//      y = y1 + t * (y2 - y1)
//
/// GMLscripts.com/license
function lines_intersect(_x1,_y1,_x2,_y2,_x3,_y3,_x4,_y4,_segment){
    var ua, ub, ud, ux, uy, vx, vy, wx, wy;
    ua = 0;
    ux = _x2 - _x1;
    uy = _y2 - _y1;
    vx = _x4 - _x3;
    vy = _y4 - _y3;
    wx = _x1 - _x3;
    wy = _y1 - _y3;
    ud = vy * ux - vx * uy;
    if (ud != 0) 
    {
        ua = (vx * wy - vy * wx) / ud;
        if (_segment) 
        {
            ub = (ux * wy - uy * wx) / ud;
            if (ua < 0 || ua > 1 || ub < 0 || ub > 1) ua = 0;
        }
    }
    return ua;
}
