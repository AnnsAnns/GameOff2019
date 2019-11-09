extends Node

var my_inventory
var message_box
var entry_item_name

# Called when the node enters the scene tree for the first time.
func _ready():
	my_inventory = $"../InventoryComponent"
	message_box = $"../QuickMenu/VBoxContainer/LabelMessage"
	entry_item_name = $"../QuickMenu/VBoxContainer/HBoxContainer2/EntryItemName"
	
	message_box.text = ""


func _on_ButtonAdd_pressed():
	var item_to_add = entry_item_name.text
	my_inventory.add_item(item_to_add)
	message_box.text = "Added 1x " + item_to_add + " to inventory"


func _on_ButtonHas_pressed():
	var item_to_check = entry_item_name.text
	var has_item = my_inventory.has_item(item_to_check)
	message_box.text = item_to_check + " is " + \
		("" if has_item else "not ") + "in inventory"


func _on_ButtonRemove_pressed():
	var item_to_remove = entry_item_name.text
	my_inventory.remove_item(item_to_remove, 1)
	message_box.text = "Removed 1x " + item_to_remove + " from inventory"
