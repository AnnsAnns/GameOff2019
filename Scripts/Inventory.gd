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
			
		inventory[item_to_add] = {"item": item_to_add, "quantity": quantity}
		emit_signal("on_items_changed")


func has_item(item_to_check, min_quantity=1):
	"""Check whether the inventory has the specified item.
	
	:param item_to_check: (string) Name of item to check.
	
	:param quantity: (int) Require at least this many items.
	By default only a single instance is required.
	
	:return: (bool) Whether inventory holds this item.
	"""
	
	# Check if key exists.
	if inventory.has(item_to_check):
		return inventory[item_to_check] >= min_quantity
	return false


func remove_item(item_to_remove, quantity=null):
	"""Remove the specified item from the inventory.
	
	:param item_to_remove: (string) Name of item to remove.
	
	:param quantity: (int) How much to remove. If omitted, all
	instances of the item will removed.
	"""
	
	
	if quantity == null:
		# Remove all instances of item_to_remove.
		quantity = -9999999
	
	elif quantity == 0:
		# If quantity is specified and is zero, do NOTHING!
		return
	
	else:
		# Adding a negative quantity is the same as removing.
		quantity = -quantity
	
	add_item(item_to_remove, quantity)


func print_contents():
	print("Printing inventory...")
	for item in inventory.values():
		print("   item: " + str(item))
	print("End of inventory")
