extends KinematicBody2D

onready var target_y = position.y

var row = 0
var col = 0

export var appear_speed = 2
export var fall_speed = 1

var dying = false

var colors = [
	Color8(224,49,49)		#Red 8
	,Color8(253,126,20)		#Orange 6
	,Color8(255,224,102)	#Yellow 3
	,Color8(148,216,45)		#Lime 5
	,Color8(34,139,230)		#Blue 6
	,Color8(190,75,219)		#Violet 5
	,Color8(132,94,247)		#Grape 6
]
onready var textures = [
	load("res://Assets/smoke0.png")
	,load("res://Assets/smoke1.png")
	,load("res://Assets/smoke2.png")
	,load("res://Assets/smoke3.png")
]

func _ready():
	randomize()
	update_color()

func _process(_delta):
	if dying and not $Particles2D.emitting and not $Tween.is_active() and not $Color_Tween.is_active():
		queue_free()

func start_brick():
	var target_pos = position
	var appear_duration = randf()*appear_speed + 1.0
	position.y = -100
	$Tween.interpolate_property(self, "position", position, target_pos, appear_duration, Tween.TRANS_ELASTIC, Tween.EASE_IN_OUT)
	$Tween.start()

func update_color():
	if row >= 0 and row < colors.size():
		$Color.color = colors[row]

func emit_particle(pos):
	$Particles2D.texture = textures[randi() % textures.size()]
	$Particles2D.emitting = true
	$Particles2D.global_position = pos
	
func die():
	dying = true
	var target_color = $Color.color.darkened(0.75)
	target_color.a = 0
	var fall_duration = randf()*fall_speed + 1

	#blocks fall
	var target_pos = position
	target_pos.y = 1000
	$Tween.interpolate_property(self, "position", position, target_pos, fall_duration, Tween.TRANS_CUBIC, Tween.EASE_IN)
	$Tween.start()
	#blocks fade
	$Tween.interpolate_property($Color, "color", $Color.color, target_color, fall_duration-0.25, Tween.TRANS_EXPO, Tween.EASE_IN)
	$Tween.start()


	collision_layer = 0
	collision_mask = 0
