extends Node

var _levels: Dictionary = {
	0: LevelData.new(0, 0, 0), 
	1: LevelData.new(1, 2, 2), 
	2: LevelData.new(2, 2, 4),
	3: LevelData.new(3, 3, 4), 
	4: LevelData.new(4, 4, 6), 
	5: LevelData.new(5, 6, 6), 
	6: LevelData.new(6, 6, 7)
}


func _ready() -> void: 
	#SignalManager.on_level_select.connect(on_level_select)
	pass


func get_level(level: int) -> LevelData:
	if not _levels.has(level):
		print("no level found")
		return _levels[0]
	return _levels[level]


func get_level_count() -> int:
	return _levels.keys().size()


func get_level_selection(level_num: int) -> SelectedLevelData:
	var level_data: LevelData = _levels[level_num]
	var selected_level_images: Array[ItemImage] = []
	
	ImageManager.shuffle_images()
	for i in range(level_data.get_target_pairs()): 
		selected_level_images.append(ImageManager.get_image_index(i))
		selected_level_images.append(ImageManager.get_image_index(i))
	
	selected_level_images.shuffle()
	
	return SelectedLevelData.new(level_data.get_target_pairs(), 
		level_data.get_columns(), selected_level_images)
