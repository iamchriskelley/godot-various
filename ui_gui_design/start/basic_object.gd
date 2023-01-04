extends Spatial

export var color:Color
onready var mi = $StaticBody/MeshInstance

func _ready():
	var m = SpatialMaterial.new()
	#var m = mi.get_surface_material(0)
	m.albedo_color = color
	mi.set_surface_material(0, m)
	#print("setting color")

func _on_StaticBody_input_event(camera, event, position, normal, shape_idx):
	#print("event!")
	if event is InputEventMouseButton and event.pressed == true:
		GameManager.game_object_clicked(self.name)
		#debug_info()
	pass
	
func debug_info():
	print(self.name + " is clicked!")
