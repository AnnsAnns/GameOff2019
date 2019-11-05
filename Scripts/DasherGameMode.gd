extends "res://Scripts/GameModeBase.gd"

var _is_game_paused = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func set_game_paused(new_is_game_paused):
	if _is_game_paused == new_is_game_paused:
		return
		
	_is_game_paused = new_is_game_paused
	get_tree().paused = new_is_game_paused

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
