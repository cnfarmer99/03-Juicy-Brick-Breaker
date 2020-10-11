extends ColorRect

var c = 0
var colors = [
	Color8(255, 201, 201)		#red 2
	,Color8(252, 194, 215)		#pink 2
	,Color8(238, 190, 250)		#grape 2
	,Color8(208, 191, 255)		#violet 2
	,Color8(186, 200, 255)		#indigo 2
	,Color8(165, 216, 255)		#blue 2
	,Color8(153, 233, 242)		#cyan 2
	,Color8(150, 242, 215)		#teal 2
	,Color8(178, 242, 187)		#green 2
	,Color8(216, 245, 162)		#lime 2
	,Color8(255, 236, 153)		#yellow 2
	,Color8(255, 216, 168)		#orange 2
]

func _ready():
	update_color()

func update_color():
	$Tween.interpolate_property(self, "color", color, colors[c], $Timer.wait_time-0.01, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	$Tween.start()

func _on_Timer_timeout():
	c += 1
	c %= colors.size()
	update_color()
