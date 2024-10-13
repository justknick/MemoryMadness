extends Button


func _on_pressed() -> void:
	if visible == true: 
		SignalManager.on_game_exit_pressed.emit()
		print("exit to main")
