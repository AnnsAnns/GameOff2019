extends "res://Scripts/GameModeBase.gd"

export var pause_menu_class = ""

var _is_game_paused = false

## Reference to pause menu UI node, if it exists.
var pause_menu

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	
func set_game_paused(new_is_game_paused):
	if _is_game_paused == new_is_game_paused:
		return
	
	_is_game_paused = new_is_game_paused
	
	if new_is_game_paused:
		# We now paused the game.
		# Create the pause menu.
		
		pause_menu = load(pause_menu_class).instance()
		canvas.add_child(pause_menu)
		
	else:
		# We are now unpausing.
		# Destroy the pause menu if it still exists.
		
		if is_instance_valid(pause_menu):
			pause_menu.hide()
			canvas.remove_child(pause_menu)
			pause_menu.queue_free()
	
	# Pause/unpause actual game logic.
	get_tree().paused = new_is_game_paused
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
