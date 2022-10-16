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