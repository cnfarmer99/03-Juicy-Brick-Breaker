extends StaticBody2D

func emit_particle(pos):
	$Particles2D.emitting = true
	$Particles2D.global_position = pos
	$Particles2D.look_at(get_viewport_rect().size/2)
