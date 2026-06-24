extends XROrigin3D

var left_controller: XRController3D
var right_controller: XRController3D
var speed = 5.0
var grab_distance = 2.0

func _ready():
	left_controller = $LeftHand
	right_controller = $RightHand
	
	# Connect controller signals
	left_controller.button_pressed.connect(_on_left_controller_button_pressed)
	right_controller.button_pressed.connect(_on_right_controller_button_pressed)
	
	print("VR Player initialized")

func _process(delta):
	handle_movement(delta)
	
func handle_movement(delta):
	# Smooth locomotion using thumbstick
	var left_thumbstick = left_controller.get_vector2("primary")
	var movement = Vector3(
		left_thumbstick.x * speed * delta,
		0,
		left_thumbstick.y * speed * delta
	)
	
	position += movement

func _on_left_controller_button_pressed(button):
	if button == JOY_BUTTON_A:
		attempt_grab(left_controller)

func _on_right_controller_button_pressed(button):
	if button == JOY_BUTTON_A:
		attempt_grab(right_controller)

func attempt_grab(controller: XRController3D):
	# Raycast to find nearby objects
	var space_state = get_world_3d().direct_space_state
	var query = PhysicsRayQueryParameters3D.create(
		controller.global_position,
		controller.global_position + controller.global_transform.basis.z * grab_distance
	)
	
	var result = space_state.intersect_ray(query)
	if result:
		print("Grabbed: ", result.collider.name)
