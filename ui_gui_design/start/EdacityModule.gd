extends Object

class_name EdacityModule

class EdacityModuleTypes:
	#thing_types
	var layers: Array
	var text_styles: Array
	var trace_styles: Array
	var thing_component_types: Array
	var thing_connection_types: Array

class EdacityModuleThings:
	var syntax: String
	
class EdacityModuleRules:
	var units: Dictionary

var json_record: JSONFileRecord
var created_timestamp: float
var last_updated_timestamp: float
var notes: Array
var uid: String
var module_name: String
var description: String
var syntax: String
var types: EdacityModuleTypes
var things: EdacityModuleThings
var rules: EdacityModuleRules
var metadata: Dictionary

func _init():
	pass

func ingest_json_record(var jr: JSONFileRecord):
	self.json_record = jr
	print("Attempting to ingest and validate Edacity record with uid [", jr.json_dict["uid"],"]")
	pass
