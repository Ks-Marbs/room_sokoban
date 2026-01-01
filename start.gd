extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $start.button_pressed:
		get_tree().change_scene_to_file("res://LS.tscn")
	if $settings.button_pressed:
		Global.toggle = true
	if Global.toggle:
		$Title.visible = false
		$start.visible = false
		$settings.visible = false
	else:
		$Title.visible = true
		$start.visible = true
		$settings.visible = true
