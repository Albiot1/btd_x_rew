///@desc Checks if selected struct has specific name and creates it and sets the default value if not
function save_value_check(_struct,_value_name,_default){
	if !variable_struct_exists(_struct,_value_name){
		variable_struct_set(_struct,_value_name,_default)	
	}
}