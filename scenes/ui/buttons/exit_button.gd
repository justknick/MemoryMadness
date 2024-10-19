extends TextureButton

@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _on_pressed() -> void:
	if visible == true: 
		SignalManager.on_game_exit_pressed.emit()
		SoundManager.play_button_select(audio_stream_player)
		print("exit to main")
