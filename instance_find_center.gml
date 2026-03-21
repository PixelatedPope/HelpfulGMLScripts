function instance_find_center(_inst){
	return {
		x: mean(_inst.bbox_right, _inst.bbox_left),
		y: mean(_inst.bbox_top, _inst.bbox_bottom),
	}
}