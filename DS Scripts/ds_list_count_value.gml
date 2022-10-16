///ds_list_count_value(list,value to count)
//removes all instances of a value from a ds_list
var _list = argument[0];
var _val = argument[1];
var _count = 0;

for(var _i = ds_list_size(_list)-1; _i>=0; _i--)
{
  if(_list[| _i] == _val)
  {
    _count ++;
  }      
}
return (_count);
