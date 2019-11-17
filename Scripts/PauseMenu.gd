extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var tree = get_tree()

func _on_Button_Resume_pressed():
	var game_mode = tree.get_root().get_node("SceneRoot/DasherGameMode")
	
	# This will also destroy this menu.
	game_mode.set_game_paused(false)


func _on_Button_Options_pressed():
	pass # Replace with function body.


func _on_Button_Quit_pressed():
	pass # Replace with function body.
