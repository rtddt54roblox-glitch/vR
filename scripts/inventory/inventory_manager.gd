extends Node

class_name InventoryManager

var inventory = {}
var max_items = 20
var current_item_count = 0

signal item_added(item_name, quantity)
signal item_removed(item_name, quantity)
signal inventory_full

func _ready():
	pass

func add_item(item_name: String, quantity: int = 1) -> bool:
	if current_item_count + quantity > max_items:
		inventory_full.emit()
		return false
	
	if item_name not in inventory:
		inventory[item_name] = 0
	
	inventory[item_name] += quantity
	current_item_count += quantity
	item_added.emit(item_name, quantity)
	
	return true

func remove_item(item_name: String, quantity: int = 1) -> bool:
	if item_name not in inventory or inventory[item_name] < quantity:
		return false
	
	inventory[item_name] -= quantity
	current_item_count -= quantity
	
	if inventory[item_name] <= 0:
		inventory.erase(item_name)
	
	item_removed.emit(item_name, quantity)
	return true

func get_item_count(item_name: String) -> int:
	return inventory.get(item_name, 0)

func get_inventory() -> Dictionary:
	return inventory.duplicate()
