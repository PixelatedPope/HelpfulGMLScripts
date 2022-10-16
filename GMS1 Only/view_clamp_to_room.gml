///view_clamp_to_room(view,<margin>)
var _v=argument[0];
var _m=0;
if(argument_count>1)
  _m=argument[1];

view_xview[_v]=clamp(view_xview[_v],_m,room_width-view_wview[_v]-_m);
view_yview[_v]=clamp(view_yview[_v],_m,room_height-view_hview[_v]-_m);
