for (var i = 0; i < bounties_num; i++) {
    var _surf = bounties[i].cage.surface
	if surface_exists(_surf){
        surface_free(_surf)
    }
}

surface_free(bounty_info.surface)

if buffer_exists(bounty_info.buffer)
    buffer_delete(bounty_info.buffer)