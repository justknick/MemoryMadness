extends Control

@onready var moves_value: Label = %MovesValue
@onready var timer: Timer = $Timer
@onready var audio_stream_player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void:
	hide()
	z_index = 2
	SignalManager.on_gameover.connect(on_gameover)


func on_gameover(moves: int) -> void:
	print("gameover screen displays")
	moves_value.text = str(moves)
	#show()
	timer.start()


func _on_exit_button_pressed() -> void:
	hide()
	#audio_stream_player.stop()


func _on_timer_timeout() -> void:
	show()
	SoundManager.play_audio(audio_stream_player, "gameover")
