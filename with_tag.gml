///@func with_tag(tag[s], func)
function with_tag(_tags, _func){
  var _objs = tag_get_asset_ids(_tags, asset_object);
  
  for(var _i = 0; _i < array_length(_objs); _i++){
      _func(_objs[_i])
  }
}