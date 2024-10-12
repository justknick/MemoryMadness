class_name SelectedLevelData

var _selected_level_images: Array[ItemImage]
var _target_pairs: int = 0 
var _num_column: int = 0


func _init(target_pairs: int, num_col: int, 
		selected_level_image: Array[ItemImage]) -> void:
	_target_pairs = target_pairs
	_num_column = num_col
	_selected_level_images = selected_level_image


func get_selected_level_images() -> Array[ItemImage]:
	return _selected_level_images


func get_target_pairs() -> int: 
	return _target_pairs


func get_num_columns() -> int:
	return _num_column
