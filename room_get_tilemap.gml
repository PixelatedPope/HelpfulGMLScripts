function room_get_tilemap(_room, _layer_name, _live = false) {
	var _data = room_get_info(_room, false,false,true,true,true,_live)

	var _index = array_find_index(_data.layers, method({_layer_name}, function(_x){ return _x.name == _layer_name}))
	if(_index == -1) return undefined;
	
	return _data.layers[_index].elements[0];
}