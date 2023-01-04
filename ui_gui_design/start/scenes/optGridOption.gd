extends OptionButton

var mm = "mm"
var mm_idx = 0

var inch = "in"
var inch_idx = 1

func _ready():
	add_item(mm, mm_idx)
	add_item(inch, inch_idx)

func get_unit():
	var s = mm
	var i = get_selected_id()
	if i == inch_idx: s = inch
	return s 

func set_unit(var units:String):
	if units == inch:
		select(inch_idx)
	else: select(mm_idx)
