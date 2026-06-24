extends Node

class_name HealthSystem

var max_health = 100
var current_health = 100
var regeneration_rate = 0.1  # Health per second
var is_alive = true

signal health_changed(new_health)
signal health_depleted

func _ready():
	pass

func _process(delta):
	if is_alive and current_health < max_health:
		increase_health(regeneration_rate * delta)

func take_damage(amount: float):
	current_health = max(0, current_health - amount)
	health_changed.emit(current_health)
	
	if current_health <= 0:
		is_alive = false
		health_depleted.emit()

func heal(amount: float):
	current_health = min(max_health, current_health + amount)
	health_changed.emit(current_health)

func increase_health(amount: float):
	current_health = min(max_health, current_health + amount)

func get_health_percentage() -> float:
	return float(current_health) / float(max_health)
