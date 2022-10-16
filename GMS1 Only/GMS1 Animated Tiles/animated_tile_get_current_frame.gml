//returns the current frame for the animated tileset.
//Much like image_index for an animating sprite, this is increased by your animation speed every step.  
//So it could be 1.3 or it could be 389281.2.
return(animated_tiles[#Tiles.current_frame,argument[0]]);
