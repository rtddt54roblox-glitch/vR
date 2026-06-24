extends Node

class_name StaminaSystem

var max_stamina = 100
var current_stamina = 100
var regeneration_rate = 10.0  # Stamina per second when resting
var sprint_drain_rate = 20.0  # Stamina per second when sprinting
var is_sprinting = false

signal stamina_changed(new_stamina)
signal stamina_depleted

func _ready():
	pass

func _process(delta):
	if is_sprinting:
		drain_stamina(sprint_drain_rate * delta)
	else:
		regenerate_stamina(regeneration_rate * delta)

func drain_stamina(amount: float):
	current_stamina = max(0, current_stamina - amount)
	stamina_changed.emit(current_stamina)
	
	if current_stamina <= 0:
		is_sprinting = false
		stamina_depleted.emit()

func regenerate_stamina(amount: float):
	current_stamina = min(max_stamina, current_stamina + amount)
	stamina_changed.emit(current_stamina)

func set_sprinting(sprinting: bool):
	is_sprinting = sprinting

func get_stamina_percentage() -> float:
	return float(current_stamina) / float(max_stamina)
