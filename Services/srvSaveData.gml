///PRE-ALPHA
///CONCEPT ONLY. UNTESTED

global.data = {
  
}

global.settings = {
  fullscreen: false,
  windowScale: 1,
}

#macro SETTINGS_FILE_NAME "settings.dat"
#macro SETTINGS global.settings
#macro SAVE_FILE_NAME "save.dat"
#macro DATA global.data

function __write_file(_filename, _data){
  var _file = file_text_open_write(_filename)
  file_text_write_string(_file, json_stringify(_data))
  file_text_close(_file);
}

function __load_file(_filename){
  if(!file_exists(_filename)) {
    show_debug_message("File not found")
    return undefined;
  }
  
  var _file = file_text_open_read(_filename)
  var _data = json_parse(file_text_read_string(_file))
  file_text_close(_file);
  return _data;
}

function save_data(_slot = 0){
  __write_file(SAVE_FILE_NAME+string(_slot), global.data);  
}

function load_data(_slot = 0){
  global.data ??= __load_file(SAVE_FILE_NAME+string(_slot));  
}

function write_settings(){
  __write_file(SETTINGS_FILE_NAME, global.settings);  
}

function load_settings(){
  global.settings ??= __load_file(SAVE_FILE_NAME+string(_slot));  
}

load_settings();