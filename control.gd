extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if $lef.button_pressed:
		Input.action_press("left")
	else:
		Input.action_release("left")
	if $righ.button_pressed:
		Input.action_press("right")
	else:
		Input.action_release("right")
	if $up.button_pressed:
		Input.action_press("up")
	else:
		Input.action_release("up")
	if $down.button_pressed:
		Input.action_press("down")
	else:
		Input.action_release("down")
	pass
