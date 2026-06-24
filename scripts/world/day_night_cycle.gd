extends Node3D

class_name DayNightCycle

var cycle_duration = 1200.0  # 20 minutes for full day/night cycle
var current_time = 0.0
var time_scale = 1.0

var directional_light: DirectionalLight3D

signal time_changed(time)
signal day_started
signal night_started

func _ready():
	directional_light = get_parent().get_node("DirectionalLight3D")

func _process(delta):
	current_time += delta * time_scale
	
	if current_time >= cycle_duration:
		current_time = 0.0
	
	update_lighting()
	time_changed.emit(current_time)

func update_lighting():
	# Calculate sun position based on time
	var progress = current_time / cycle_duration
	var rotation = progress * TAU
	
	directional_light.rotation.x = rotation - PI / 2
	
	# Adjust light intensity
	var brightness = abs(sin(rotation))
	directional_light.light_energy_lux = lerp(10000.0, 100000.0, brightness)

func get_time_percentage() -> float:
	return current_time / cycle_duration

func is_day() -> bool:
	return get_time_percentage() < 0.5
