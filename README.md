# Godot VR Survival Game

A virtual reality survival game built with Godot Engine 4.x

## Features

- **VR Support**: Full OpenXR integration for Meta Quest and other VR platforms
- **Survival Mechanics**: Health, hunger, and stamina systems
- **Resource Management**: Gather and manage resources
- **Environmental Challenges**: Day/night cycle, weather effects
- **Player Interaction**: Grab objects, craft items, build structures

## Requirements

- Godot Engine 4.1+
- OpenXR Plugin for Godot
- Android SDK (for APK export)
- Meta Quest or compatible VR headset

## Project Structure

```
godot-vr-survival/
├── scenes/
│   ├── main.tscn                 # Main scene
│   ├── player/
│   │   ├── vr_player.tscn        # VR player controller
│   │   └── vr_player.gd          # Player logic
│   ├── ui/
│   │   ├── hud.tscn              # Head-up display
│   │   └── inventory.tscn        # Inventory UI
│   └── world/
│       ├── terrain.tscn          # Terrain/ground
│       └── resources.tscn        # Collectible resources
├── scripts/
│   ├── survival/
│   │   ├── health_system.gd      # Health management
│   │   ├── hunger_system.gd      # Hunger/food system
│   │   └── stamina_system.gd     # Stamina system
│   ├── world/
│   │   ├── day_night_cycle.gd    # Day/night cycle
│   │   └── weather_system.gd     # Weather effects
│   └── inventory/
│       └── inventory_manager.gd  # Inventory system
├── assets/
│   ├── models/                   # 3D models
│   ├── textures/                 # Textures
│   └── sounds/                   # Audio files
└── export_presets.cfg            # Android export settings
```

## Getting Started

1. Clone this repository
2. Open in Godot Engine 4.1+
3. Install OpenXR plugin via Asset Library
4. Configure Android export settings
5. Build and run

## Building APK for Meta Quest

1. Go to `Project` → `Export`
2. Select `Android` platform
3. Configure signing and settings
4. Click `Export Project` or `Export All`
5. Deploy to your Meta Quest device

## Controls (VR)

- **Grip Buttons**: Grab/interact with objects
- **Trigger Buttons**: Use tools/weapons
- **Thumbstick**: Smooth locomotion
- **Menu Button**: Pause/access inventory

## License

MIT License
