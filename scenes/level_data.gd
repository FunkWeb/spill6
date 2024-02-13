extends Node


@export var levels_cleared = [1,2,5,7]

func save():
	var save_dict = {
		"filename" : get_scene_file_path(),
		"parent" : get_parent().get_path(),
		"name":"LevelData",
		"levels_cleared":levels_cleared
	}
	return save_dict
