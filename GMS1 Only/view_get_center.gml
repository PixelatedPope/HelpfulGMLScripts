///view_get_center(view index)
//returns a vect2 with the coordinates of the center of the view.
var _v=argument[0];
return(vect2(floor(view_xview[_v]+view_wview[_v]/2),view_yview[_v]+view_hview[_v]/2));
