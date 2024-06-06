///@func instance_place_array(x, y, object, [ordered = false]) {
function instance_place_array(_x, _y, _obj, _ordered = false) {
  var _list = ds_list_create();
  instance_place_list(_x, _y, _obj, _list, _ordered);
  var _arr = [];
  
  for(var _i = 0; _i < ds_list_size(_list); _i++)
    array_push(_arr, _list[| _i]);  

  ds_list_destroy(_list);
  return _arr;
}