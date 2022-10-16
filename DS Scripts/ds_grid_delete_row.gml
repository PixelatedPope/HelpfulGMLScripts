///ds_grid_delete_row(grid index, row)
//Returns a copy of the grid with the given row removed.  
//Destroys the original grid.  So stop using it.

var grid = argument0;
var row = argument1;
var grid_width=ds_grid_width(grid);
var grid_height=ds_grid_height(grid);

if(row>ds_grid_height(grid)-1)
{
    return(grid);
    show_debug_message("You tried to delete a row from a grid that didn't exist");
}

if(ds_grid_height(grid)>1)
{   //More than one row in the grid
    var tempgrid=ds_grid_create(ds_grid_width(grid),ds_grid_height(grid));
    ds_grid_copy(tempgrid,grid);
    ds_grid_destroy(grid);
    ds_grid_set_region(tempgrid,0,row,ds_grid_width(tempgrid)-1,row,0);
        
    ds_grid_set_grid_region(tempgrid, tempgrid, 0, row+1, grid_width-1, grid_height-1, 0,row);

    ds_grid_resize(tempgrid,grid_width,grid_height-1);
    return tempgrid;
}
else
    return ds_grid_create(ds_grid_width(grid),0);    
