//animated_tile_enable_all()
//Disables all tile animation.  
with(Animated_Tile_Controller)
{
    for(var _i=0; _i<ds_grid_height(animated_tiles);_i++)
        animated_tiles[# Tiles.is_playing,_i]=true;
}
