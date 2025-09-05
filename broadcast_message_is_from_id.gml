//@func broadcast_message_is_from_id([id])
//Only usable in Broadcast Message event.
//Defaults to asking if message is from calling instance
function broadcast_message_is_from_id(_id = id){
  return layer_instance_get_instance(event_data[? "element_id"]) == _id;
}