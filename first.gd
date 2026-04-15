extends Node2D

func _ready() -> void:
	Global.prepare(Global.level)
	if Global.level != 20:
		$num.text = str(Global.level)
	else:
		$Lav/Camera2D/num.text = "20"
	Global.moves = 0
	
	for cell in $grid.get_used_cells():
		Global.cols = max(Global.cols,cell[0])
		Global.rows = max(Global.rows,cell[1])
	for i in range(6):
		for cell in $things.get_used_cells_by_id(-1,Vector2i(i,7)):
				Global.room_matrix[cell.x][cell.y] = i
				$things.set_cell(cell,-1,Vector2i(18,5))
	for i in range(11):
		for j in range(4):
			for cell in $things.get_used_cells_by_id(-1,Vector2i(i,j+8)):
					Global.room_matrix[cell.x][cell.y] = 999
	for i in range(5):
		for j in range(3):
			for cell in $things.get_used_cells_by_id(-1,Vector2i(i,j+12)):
					Global.room_matrix[cell.x][cell.y] = 999
	for i in range(6):
		for j in range(3):
			for cell in $things.get_used_cells_by_id(-1,Vector2i(i+5,j+12)):
					Global.room_matrix[cell.x][cell.y] = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$grid.self_modulate = Color(1.0, 1.0, 1.0, Global.GridT)
	if Input.is_action_just_released("esc") and not Global.clear:
		if Global.toggle:
			Global.toggle = false
		else:
			Global.toggle = true
	if Global.fgoals == Global.goals and Global.fgoals != 0 and  Global.goals != 0:
		Global.clear = true
