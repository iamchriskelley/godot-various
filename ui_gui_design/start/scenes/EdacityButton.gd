extends Button

export var game_state_tag = "REST"

func _ready():
	pass

func _on_EdacityButton_pressed():
	#GameManager.broadcast_action(self.name, "pressed")
	GameManager.set_game_state(self.name, game_state_tag)
	pass # Replace with function body.
