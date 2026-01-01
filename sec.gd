extends Node2D



func _ready() -> void:
	Global.goals = 0
	Global.cols = 10
	Global.rows = 8
	Global.fill_rect(Global.room_matrix, 0, 0, 10, 8, 1)
	Global.fill_rect(Global.room_matrix, 0, 0, 0, 1, 999)
	Global.fill_rect(Global.room_matrix, 5, 0, 7, 0, 999)
	Global.fill_rect(Global.room_matrix, 9, 6, 10, 8, 999)
	Global.fill_rect(Global.room_matrix, 0, 7, 1, 8, 999)
	Global.fill_rect(Global.room_matrix, 3, 3, 6, 5, 999)
	Global.fill_rect(Global.room_matrix, 4, 3, 6, 4, 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$grid.self_modulate = Color(1.0, 1.0, 1.0, Global.GridT)
	if Global.goals == 2:
		get_tree().change_scene_to_file("res://Start.tscn")
	if Input.is_action_just_released("esc"):
		if Global.toggle:
			Global.toggle = false
		else:
			Global.toggle = true
		
