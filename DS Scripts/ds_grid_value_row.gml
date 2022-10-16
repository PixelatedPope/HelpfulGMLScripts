///ds_grid_value_row(grid,column,value)
//Returns the row number where the value was found.  
//If multiple exist, the first one found will be returned.
//Returns noone if not found.
var _grid=argument[0];
var _column=argument[1];
var _val=argument[2];

if(ds_grid_value_exists(_grid,_column,0,_column,ds_grid_height(_grid)-1,_val))
  return(ds_grid_value_y(_grid,_column,0,_column,ds_grid_height(_grid)-1,_val));
else
  return(noone);
