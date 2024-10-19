extends Control

@onready var moves_value: Label = %MovesValue


func _ready() -> void:
	hide()
	z_index = 2
	SignalManager.on_gameover.connect(on_gameover)


func on_gameover(moves: int) -> void:
	print("gameover screen displays")
	moves_value.text = str(moves)
	show()


func _on_exit_button_pressed() -> void:
	hide()
