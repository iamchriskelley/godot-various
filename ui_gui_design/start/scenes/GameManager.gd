extends Node2D

signal load_file_dialog(open_tag)
signal update_game_state_label(game_state)

onready var state_manager = $StateManager
onready var json_handler = $JSONHandler
onready var grid_manager = $GridManager

var json_records = {}

func _ready():
	pass

func _input(event:InputEvent):
	if not (event is InputEventMouseMotion):
		#print(event.as_text())
		if event.is_action_pressed("escape"):
			reset_game_state(event)
		elif event.is_action_pressed("quit"):
			quit_with_notification()
		
		
	#	if event is InputEventKey:
	#		var keycode = event.as_text()
	#		if keycode

func reset_game_state(var event:InputEvent):
	print("resetting game state")
	state_manager.set_game_state("self", "REST")

func quit_with_notification():
	print("goodbye")
	Helpers.quit()

func broadcast_action(var name:String, var action:String):
	print(name + ": " + action)
	pass

func report_error_stub(var name:String):
	print("GameManager: ERROR reported by [",name,"]")

func open_grid_manager():
	grid_manager.move_to(get_viewport_rect().size / 2)
	grid_manager.open()

func get_json_file_details(var game_state_current:String):
	json_handler.get_json_file_details(game_state_current)

func update_game_state_label(var game_state_string:String):
	emit_signal("update_game_state_label", game_state_string)

func set_state_request(var requester_category, var requester_name, var game_state_tag):
	state_manager.set_game_state(requester_name, game_state_tag)
	
func game_object_clicked(var name:String):
	print("Game state [", state_manager.get_state(),"], object [", name, "] is clicked!")

func load_json_file(var file_info:Array):
	var fname = file_info[2]
	var jr = json_handler.load_json_file(file_info)
	json_records[fname] = jr
	json_records[fname].display()
	load_edacity_record_into_scene(jr)
	
func load_edacity_record_into_scene(var edacity_record:JSONFileRecord):
	json_handler.debug_text_display(edacity_record.json_string)
	var em = EdacityModule.new()
	em.ingest_json_record(edacity_record)
	print("TIME TO LOAD AN EDACITY MODULE INTO SCENE AND DISPLAY IT")
	pass
	
