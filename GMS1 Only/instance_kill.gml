///instance_kill(id)
///***No longer necessary on 1.4.9999 as instance_destroy now takes an id argument****
//destroys target instance and returns "noone"
instance_activate_object(argument[0])
with(argument[0])
        instance_destroy();
return(noone);   
