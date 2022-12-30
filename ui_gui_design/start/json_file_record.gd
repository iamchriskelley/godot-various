#extends Node
class_name JSONFileRecord
#var status: String
var filename: String
var filepath: String
var fullname: String
var created_ts: float
var loaded_ts: float

var edacity_record_type: String
var valid_edacity_record: bool

var json_string: String
var json_string_length: int
var json_dict: Dictionary
var valid_json: bool

func _init():
	#self.status = "EMPTY"
	self.fullname = ""
	self.filename = ""
	self.filepath = ""
	self.json_string = ""
	self.json_dict = {}
	self.created_ts = Time.get_unix_time_from_system()
	self.loaded_ts = -1.0
	self.json_string_length = 0
	self.valid_json = false
	self.edacity_record_type = ""
	self.valid_edacity_record = false
		
func set_file_details(var fullname, var fpath, var fname):
	self.filename = fname
	self.filepath = fpath
	self.fullname = fullname
	
func set_json_string(var json:String):
	self.json_string = json
	self.json_string_length = len(json)
	self.loaded_ts = Time.get_unix_time_from_system()

func set_json_dict(var jdict:Dictionary):
	self.json_dict = jdict
	self.valid_json = true
	self.loaded_ts = Time.get_unix_time_from_system()

func set_edacity_type(var type:String, var valid:bool):
	self.edacity_record_type = type
	self.valid_edacity_record = valid

func display():
	print("File path: [", self.filepath,"]")
	print("File name: [", self.filename,"]")
	print("Load timestamp: [", self.loaded_ts ,"]")
	print("JSON string length: [", self.json_string_length, "]")
	print("Edacity record type: [", self.edacity_record_type,"]")
	print("Valid edacity record: [", self.valid_edacity_record,"]")
