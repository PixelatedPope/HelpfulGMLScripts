function instance_find_center(_inst){
	return {
		x: (_inst.bbox_right + _inst.bbox_left) / 2,
		y: (_inst.bbox_top + _inst.bbox_bottom) / 2,
	}
}