extends Control

var color_paddle = false
var color_ball = false
var color_blocks = false
var color_background = false

var particle_paddle = false
var particle_walls = false
var particle_blocks = false

var blocks_appear = false
var blocks_fall = false
var blocks_fade = false

var screen_shake = 0

var paddle_appear = false
var paddle_stretch = false


signal changed

func _ready():
	$Menu/Color/Color.pressed = true
	$Menu/Particles/Particles.pressed = true

func reset_values():
	emit_signal("changed")


func _on_Reset_pressed():
	get_node("/root/Game/Bricks").start_bricks()
	get_node("/root/Game/Ball_Container").start_ball()
	get_node("/root/Game/Paddle_Container/Paddle").start_paddle()
	reset_values()


func _on_Quit_pressed():
	get_tree().quit()



func _on_Color_toggled(button_pressed):
	color_paddle = button_pressed
	color_ball = button_pressed
	color_blocks = button_pressed
	color_background = button_pressed
	emit_signal("changed")



func _on_Particles_toggled(button_pressed):
	particle_paddle = button_pressed
	particle_walls = button_pressed
	particle_blocks = button_pressed
	emit_signal("changed")


func _on_Blocks_Appear_toggled(button_pressed):
	blocks_appear = button_pressed
	emit_signal("changed")

func _on_Blocks_Fall_toggled(button_pressed):
	blocks_fall = button_pressed
	emit_signal("changed")

func _on_Blocks_Fade_toggled(button_pressed):
	blocks_fade = button_pressed
	emit_signal("changed")



func _on_Screen_Shake_value_changed(value):
	screen_shake = value
	emit_signal("changed")


func _on_Paddle_Appear_toggled(button_pressed):
	paddle_appear = button_pressed
	emit_signal("changed")

func _on_Paddle_Stretch_toggled(button_pressed):
	paddle_stretch = button_pressed
	emit_signal("changed")

