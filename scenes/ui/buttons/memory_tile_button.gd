extends TextureButton
class_name MemoryTile

@onready var tile_frame: TextureRect = $TileFrame
@onready var tile_image: TextureRect = $TileImage

var _item_name: String 
var _can_select_me: bool = true


func _ready() -> void: 
	pass 


func reveal(flag: bool) -> void:
	tile_frame.visible = flag
	tile_image.visible = flag


func setup(image: ItemImage, frame: Texture2D) -> void: 
	tile_frame.texture = frame
	tile_image.texture = image.get_item_texture()
	_item_name = image.get_item_name()
	reveal(false)


func _on_pressed() -> void:
	if _can_select_me == true:
		reveal(true)
