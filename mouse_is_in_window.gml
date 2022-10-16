///mouse_is_in_window
return point_in_rectangle(display_mouse_get_x(),
                          display_mouse_get_y(),
                          window_get_x(),
                          window_get_y(),
                          window_get_x()+window_get_width(),
                          window_get_y()+window_get_height());