///ds_list_append(id,source id)
//adds a to the first ds_list specified with the contents of the second ds_list
var _dest = argument[0];
var _source = argument[1];

for(var _i = 0;_i < ds_list_size(_source);_i++) {
    ds_list_add(_dest, ds_list_find_value(_source, _i));
}
