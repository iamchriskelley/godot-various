extends Node2D

class_name GridHandler

var mm_grid_min = 0.05
var mm_grid_max = 10.0
var inch_grid_min = .002
var inch_grid_max = .4

onready var gridm = $"."
onready var grid_popup = $wdg
onready var grid_unit_option = $wdg/m/vbx/grid_units/optGridOption
onready var grid_size_field = $wdg/m/vbx/grid_size/LineEdit

var grid_units:String
var grid_size:float

#grid size will always be available internally in mm
var grid_size_mm:float

var hide_coords = Vector2(-10000,0)

func _ready():
	self.grid_size = 1.2
	self.grid_units = "mm"
	move_to(hide_coords)

func move_to(var coords:Vector2):
	self.set_position(coords)

func open():
	grid_unit_option.set_unit(grid_units)
	grid_size_field.text = String(grid_size)
	#grid_popup.mouse_filter = Control.MOUSE_FILTER_STOP
	#$CanvasLayer.visible = true
	#$CanvasLayer.show()
	#$CanvasLayer.set_block_signals(false)
	grid_popup.popup()

func listen_to_mouse(var yes:bool):
	var children = Helpers.get_all_children($CanvasLayer)
	for child in children:
		print(child)
		#if child.has_method("mouse_filter"):
		#if yes == true:
		#	child.mouse_filter = Control.MOUSE_FILTER_STOP
		#else:
		#	child.mouse_filter = Control.MOUSE_FILTER_IGNORE
		#else:
		#	print("PROBLEM")
			
func close():
	#grid_popup.mouse_filter = Control.MOUSE_FILTER_IGNORE
	grid_popup.hide()
	move_to(hide_coords)
	GameManager.set_state_request("MANAGER", self.name, "REST")
	

func _on_btnOkay_pressed():
	var sz = float(grid_size_field.text)
	var unt = grid_unit_option.get_unit()
	
	var rsz = true
	print("raw grid size = ", String(sz))
	#if sz < 0 or sz > 100: sz = 0
	
	if unt == "mm":
		if sz < mm_grid_min: sz = mm_grid_min
		elif sz > mm_grid_max: sz = mm_grid_max
		else: rsz = false
	elif unt == "mm":
		if sz < inch_grid_min: sz = inch_grid_min
		elif sz > inch_grid_max: sz = inch_grid_max
		else: rsz = false
	
	if rsz: print("Grid resized to fit allowed bounds")
	print("You've selected size [", sz, "], units [", unt, "]")
	
	grid_units = unt
	grid_size = sz
	
	self.close()

func _on_btnCancel_pressed():
	self.close()
	pass # Replace with function body.
