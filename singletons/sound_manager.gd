extends AudioStreamPlayer

const BGM_MAIN_MENU = "main"
const BGM_IN_GAME = "game"
const SOUND_SUCCESS = "success"
const SOUND_TILE_SELECT = "tile"
const SOUND_BUTTON_SELECT = "button"
const SOUND_GAMEOVER = "gameover"
const SOUNDS: Dictionary = {
	BGM_MAIN_MENU: preload("res://assets/sounds/bgm_action_3.mp3"), 
	BGM_IN_GAME: preload("res://assets/sounds/bgm_action_4.mp3"), 
	SOUND_SUCCESS: preload("res://assets/sounds/sfx_sounds_fanfare3.wav"), 
	SOUND_TILE_SELECT: preload("res://assets/sounds/sfx_sounds_impact1.wav"), 
	SOUND_BUTTON_SELECT: preload("res://assets/sounds/sfx_sounds_impact7.wav"), 
	SOUND_GAMEOVER: preload("res://assets/sounds/sfx_sounds_powerup12.wav")
}


func play_audio(player: AudioStreamPlayer, key: String) -> void: 
	# if the key isn't in the dictionary, skip
	if SOUNDS.has(key) == false:
		return 
	
	player.stop()
	player.stream = SOUNDS[key]
	player.play()


func play_button_select(player: AudioStreamPlayer) -> void:
	play_audio(player, SOUND_BUTTON_SELECT)


func play_tile_select(player: AudioStreamPlayer) -> void: 
	play_audio(player, SOUND_TILE_SELECT)


func play_tile_success(player: AudioStreamPlayer) -> void: 
	play_audio(player, SOUND_SUCCESS)


func play_gameover(player: AudioStreamPlayer) -> void: 
	play_audio(player, SOUND_GAMEOVER)
