#macro EVENTS global.events
global.events = {};

///@func event_add_listener(EventListener)
function event_add_listener(_listener) {
  var _list = EVENTS[$ _listener];
  if(_list == undefined) {
    _list = [];
    EVENTS[$ _listener.type] = _list;
  }
  array_push(_list, _listener);
  array_sort(_list, function(_a, _b){return _a.priority < _b.priority});
  
  return _listener;
}

///@func event_remove_listener(existing EventListerner instance)
function event_remove_listener(_listener) {
  var _list = EVENTS[$ _listener.type];
  for(var _i = 0; _i < array_length(_list); _i++) {
    if(_list[_i] != _listener) continue;
    
    array_delete(_list, _i, 1);
    return;
  }
}

///@func event_raise(EventType, [data = undefined])
function event_raise(_type, _data = undefined) {
  var _list = EVENTS[$ _type];
  for(var _i = 0; _i < array_length(_list); _i++) {
    var _listener = _list[_i];
    var _instExists = instance_exists(_listener.owner);
    if(_instExists)
      _listener.callback(_data);
    if(!_instExists || _listener.onlyOnce) {
      array_delete(_list, _i, 1); 
      _i--;
    }
  }
}

///@func EventListener(callback, _type, [onlyOnce = false], [priority = 0], [owner = other.id])
function EventListener(_callback, _type, _onlyOnce = false, _priority = 0, _owner = other.id) constructor {
  type = _type;
  owner = _owner;
  callback = _callback;
  onlyOnce = _onlyOnce;
  priority = _priority;
}

function EventGameLoaded(_callback): EventListener(_callback, EventGameLoaded) constructor{}
function EventLocationChanged(_callback): EventListener(_callback, EventGameLoaded) constructor{}
function EventLanderReturned(_callback): EventListener(_callback, EventLanderReturned) constructor{}
function EventLeftSystem(_callback): EventListener(_callback, EventLeftSystem) constructor{}
function EventEnteredSystem(_callback): EventListener(_callback, EventEnteredSystem) constructor{}