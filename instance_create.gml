///@func instance_create(object, [struct = {}])
function instance_create(_obj, _struct = {}){
  return instance_create_depth(0, 0, 0, _obj, _struct);
}