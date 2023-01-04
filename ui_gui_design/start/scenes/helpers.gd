extends Node

func ts():
	return Time.get_unix_time_from_system()
	
func quit():
	get_tree().notification(MainLoop.NOTIFICATION_WM_QUIT_REQUEST)
	
func get_all_children(var node):
	var nodes : Array = []
	for N in node.get_children():
		if N.get_child_count() > 0:
			nodes.append(N)
			nodes.append_array(get_all_children(N))
		else:
			nodes.append(N)
	return nodes
