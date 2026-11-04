///@function json_load(filename)
///Written by TabularElf
function json_load(_filename) {
  // We load in the file
  var _buff = buffer_load(_filename);
  // We get the json from the buffer
  var _json = buffer_read(_buff, buffer_text);
  // We free the buffer, since we don't need it now. As we've extracted the whole string
  buffer_delete(_buff);
  // We convert the json into a struct
  var _struct = json_parse(_json);
  // We then return it as a handle
  return _struct;
}