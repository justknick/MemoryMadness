extends TextureButton

@export var level_number: int = 0

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var level_label: Label = %LevelLabel


func _ready() -> void:
	load_level_data()


func load_level_data() -> void:
	var level_data: LevelData = GameManager.get_level(level_number)
	level_label.text = "%d x %d" % [
		level_data.get_rows(), 
		level_data.get_columns()
	]


func _on_pressed() -> void:
	if visible == true:
		SignalManager.on_level_selected.emit(level_number)
		SoundManager.play_button_select(audio_stream_player)
		print("selected level ", level_number)
