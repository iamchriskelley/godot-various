extends CheckButton
onready var cam = $"../../CameraWithShader"

func _ready():
	#cam.grayscale(false)
	pass # Replace with function body.



func _on_CheckButton_toggled(button_pressed):
	#print(button_pressed)
	cam.grayscale(button_pressed)
	pass # Replace with function body.
