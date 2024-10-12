class_name LevelData

@export var _level_number: int = 0
@export var _rows: int = 0
@export var _columns: int = 0 


func _init(level_num: int, row: int, column: int) -> void:
	_level_number = level_num
	_rows = row
	_columns = column


func get_rows() -> int: 
	return _rows


func get_columns() -> int: 
	return _columns


func get_level_number() -> int:
	return _level_number


func get_target_pairs() -> int:
	return int((_rows * _columns) / 2)


func get_number_of_tiles() -> int: 
	return _rows * _columns
