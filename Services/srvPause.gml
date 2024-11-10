function VisiblePauseManager() constructor{
  list = [];
  static preDraw = function(){
    array_foreach(list, function(_x){
      instance_activate_object(_x.id);  
    })    
  }
  
  static guiEnd = function(){
    var _count = array_length(list);
    for(var _i = 0; _i < _count; _i++){
      list[_i].length--;
      if(list[_i].length == 0){
        array_delete(list, _i, 1);
        _i--;
        _count--;
      } else {
        instance_deactivate_object(list[_i].id);  
      }
    }
  }
  
  static pauseObject = function(_id, _length = -1){
    with(_id){
      if(array_find_index(other.list, method({_id, _length}, function(_x){ return _x.id == _id})) != -1) continue;
      array_push(other.list, {id: _id, length: _length});
    }
  }
  
  static unpauseObject = function(_id){
    var _index = array_find_index(list, method({_id}, function(_x){ return _x.id == _id}));
    if(_index == -1) return;
    list[_index].length = 1;
  }
  
  static pauseTag = function(_tags, _length = -1){
    var _objects = tag_get_asset_ids(_tags, asset_object)  
    for(var _i = 0; _i < array_length(_objects); _i++){
      pauseObject(_objects[_i]);
    }
  }
  
  static unpauseTag = function(_tags, _length = -1){
    var _objects = tag_get_asset_ids(_tags, asset_object)  
    for(var _i = 0; _i < array_length(_objects); _i++){
      unpauseObject(_objects[_i]);
    }
  }
}

global.pauseManager = new VisiblePauseManager();