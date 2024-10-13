extends TextureRect

const SMALL_SCALE: Vector2 = Vector2(0.1, 0.1)
const NORMAL_SCALE: Vector2 = Vector2(1.0, 1.0)
const SPIN_TIME_RANGE: Vector2 = Vector2(1.0, 2.5)
const SCALE_TIME: float = 1.0 


func _ready() -> void:
	# Will get a random texture image to display on main screen 
	set_random_image()
	run_me()


func set_random_image() -> void:
	texture = ImageManager.get_random_item_image().get_item_texture() 


func get_random_spin_time() -> float: 
	return randf_range(SPIN_TIME_RANGE.x, SPIN_TIME_RANGE.y)


func get_random_rotation() -> float: 
	return deg_to_rad(randf_range(-360, 360))


func run_me() -> void: 
	# make tween 
	var tween: Tween = get_tree().create_tween()
	# tween property scale from NORM to SMALL over the SCALE_TIME duration
	tween.tween_property(self, "scale", SMALL_SCALE, SCALE_TIME)
	# afterwards, set random image
	tween.tween_callback(set_random_image)
	# tween property scale from SMALL to NORM 
	tween.tween_property(self, "scale", NORMAL_SCALE, SCALE_TIME)
	# rotate image, random rotate over the RANDOM TIME
	tween.tween_property(self, "rotation", 
		get_random_rotation(), get_random_spin_time())
	# run me, again
	tween.tween_callback(run_me)
	#pass 
	
