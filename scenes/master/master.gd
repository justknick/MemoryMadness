extends CanvasLayer

@onready var main_screen: Control = $MainScreen
@onready var game_screen: Control = $GameScreen
@onready var player: AudioStreamPlayer = $AudioStreamPlayer


func _ready() -> void: 
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)
	SignalManager.on_level_selected.connect(on_level_selected)
	SignalManager.on_gameover.connect(on_gameover)
	on_play_main_bgm()


func display_game(screen: bool) -> void:
	main_screen.visible = !screen
	game_screen.visible = screen


func on_level_selected(_level_num: int) -> void: 
	display_game(true)
	SoundManager.play_audio(player, "game")


func on_game_exit_pressed() -> void: 
	display_game(false)
	on_play_main_bgm()


func on_play_main_bgm() -> void:
	SoundManager.play_audio(player, "main")


func on_gameover(_moves: int) -> void: 
	#SoundManager.play_audio(player, "gameover")
	#player.stop()
	pass
