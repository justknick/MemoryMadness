extends Control

@export var memory_tile: PackedScene 

@onready var tiles_container: GridContainer = $HBoxContainer/TileContainer/TilesContainer


func _ready() -> void: 
	SignalManager.on_level_selected.connect(on_level_selected)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)


func tile_builder(image: ItemImage, frame: Texture2D) -> void: 
	var new_tile = memory_tile.instantiate()
	tiles_container.add_child(new_tile)
	new_tile.setup(image, frame)


func on_level_selected(level_number: int) -> void: 
	var selected_level_data: SelectedLevelData = \
		GameManager.get_level_selection(level_number)
	var frame: Texture2D = ImageManager.get_random_frame_image()
	
	tiles_container.columns = selected_level_data.get_num_columns()
	
	for image in selected_level_data.get_selected_level_images():
		tile_builder(image, frame)


func on_game_exit_pressed() -> void: 
	for tile in tiles_container.get_children():
		tile.queue_free()
