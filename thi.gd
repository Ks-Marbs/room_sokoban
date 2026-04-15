extends TileMapLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:

	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for cell in get_used_cells():
		Global.special_matrix[cell[0]][cell[1]] = 1
	pass
