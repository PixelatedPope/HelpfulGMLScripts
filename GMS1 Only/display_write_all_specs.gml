///display_write_all_specs(x,y);
var _str="Display: "+string(display_get_width())+" x "+string(display_get_height())+" ("+string(display_get_width()/display_get_height())+")";
_str+="#Window: "+string(window_get_width())+" x "+string(window_get_height())+" ("+string(window_get_width()/window_get_height())+")";
_str+="#GUI: "+string(display_get_gui_width())+" x "+string(display_get_gui_height())+" ("+string(display_get_gui_width()/display_get_gui_height())+")";
_str+="#App Surface: "+string(surface_get_width(application_surface))+" x "+string(surface_get_height(application_surface))+" ("+string(surface_get_width(application_surface)/surface_get_height(application_surface))+")";
_str+="#View: "+string(view_wview)+" x "+string(view_hview)+" ("+string(view_wview/view_hview)+")";
draw_text(argument0,argument1,_str);