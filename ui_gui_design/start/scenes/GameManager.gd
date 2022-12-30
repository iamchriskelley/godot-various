extends Node

signal load_file_dialog(open_tag)
signal update_game_state_label(game_state)

onready var json_handler = $Control/JSONGetSet
onready var hidden_text = $Control/TextEdit

var json_records = {}

var game_state_history = ["REST"]

func _ready():
	pass

func quit_with_notification():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)

func broadcast_action(var name:String, var action:String):
	print(name + ": " + action)
	pass

func report_error_stub(var name:String):
	print("GameManager: ERROR reported by [",name,"]")

func set_game_state(var name:String, var game_state_tag:String):
	print("Command #" + String(game_state_history.size()) + ": "+ name + " [" + game_state_tag + "]")
	game_state_history.push_back(game_state_tag)
	emit_signal("update_game_state_label", game_state_tag)
	
	if game_state_tag == "LOAD":
		print("GameManager emitting file dialog signal")
		#emit_signal("load_file_dialog", game_state_tag)
		json_handler.get_json_file_details(game_state_tag)
	elif game_state_tag == "QUIT":
		quit_with_notification()
	pass

func load_json_file(var file_info:Array):
	var ffull = file_info[0]
	var fpath = file_info[1]
	var fname = file_info[2]
	var jr = JSONFileRecord.new()
	jr.set_file_details(ffull, fpath, fname)
	
	var f = File.new()
	f.open(jr.fullname, File.READ)
	var file_content = f.get_as_text()
	f.close()
	
	jr.set_json_string(file_content)
	#print("Attempting JSON parse")
	var j = JSON.parse(file_content)
	#print(j.result)
	if typeof(j.result) == TYPE_DICTIONARY:
		print("JSON parsed")
		jr.set_json_dict(j.result)
	else:
		print("JSON parse failed")
		push_error("JSON parse failed")
		return -1
	
	var vinfo = validate_edacity_record(jr)
	jr.set_edacity_type(vinfo[0], vinfo[1])
	
	json_records[fname] = jr
	json_records[fname].display()
	
	load_edacity_record_into_scene(jr)
	

func validate_edacity_record(var edacity_record:JSONFileRecord):
	return ["DEBUG", true]

func load_edacity_record_into_scene(var edacity_record:JSONFileRecord):
	
	debug_text_display(edacity_record.json_string)
	var em = EdacityModule.new()
	em.ingest_json_record(edacity_record)
	print("TIME TO LOAD AN EDACITY MODULE INTO SCENE AND DISPLAY IT")
	pass

func debug_text_display(var text:String):
	hidden_text.text = text
