extends "res://Scripts/GameModeBase.gd"

export var pause_menu_class = ""

## Pre-loaded pause menu scene for less resource loading.
var _pause_menu_resource

## Reference to pause menu UI node, if it exists.
var pause_menu

onready var tree = get_tree()

# Called when the node enters the scene tree for the first time.
func _ready():
	# Preload resource.
	_pause_menu_resource = load(pause_menu_class)
	
func set_game_paused(new_is_game_paused):
	var was_paused = get_tree().paused
	
	if was_paused == new_is_game_paused:
		return
	
	if new_is_game_paused:
		# We now paused the game.
		
		# Create the pause menu.
		pause_menu = _pause_menu_resource.instance()
		canvas.add_child(pause_menu)
		
		# Hide the game HUD.
		hud.hide()
	
	else:
		# We are now unpausing.
		# Destroy the pause menu if it still exists.
		
		if is_instance_valid(pause_menu):
			pause_menu.hide()
			canvas.remove_child(pause_menu)
			pause_menu.queue_free()
		
		# Show the game HUD again.
		hud.show()
	
	# Pause/unpause actual game logic.
	get_tree().paused = new_is_game_paused

func _process(delta):
	if Input.is_action_pressed("ui_cancel") and $Cooldown.time_left == 0: # Save resources by first checking ui_cancel
		set_game_paused(not tree.paused)
		$Cooldown.start()