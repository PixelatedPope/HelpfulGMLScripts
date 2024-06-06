/// @func collision_line_point(x1, y1, x2, y2, obj, prec, notme)
//By YellowAfterLife
function collision_line_point(x1, y1, x2, y2, obj, prec, notme){
  var rr, rx, ry;
  rr = collision_line(x1, y1, x2, y2, obj, prec, notme);
  rx = x2;
  ry = y2;
  if (rr != noone) {
      var p0 = 0;
      var p1 = 1;
      repeat (ceil(log2(point_distance(x1, y1, x2, y2))) + 1) {
          var np = p0 + (p1 - p0) * 0.5;
          var nx = x1 + (x2 - x1) * np;
          var ny = y1 + (y2 - y1) * np;
          var px = x1 + (x2 - x1) * p0;
          var py = y1 + (y2 - y1) * p0;
          var nr = collision_line(px, py, nx, ny, obj, prec, notme);
          if (nr != noone) {
              rr = nr;
              rx = nx;
              ry = ny;
              p1 = np;
          } else p0 = np;
      }
  }
  var r;
  r[0] = rr;
  r[1] = rx;
  r[2] = ry;
  return r;
}