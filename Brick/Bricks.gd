extends Node2D

onready var VP = get_viewport_rect().size
onready var Brick = load("res://Brick/Brick.tscn")

export var W = 8
export var H = 7
export var top_margin = 100
export var margin = 3

var B = Vector2(90,30)


func _ready():
	start_bricks()

func start_bricks():
	for c in get_children():
		c.queue_free()
	var startx = (VP.x / 2) - (B.x + margin) * (W/2)
	var starty = top_margin
	for w in range(W):
		for h in range(H):
			var brick = Brick.instance()
			brick.position = Vector2(startx + w*(B.x+margin), starty + h*(B.y+margin))
			brick.row = h
			brick.col = w
			add_child(brick)
			brick.start_brick()

