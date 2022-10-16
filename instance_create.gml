///@func instance_create(object)
function instance_create(_obj){
  return instance_create_depth(0, 0, 0, _obj);
}