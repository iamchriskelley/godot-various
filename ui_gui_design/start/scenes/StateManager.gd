extends Node

class_name StateManager

var game_state_history = []
var game_state_current = "REST"

func get_state():
	return game_state_current

func set_game_state(var name:String, var game_state_tag:String):
	print("Command #" + String(game_state_history.size()) + ": " + name + " [" + game_state_tag + "]")
	game_state_history.push_back(game_state_current)
	game_state_current = game_state_tag
	GameManager.update_game_state_label(game_state_current)
	
	var gs = game_state_current
	if gs == "LOAD":
		print("GameManager emitting file dialog signal")
		#emit_signal("load_file_dialog", game_state_tag)
		GameManager.get_json_file_details(game_state_current)
	elif gs == "GRID":
		GameManager.open_grid_manager() 
	elif gs == "QUIT":
		GameManager.quit_with_notification()
	pass
	
