///@func array_duplicate(src)
function array_duplicate(_arr){
  return json_parse(json_stringify(_arr));
}