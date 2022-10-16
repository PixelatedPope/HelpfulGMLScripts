///ds_list_add_list(list, source)
//Adds all the values from the source list to the target list.
var _tar=argument[0];
var _source=argument[1];
for(var _i=0; _i<ds_list_size(_source);_i++)
{
  ds_list_add(_tar,_source[| _i]);
}
