extends Node

## Called when contents of inventory changed.
signal on_items_changed
# To invoke: emit_signal("on_items_changed")

## Dictionary of ingredient list item structs hashed by their ingredient type.
var inventory = {}

var count setget , _get_count
func _get_count():
	return len(inventory)


func add_item(item_to_add, quantity):
	"""Add an item to the inventory.
	
	:param item_to_add: (string) Name of item to add.
	
	:param quantity: (int) Number of items to add.	
	"""
	
	# Inventory will not change if no items to add.
	if quantity == 0:
		return
	
	# Add new quantity to exising key if possible.
	if inventory.has(item_to_add):
		var ingr_item = inventory[item_to_add]
		ingr_item["quantity"] += quantity
		
		# Remove from inventory if has invalid quantity.
		if ingr_item["quantity"] <= 0:
			inventory.erase(item_to_add)
		
		# Propogate back to dictionary
		else:
			inventory[item_to_add] = ingr_item
		
		emit_signal("on_items_changed")
	
	# Otherwise add new inventory item.
	else:
		# Don't create new slot for negative quantity.
		if quantity <= 0:
			return
			
		inventory[item_to_add] = {"quantity": quantity}
		emit_signal("on_items_changed")


func has_item(item_to_check, min_quantity=1):
	"""Check whether the inventory has the specified item.
	
	:param item_to_check: (string) Name of item to check.
	
	:param quantity: (int) Require at least this many items.
	
	:return: (bool) Whether inventory holds this item.
	"""
	
	# Check if key exists.
	if inventory.has(item_to_check):
		return inventory[item_to_check] >= min_quantity
	return false
