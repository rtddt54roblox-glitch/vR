extends Node3D

var survival_manager
var day_night_cycle
var weather_system
var zombie_spawner
var building_system
var crafting_system
var weapon_system
var inventory_manager
var hud

func _ready():
	# Add player to group for zombie detection
	add_to_group("player")
	
	# Initialize all systems
	print("\n=== 🎮 VR SURVIVAL GAME STARTING ===")
	print("Version: 0.1.0")
	
	# Setup world
	setup_world()
	
	# Initialize survival systems
	setup_survival_systems()
	
	# Initialize game systems
	setup_game_systems()
	
	# Add initial resources to inventory
	add_starting_items()
	
	print("=== ✅ GAME READY ===")

func setup_world():
	var light = $DirectionalLight3D
	light.light_energy_lux = 100000
	light.shadow_enabled = true
	
	print("✓ World environment initialized")

func setup_survival_systems():
	# Create survival manager node
	var survival_mgr = Node.new()
	survival_mgr.name = "SurvivalManager"
	add_child(survival_mgr)
	
	# Add health system
	var health = preload("res://scripts/survival/health_system.gd").new()
	health.name = "HealthSystem"
	survival_mgr.add_child(health)
	
	# Add hunger system
	var hunger = preload("res://scripts/survival/hunger_system.gd").new()
	hunger.name = "HungerSystem"
	survival_mgr.add_child(hunger)
	
	# Add stamina system
	var stamina = preload("res://scripts/survival/stamina_system.gd").new()
	stamina.name = "StaminaSystem"
	survival_mgr.add_child(stamina)
	
	# Add day/night cycle
	var day_night = preload("res://scripts/world/day_night_cycle.gd").new()
	day_night.name = "DayNightCycle"
	add_child(day_night)
	
	# Add weather system
	var weather = preload("res://scripts/world/weather_system.gd").new()
	weather.name = "WeatherSystem"
	add_child(weather)
	
	print("✓ Survival systems initialized (Health, Hunger, Stamina)")

func setup_game_systems():
	# Add inventory manager
	inventory_manager = preload("res://scripts/inventory/inventory_manager.gd").new()
	inventory_manager.name = "InventoryManager"
	add_child(inventory_manager)
	
	# Add crafting system
	crafting_system = preload("res://scripts/crafting/crafting_system.gd").new()
	crafting_system.name = "CraftingSystem"
	add_child(crafting_system)
	
	# Add building system
	building_system = preload("res://scripts/building/building_system.gd").new()
	building_system.name = "BuildingSystem"
	add_child(building_system)
	
	# Add weapon system
	weapon_system = preload("res://scripts/weapons/weapon_system.gd").new()
	weapon_system.name = "WeaponSystem"
	add_child(weapon_system)
	
	# Add zombie spawner
	zombie_spawner = preload("res://scripts/enemies/zombie_spawner.gd").new()
	zombie_spawner.name = "ZombieSpawner"
	add_child(zombie_spawner)
	
	# Add HUD
	hud = preload("res://scenes/ui/hud.tscn").instantiate()
	add_child(hud)
	
	print("✓ Game systems initialized (Crafting, Building, Weapons, Zombies)")

func add_starting_items():
	if inventory_manager:
		inventory_manager.add_item("wood", 5)
		inventory_manager.add_item("stone", 3)
		inventory_manager.add_item("herb", 2)
		inventory_manager.add_item("wooden_spear", 1)
		print("✓ Starting inventory: Wood x5, Stone x3, Herb x2, Wooden Spear x1")

func _process(delta):
	pass

func take_damage(amount: float):
	var health_sys = get_node_or_null("SurvivalManager/HealthSystem")
	if health_sys:
		health_sys.take_damage(amount)

func heal(amount: float):
	var health_sys = get_node_or_null("SurvivalManager/HealthSystem")
	if health_sys:
		health_sys.heal(amount)
