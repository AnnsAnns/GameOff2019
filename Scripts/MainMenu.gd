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


func _on_Button_Start_pressed():
	get_tree().change_scene("res://Scenes/maps/Level1.tscn")


func _on_Button_Options_pressed():
	pass # Replace with function body.


func _on_Button_Credits_pressed():
	pass # Replace with function body.


func _on_Button_Quit_pressed():
	get_tree().quit()
