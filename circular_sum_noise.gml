///circular_sum_noise
///@param ds_grid
///@param min_radius
///@param max_radius
///@param spacing
///@param {normal}
///Script by RujiK

var grid = argument[0];
var width = ds_grid_width(grid);
var height = ds_grid_height(grid);

//CHANGE THESE VARIABLES FOR DIFFERENT LOOKS!
var rad_min = argument[1]; 
var rad_max = argument[2];
var spacing = argument[3];
var normal = argument_count > 4 ? argument[4] : 255;

var val = 0;
var xx=rad_max;
var yy=rad_max;

while (yy < (height - rad_max)) 
{
  while (xx < (width - rad_max)) 
	{
    val=irandom(255);
    ds_grid_add_disk(grid,xx,yy,random_range(rad_min,rad_max),val);
    xx+=spacing;
  }
  yy+=spacing;
  xx=rad_max;
}

 
//GENERATION DONE! But max value is unknown. Normalize values
var grid_max = (ds_grid_get_max(grid,rad_max*2,rad_max*2,width - rad_max*2,height - rad_max*2) + 1);
var grid_min =  ds_grid_get_min(grid,rad_max*2,rad_max*2,width - rad_max*2,height - rad_max*2);

xx=0;
yy=0;

while yy < height 
{ // loop through grid and set range from to 0 - normal (normal is set above)
  while xx < width 
	{
    val = floor((ds_grid_get(grid,xx,yy)- grid_min) * normal / (grid_max - grid_min));
    ds_grid_set(grid,xx,yy,max(val,0));
    xx+=1;
  }
  yy+=1;
  xx=0;
}