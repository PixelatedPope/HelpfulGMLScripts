///ds_list_create_number_list(count)
//Returns a list made up of numbers from 0 to count-1.
var _list=ds_list_create();
for(var _i=0; _i<argument[0]; _i++)
  ds_list_add(_list,_i);
return(_list);
