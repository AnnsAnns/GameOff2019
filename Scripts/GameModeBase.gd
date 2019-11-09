extends Node

export var hud_class = ""

## Called when the game has been saved successfully.
signal on_save_game_complete


## Reference to node that shows UI nodes.
var canvas

## Reference to node that shows HUD.
var hud

# Called when the node enters the scene tree for the first time.
func _ready():
	canvas = Control.new()
	get_tree().get_root().add_child(canvas)
	
	# Create HUD object
	hud = load(hud_class).instance()
	canvas.add_child(hud)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func save_game(slot_name):
	"""Write the game state to a file.
	
	:param slot_name: (String) Name of the save game slot to
	load from.
	"""
	# TODO: Add implementation, test with an inventory.
	pass
	
	# Copied from Godot docs:
	# https://docs.godotengine.org/en/3.1/tutorials/io/saving_games.html
#	var save_game = File.new()
#	save_game.open("user://savegame.save", File.WRITE)
#	var save_nodes = get_tree().get_nodes_in_group("Persist")
#	for i in save_nodes:
#		var node_data = i.call("save");
#		save_game.store_line(to_json(node_data))
#	save_game.close()
