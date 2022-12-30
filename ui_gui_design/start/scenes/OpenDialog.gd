extends Control

onready var fd = $FileDialog

var error_state = OK
var fpath = ""
var fdir = ""
var fname = ""

func _ready():	
	fd.get_cancel().connect("pressed", self, "file_dialog_cancelled")
	#error_state = GameManager.connect("load_file_dialog", self, "open_dialog")
	pass

func clear_vars():
	fpath = ""
	fdir = ""
	fname = ""
	
func get_vars():
	return [fpath, fdir, fname]

func file_dialog_cancelled():
	print("OpenDialog canceled")

func get_json_file_details(var action):
	clear_vars()
	if error_state == OK:
		print("OpenDialog running!")
		
		fd.mode = FileDialog.MODE_OPEN_FILE
		fd.set_filters(PoolStringArray(["*.json ; JSON Document"]))
		
		fd.popup()
		yield(fd, "file_selected") #dir_selected, files_selected
		#print(fd.current_file)
		
		fpath = fd.current_path
		fdir = fd.current_dir
		fname = fd.current_file
		GameManager.load_json_file(get_vars())
		
	else:
		print("OpenDialog error!")
		#GameManager.report_error_stub(self.name)
	return get_vars()

