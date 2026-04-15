extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$gos.value = Global.GridT
	$vol.value = Audio.volume_linear
	$ind.value = Global.full_delay
	match Global.step_size:
		4:
			$ind2.value = 0.0
		6:
			$ind2.value = 1.0
		9:
			$ind2.value =2.0
		12:
			$ind2.value = 3.0
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if $back.button_pressed:
		Global.toggle = false
	if $r.button_pressed:
		Global.toggle = false
		get_tree().change_scene_to_file("res://level_"+str(Global.level)+".tscn")
	if $quit.button_pressed:
		Global.toggle = false
		get_tree().change_scene_to_file("res://Start.tscn")
	Global.GridT = $gos.value
	Audio.volume_linear = $vol.value
	Global.full_delay = $ind.value
	match $ind2.value:
		0.0:
			Global.step_size = 4
		1.0:
			Global.step_size = 6
		2.0:
			Global.step_size = 9
		3.0:
			Global.step_size = 12
	if Global.toggle:
		visible = true
	else:
		visible = false
