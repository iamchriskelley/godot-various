extends Camera

#onready var grayscaler:ColorRect = $grayscreen/ColorRect

func _ready():
	grayscale(false)
	pass # Replace with function body.

func grayscale(var on:bool):
	if on:
		get_child(0).get_child(0).material.set_shader_param("use_grayscale", true)
	else:
		get_child(0).get_child(0).material.set_shader_param("use_grayscale", false)
	pass
