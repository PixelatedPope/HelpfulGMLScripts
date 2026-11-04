///@function json_save(_struct, filename)
///Written by TabularElf
function json_save(_struct, _filename) {
  // We stringify the struct itself into JSON formatting
  var _json = json_stringify(_struct);
  // We get the size of our stringified struct, in raw bytes
  var _size = string_byte_length(_json);
  // We create a buffer to store our string
  var _buff = buffer_create(_size, buffer_fixed, 1);
  // We write to our buffer with the whole string
  buffer_write(_buff, buffer_text, _json);
  // We then save it
  buffer_save(_buff, _filename);
  // And just a bit of a cleanup, by freeing the buffer!
  buffer_delete(_buff);
}