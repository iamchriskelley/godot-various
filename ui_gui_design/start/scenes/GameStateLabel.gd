extends Control

onready var game_state_label = $NinePatchRect/Label

func _ready():
	GameManager.connect("update_game_state_label", self, "change_state_label")
	pass

func change_state_label(var state):
	print("change_state_label: " + state)
	game_state_label.text = state
