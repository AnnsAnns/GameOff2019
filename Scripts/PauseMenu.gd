extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_Resume_pressed():
	var tree = get_tree()
	# This is very temperamental and should not be used.
	var game_mode = tree.get_root().get_node("SceneRoot/DasherGameMode")
	
	# This will also destroy this menu.
	game_mode.set_game_paused(false)
	


func _on_Button_Options_pressed():
	pass # Replace with function body.


func _on_Button_Quit_pressed():
	pass # Replace with function body.
