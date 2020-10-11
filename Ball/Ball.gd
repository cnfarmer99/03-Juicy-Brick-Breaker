extends RigidBody2D

export var max_speed = 400.0
export var min_speed = 100.0
onready var camera = get_node("/root/LevelOne/Camera")

var wall_trauma = 0.005
var paddle_trauma = 0.008
var brick_trauma = 0.01

func _ready():
	contact_monitor = true
	set_max_contacts_reported(4)
	update_color()

func update_color():
	$Color.color = Color8(34,184,207)

#add in screen shake
func screen_shake(amount):
	camera.add_trauma(amount)

func _physics_process(_delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.name == "Walls":
			screen_shake(wall_trauma)
		if body.name == "Paddle":
			screen_shake(paddle_trauma)
		if body.is_in_group("Brick"):
			screen_shake(brick_trauma)
		if body.has_method("emit_particle"):
			body.emit_particle(global_position)
		if body.is_in_group("Brick"):
			body.die()

func _integrate_forces(state):
	if abs(state.linear_velocity.x) < min_speed:
		state.linear_velocity.x = sign(state.linear_velocity.x) * min_speed
	if abs(state.linear_velocity.y) < min_speed:
		state.linear_velocity.y = sign(state.linear_velocity.y) * min_speed
	if state.linear_velocity.length() > max_speed:
		state.linear_velocity = state.linear_velocity.normalized() * max_speed
