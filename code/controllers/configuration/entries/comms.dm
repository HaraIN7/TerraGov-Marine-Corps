/datum/config_entry/string/comms_key
	protection = CONFIG_ENTRY_HIDDEN

/datum/config_entry/string/comms_key/ValidateAndSet(str_val)
	return str_val != "default_pwd" && length_char(str_val) > 6 && ..()

/datum/config_entry/keyed_list/cross_server
	key_mode = KEY_MODE_TEXT
	value_mode = VALUE_MODE_TEXT
	protection = CONFIG_ENTRY_LOCKED

/datum/config_entry/keyed_list/cross_server/ValidateAndSet(str_val)
	. = ..()
	if(.)
		var/list/newv = list()
		for(var/I in config_entry_value)
			newv[replacetext_char(I, "+", " ")] = config_entry_value[I]
		config_entry_value = newv

/datum/config_entry/keyed_list/cross_server/ValidateListEntry(key_name, key_value)
	return key_value != "byond:\\address:port" && ..()

/datum/config_entry/string/cross_comms_name
