extends Node

const FRAME_IMAGES: Array[Texture2D] = [
	preload("res://assets/frames/blue_frame.png"),
	preload("res://assets/frames/green_frame.png"),
	preload("res://assets/frames/red_frame.png"),
	preload("res://assets/frames/yellow_frame.png")
]

var _item_images: Array[ItemImage] = []


func _ready() -> void: 
	var image_resource: ImageFileList = load("res://resource/image_file_list.tres")
	for file_path_name in image_resource.get_file_path_names(): 
		#print(file_path_name)
		add_filename_to_list(file_path_name)


func add_filename_to_list(file_path: String) -> void: 
	if file_path == null: 
		print("no file_path value exist")
	var new_item_image: ItemImage = ItemImage.new(
		#get filename from file path 
		 file_path.get_file(),
		load(file_path)
	)
	_item_images.append(new_item_image)


func get_random_item_image() -> ItemImage:
	return _item_images.pick_random()


func get_random_frame_image() -> Texture2D:
	return FRAME_IMAGES.pick_random()


func get_image_index(index: int) -> ItemImage:
	if index == null:
		print("no index supplied")
	return _item_images[index]


func shuffle_images() -> void: 
	_item_images.shuffle()
