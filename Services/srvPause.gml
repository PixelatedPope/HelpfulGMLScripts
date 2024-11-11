function VisiblePauseManager() constructor{
  __iPausedIds = [];
  static preDraw = function(){
    array_foreach(__iPausedIds, function(_paused){
      instance_activate_object(_paused.id);  
    })    
  }
  
  static guiEnd = function(){
    var _count = array_length(__iPausedIds);
    for(var _i = 0; _i < _count; _i++){
      __iPausedIds[_i].length--;
      if(__iPausedIds[_i].length == 0){
        array_delete(__iPausedIds, _i, 1);
        _i--;
        _count--;
      } else {
        instance_deactivate_object(__iPausedIds[_i].id);  
      }
    }
  }
  
  static pauseObject = function(_id, _length = -1){
    with(_id){
      if(array_find_index(other.__iPausedIds, method({_id, _length}, function(_paused){ return _paused.id == _id})) != -1) continue;
      array_push(other.__iPausedIds, {id: _id, length: _length});
    }
  }
  
  static unpauseObject = function(_id){
    var _index = array_find_index(__iPausedIds, method({_id}, function(_paused){ return _paused.id == _id}));
    if(_index == -1) return;
    __iPausedIds[_index].length = 1;
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