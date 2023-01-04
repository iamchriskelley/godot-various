extends Node

class_name JSONHandler

onready var hidden_text = $TextEdit
onready var json_dialog = $JSONGetSet

func validate_edacity_record(var edacity_record:JSONFileRecord):
	return ["DEBUG", true]

func debug_text_display(var text:String):
	hidden_text.text = text

func get_json_file_details(var game_state_current:String):
	json_dialog.get_json_file_details(game_state_current)

func load_json_file(var file_info:Array):
	var jr = JSONFileRecord.new()
	jr.set_file_details(file_info[0], file_info[1], file_info[2])
	var fname = file_info[2]
	
	var f = File.new()
	f.open(jr.fullname, File.READ)
	var file_content = f.get_as_text()
	f.close()
	
	jr.set_json_string(file_content)
	var j = JSON.parse(file_content)
	if typeof(j.result) == TYPE_DICTIONARY:
		print("JSON parsed")
		jr.set_json_dict(j.result)
	else:
		print("JSON parse failed")
		push_error("JSON parse failed")
		return -1
	
	var vinfo = validate_edacity_record(jr)
	jr.set_edacity_type(vinfo[0], vinfo[1])
	
	return jr
