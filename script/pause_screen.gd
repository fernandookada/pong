extends Panel


func _ready():
	hide()
	#visible = false
	

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		get_tree().paused = not get_tree().paused
		visible = get_tree().paused


func _on_pause_button_pressed():
	get_tree().paused = false
	hide()


func _on_main_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scene/main_menu.tscn")
