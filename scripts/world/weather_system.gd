extends Node

class_name WeatherSystem

enum Weather { CLEAR, RAINY, STORMY, FOGGY }

var current_weather = Weather.CLEAR
var weather_change_interval = 60.0  # Change weather every 60 seconds
var time_until_change = weather_change_interval

signal weather_changed(new_weather)

func _ready():
	pass

func _process(delta):
	time_until_change -= delta
	
	if time_until_change <= 0:
		change_weather()
		time_until_change = weather_change_interval

func change_weather():
	var weather_types = [
		Weather.CLEAR,
		Weather.RAINY,
		Weather.STORMY,
		Weather.FOGGY
	]
	
	current_weather = weather_types[randi() % weather_types.size()]
	weather_changed.emit(current_weather)
	
	print("Weather changed to: ", Weather.keys()[current_weather])

func get_weather_string() -> String:
	return Weather.keys()[current_weather]
