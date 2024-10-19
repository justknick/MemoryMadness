extends Node

class_name Scorer

@onready var reveal_timer: Timer = $RevealTimer

var _selections: Array[MemoryTile] = []
var _target_pairs: int = 0
var _moves_made: int = 0
var _pairs_made: int = 0 


func _ready() -> void:
	SignalManager.on_tile_selected.connect(on_tile_selected)
	SignalManager.on_game_exit_pressed.connect(on_game_exit_pressed)


func clear_new_game(target_pairs: int) -> void: 
	_selections.clear()
	_target_pairs = target_pairs
	_moves_made = 0 
	_pairs_made = 0 


func add_to_selections() -> void: 
	# the selected memory tile will be added here 
	# at the same time, the tiles will be revealed
	# check if selections is length 2
	pass 


func reveal_tile(tile: MemoryTile) -> void:
	tile.reveal(true)
	pass


func hide_tiles() -> void:
	for t in _selections:
		t.hide_on_success()
	_pairs_made += 1
	prints("pairs made: ", _pairs_made)
	# play sound when hiding? 
	pass 


func selections_pair_match() -> bool: 
	#var is_it_a_match: bool = _selections[0].matches_other_tile(_selections[1])
	#var is_it_a_match: bool
	#if _selections.size() > 0: 
		#is_it_a_match = _selections[0].matches_other_tile(_selections[1])
	return _selections[0].matches_other_tile(_selections[1])


func check_pair_made() -> void:
	#print("selection: ", _selections.size())
	# if selection isn't 2, do nothing
	if _selections.size() != 2: 
		return
	# if selection is 2 
	#   send signal to disable click, start cooldown timer
	reveal_timer.start()
	#print("timer starts")
	SignalManager.on_selection_disabled.emit()
	# count number of moves 
	_moves_made += 1
	#   and check if match
	# dev note: I moved this to be done at timeout


func on_tile_selected(tile: MemoryTile) -> void: 
	# the selected memory tile will be added here 
	# scorer will receive the selected memory tile
	_selections.append(tile)
	#print("selections ", _selections)
	# at the same time, the tiles will be revealed
	tile.reveal(true)
	# check if selections is length 2
	check_pair_made()
	# play click sound 
	pass 


func on_game_exit_pressed() -> void: 
	reveal_timer.stop()


func _on_reveal_timer_timeout() -> void:
	#print("timer ends")
	var is_it_a_match = selections_pair_match()
	# if no matches, flip tiles to back 
	if is_it_a_match == false:
		for s in _selections: 
			s.reveal(false)
	elif is_it_a_match == true:
		# we will tween disappearing tiles
		hide_tiles()
	print("selections match? ", is_it_a_match)
	# reset selections
	_selections.clear()
	#print("selections match? ", selections_pair_match())
	# check game over 
	
	# enable click
	SignalManager.on_selection_enabled.emit()


func get_score_pair() -> String:
	return "%2d/%2d" % [_pairs_made, _target_pairs]


func get_score_moves() -> String:
	return str(_moves_made)
