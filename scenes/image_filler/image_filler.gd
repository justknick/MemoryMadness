@tool
# the above will tell Godot to run this in the editor
extends Node2D

const PATH: String = "res://assets/glitch/"


func _ready() -> void: 
	var dir: DirAccess = DirAccess.open(PATH) 
	var image_file_list: ImageFileList = ImageFileList.new()
	
	if not dir == null: 
		var files: PackedStringArray = dir.get_files() 
		
		for file in files:
			#print(file)
			image_file_list.add_filename(PATH + file)
	ResourceSaver.save(image_file_list, "res://resource/image_file_list.tres") 
	print("ImageFiller completed")
