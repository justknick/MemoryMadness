extends TextureButton
class_name MemoryTile

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var tile_frame: TextureRect = $TileFrame
@onready var tile_image: TextureRect = $TileImage
@onready var memory_tile_button: MemoryTile = $"."

var _item_name: String 
var _can_select_me: bool = true


func _ready() -> void: 
	SignalManager.on_selection_enabled.connect(on_selection_enabled)
	SignalManager.on_selection_disabled.connect(on_selection_disabled)


func setup(image: ItemImage, frame: Texture2D) -> void: 
	tile_frame.texture = frame
	tile_image.texture = image.get_item_texture()
	_item_name = image.get_item_name()
	reveal(false)


func reveal(flag: bool) -> void:
	tile_frame.visible = flag
	tile_image.visible = flag
	# update: reveal now being done at Scorer


func matches_other_tile(other: MemoryTile) -> bool: 
	#print("my name: ", _item_name)
	#print("other name: ", other.get_item_name())
	#var is_it_a_match: bool = other != self && other.get_item_name() == _item_name
	#print("matches other tile: ", is_it_a_match)
	#return is_it_a_match
	return other != self && other.get_item_name() == _item_name


func get_item_name() -> String: 
	return _item_name


func hide_on_success() -> void:
	# bring the index to the front 
	z_index = 1 
	# we are scaling to 0 instead of removing
	#scale = Vector2.ZERO
	var tween: Tween = get_tree().create_tween()
	tween.set_parallel(true)
	tween.tween_property(self, "disabled", true, 0)
	tween.tween_property(self, "rotation_degrees", 720, 0.5)
	tween.tween_property(self, "scale", Vector2(1.4, 1.4), 0.5)
	tween.set_parallel(false)
	tween.tween_interval(0.6)
	tween.tween_property(self, "scale", Vector2.ZERO, 0.1)


func on_selection_enabled() -> void:
	_can_select_me = true 


func on_selection_disabled() -> void: 
	# disable selection
	_can_select_me = false


func _on_pressed() -> void:
	if _can_select_me == true && tile_frame.visible == false:
		SignalManager.on_tile_selected.emit(self)
		SoundManager.play_tile_select(audio_stream_player)
