/// logf(text, args...)
var text = argument[0];

for(var i = 1;i < argument_count;i ++) {
    text = string_replace(text, "%"+string(i), string(argument[i]));
}

return text;
