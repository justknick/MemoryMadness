extends Resource

class_name ImageFileList

@export var file_path_names: Array[String]


func add_filename(filename: String) -> void: 
	# do not add .import files into the list
	# learning - optionally, we can have it only add .png files 
	if !'.import' in filename:
		file_path_names.append(filename)
		print("adding ", filename, " to file_path_names")


func get_file_path_names() -> Array[String]: 
	return file_path_names
