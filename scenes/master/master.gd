extends CanvasLayer

@onready var main_screen: Control = $MainScreen
@onready var game_screen: Control = $GameScreen


func _ready() -> void: 
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_level_selected.connect(on_level_selected)


func display_game(screen: bool) -> void:
	main_screen.visible = !screen
	game_screen.visible = screen


func on_level_selected(_level_num: int) -> void: 
	display_game(true)


func on_game_exit_pressed() -> void: 
	display_game(false)
	
	
