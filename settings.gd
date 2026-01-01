extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$gos.value = Global.GridT
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $back.button_pressed:
		Global.toggle = false
	Global.GridT = $gos.value
	if Global.toggle:
		visible = true
	else:
		visible = false
