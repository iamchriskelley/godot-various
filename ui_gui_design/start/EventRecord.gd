#extends Node
class_name EventRecord

var timestamp:float
var game_state:String
var is_action:bool
var raw_event:InputEvent

var command
var undo

func _init():
	self.timestamp = -1
	self.game_state = ""
	self.is_action = false

func setup_event_record(var game_state:String, var input_event:InputEvent, var is_action_flag:bool):
	self.timestamp = Helpers.ts()
	self.game_state = game_state
	self.raw_event = input_event
	self.is_action = is_action_flag
	
func setup_action_records(var records:Dictionary):
	self.is_action = records["is_action"]
	self.command = records["command"]
	self.undo = records["undo"]
	pass
