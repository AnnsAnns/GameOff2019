extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var tree = get_tree()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button_LoadScene_pressed():
	tree.change_scene("res://Scenes/maps/test.tscn")


func _on_Button_Pause_pressed():
	var game_mode = tree.get_root().get_node("SceneRoot/DasherGameMode")
	game_mode.set_game_paused(not tree.paused)
