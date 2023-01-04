extends Node

var event_record_list = []

func add_event_record(var game_state:String, var input_event:InputEvent):#, var is_action_flag):
	var er = EventRecord.new ()
	er.setup_event_record(game_state, input_event)
	var records = determine_action(er)
	er.setup_action_records(records)
	#er.set_record_index()
	event_record_list.push_back(er)
	pass
	
func determine_action(var event_record:EventRecord):
	var command = ActionRecord
	var undo = ActionRecord
	var is_action = false
	
	var result = {"is_action": is_action, "command": command, "undo":undo}
	return result
	
func debug_display_event_record(var idx:int):
	pass
