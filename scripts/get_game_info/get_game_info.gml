function get_game_info(){
	var _data = {
		build_date: date_time_string(GM_build_date),	
		build_type: GM_build_type,
		gm_version: GM_version,
		gm_runtime_ver: GM_runtime_version,
		gm_proj_filename: GM_project_filename,
		is_sandboxed: GM_is_sandboxed,
		os_region: os_get_region(),
		os_language: os_get_language(),
		os_config: os_get_config(),
		os_ver: os_version,
		os_typ: os_type,
		os_dev: os_device
	}
}