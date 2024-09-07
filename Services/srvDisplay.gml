///PRE-ALPHA
///CONCEPT ONLY. UNTESTED
global.display = {
  window: {
    width: DISP_W,
    height: DISP_H,
    refresh: call_later(5, time_source_units_frames, function(){
      if(DISP_W == DISP_W_PREV && DISP_H == DISP_H_PREV) return;
  
      DISP_W_PREV= DISP_W;
      DISP_H_PREV = DISP_H;
  
      show_message("Window resized");
    }, true)
  }
}

#macro DISP_W display_get_width()
#macro DISP_H display_get_height()
#macro WIN_W window_get_width()
#macro WIN_H window_get_height()

#macro VIEW view_camera[0]
#macro VIEW_X camera_get_view_x(VIEW)
#macro VIEW_Y camera_get_view_y(VIEW)
#macro VIEW_W camera_get_view_width(VIEW)
#macro VIEW_H camera_get_view_height(VIEW)
#macro VIEW_R (VIEW_X + VIEW_W)
#macro VIEW_B (VIEW_Y + VIEW_H)
#macro VIEW_CENTER_X (VIEW_X + VIEW_W/2)
#macro VIEW_CENTER_Y (VIEW_Y + VIEW_H/2)

#macro GUI_W display_get_gui_width()
#macro GUI_H display_get_gui_height()

#macro DISP_W_PREV global.display.window.width
#macro DISP_H_PREV global.display.window.height