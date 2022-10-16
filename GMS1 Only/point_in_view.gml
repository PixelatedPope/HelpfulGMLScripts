///point_in_view(x,y,view,<Margin>)
//returns true if the point is in the view.
var _margin=0;
if(argument_count>3)
  _margin=argument[3];
var _x=argument[0];
var _y=argument[1];
var _v=argument[2];
return(point_in_rectangle(_x,_y,
                          view_xview[_v]-_margin,
                          view_yview[_v]-_margin,
                          view_xview[_v]+view_wview[_v]+_margin,
                          view_yview[_v]+view_hview[_v]+_margin));
