extends Node

class_name HungerSystem

var max_hunger = 100
var current_hunger = 100
var hunger_decay_rate = 2.0  # Hunger decreases per second
var health_damage_when_starving = 1.0  # Damage per second when hunger = 0

signal hunger_changed(new_hunger)
signal starving  # Emitted when hunger reaches 0

var health_system: HealthSystem

func _ready():
	health_system = get_parent().get_node("HealthSystem")

func _process(delta):
	# Decrease hunger over time
	decay_hunger(delta)
	
	# Deal damage if starving
	if current_hunger <= 0 and health_system:
		health_system.take_damage(health_damage_when_starving * delta)

func decay_hunger(delta: float):
	current_hunger = max(0, current_hunger - (hunger_decay_rate * delta))
	hunger_changed.emit(current_hunger)
	
	if current_hunger <= 0:
		starving.emit()

func eat(food_value: float):
	current_hunger = min(max_hunger, current_hunger + food_value)
	hunger_changed.emit(current_hunger)

func get_hunger_percentage() -> float:
	return float(current_hunger) / float(max_hunger)
