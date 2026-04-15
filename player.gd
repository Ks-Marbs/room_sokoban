extends Area2D
var isbox := false
var del = 0
var yes = true
var isplayer := true
var isgoal := false
var tile_size := 36
var last_move := Vector2.ONE
var nextplan_move := Vector2.ONE
var moving := false
var wiggling := false
var t1 := 0
var t2 := 0
var can_move := false
var xcell := (position.x - (int(position.x) % 36)) / 36
var ycell := (position.y - (int(position.y) % 36)) / 36

func control():
	if not Global.toggle and not Global.clear:
		if Global.get_matrix(xcell, ycell, Global.room_matrix) == 0:
			if (Input.is_action_pressed("right") or Input.is_action_pressed("left")) \
			and Global.get_matrix(xcell+Input.get_axis("left","right"), ycell, Global.room_matrix) != 999:
				can_move = true
				nextplan_move = Vector2.RIGHT * Input.get_axis("left","right")
				if nextplan_move == Vector2.RIGHT and $RightRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $RightRay.get_collider().can_move and not $RightRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO
						await get_tree().create_timer(Global.mini_delay).timeout
				elif nextplan_move == Vector2.LEFT and $LeftRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $LeftRay.get_collider().can_move  and not $LeftRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO 
						await get_tree().create_timer(Global.mini_delay).timeout
				else:
					move_step(nextplan_move,36)

			if (Input.is_action_pressed("up") or Input.is_action_pressed("down")) \
				and Global.get_matrix(xcell, ycell+Input.get_axis("up","down"), Global.room_matrix) != 999:
				can_move = true
				nextplan_move = Vector2.DOWN * Input.get_axis("up","down")
				if nextplan_move == Vector2.UP and $UpRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $UpRay.get_collider().can_move  and not $UpRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO 
						await get_tree().create_timer(Global.mini_delay).timeout
				elif nextplan_move == Vector2.DOWN and $DownRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $DownRay.get_collider().can_move  and not $DownRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO 
						await get_tree().create_timer(Global.mini_delay).timeout
				else:
					move_step(nextplan_move,36)

		else:
			if (Input.is_action_pressed("right") or Input.is_action_pressed("left")) \
			and (Global.get_matrix(xcell, ycell, Global.room_matrix) == Global.get_matrix(xcell +Input.get_axis("left","right"), ycell, Global.room_matrix) \
			or Global.get_matrix(xcell + Input.get_axis("left","right"), ycell, Global.room_matrix) == 0):
				nextplan_move = Vector2.RIGHT * Input.get_axis("left","right")
				can_move = true

				if nextplan_move == Vector2.RIGHT and $RightRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $RightRay.get_collider().can_move and not $RightRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO 
						await get_tree().create_timer(Global.mini_delay).timeout
				elif nextplan_move == Vector2.LEFT and $LeftRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $LeftRay.get_collider().can_move and not $LeftRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO 
						await get_tree().create_timer(Global.mini_delay).timeout
				else:
					move_step(nextplan_move,36)

			elif (Input.is_action_pressed("down") or Input.is_action_pressed("up")) \
				and (Global.get_matrix(xcell, ycell, Global.room_matrix) == Global.get_matrix(xcell, ycell + Input.get_axis("up","down"), Global.room_matrix) \
				or Global.get_matrix(xcell , ycell + Input.get_axis("up","down"), Global.room_matrix) == 0):
				nextplan_move = Vector2.DOWN * Input.get_axis("up","down")
				can_move = true

				if nextplan_move == Vector2.DOWN and $DownRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $DownRay.get_collider().can_move and not $DownRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO 
						await get_tree().create_timer(Global.mini_delay).timeout 
				elif nextplan_move == Vector2.UP and $UpRay.is_colliding():
					await get_tree().create_timer(del).timeout
					if $UpRay.get_collider().can_move and not $UpRay.get_collider().moving:
						move_step(nextplan_move,72)
						nextplan_move =Vector2.ZERO 
						await get_tree().create_timer(Global.mini_delay).timeout
				else:
					move_step(nextplan_move,36)

func may_slide(dir):
	if Global.get_matrix(xcell, ycell, Global.room_matrix) == 0:
		if (dir == Vector2.RIGHT and ($RightRay.is_colliding() or Global.get_matrix(xcell+1, ycell, Global.room_matrix)==999))\
		or (dir == Vector2.LEFT and ($LeftRay.is_colliding() or Global.get_matrix(xcell-1, ycell, Global.room_matrix)==999))\
		or (dir == Vector2.DOWN and ($DownRay.is_colliding() or Global.get_matrix(xcell, ycell+1, Global.room_matrix)==999))\
		or (dir == Vector2.UP and ($UpRay.is_colliding() or Global.get_matrix(xcell, ycell-1, Global.room_matrix)==999)):
			can_move = false
		else:
			can_move = true
	else:
		if (dir == Vector2.RIGHT and ($RightRay.is_colliding() or Global.get_matrix(xcell+1, ycell, Global.room_matrix)!=Global.get_matrix(xcell, ycell, Global.room_matrix)) and Global.get_matrix(xcell+1, ycell, Global.room_matrix) != 0)\
		or (dir == Vector2.LEFT and ($LeftRay.is_colliding() or Global.get_matrix(xcell-1, ycell, Global.room_matrix)!=Global.get_matrix(xcell, ycell, Global.room_matrix)) and Global.get_matrix(xcell-1, ycell, Global.room_matrix) != 0)\
		or (dir == Vector2.DOWN and ($DownRay.is_colliding() or Global.get_matrix(xcell, ycell+1, Global.room_matrix)!=Global.get_matrix(xcell, ycell, Global.room_matrix)) and Global.get_matrix(xcell, ycell+1, Global.room_matrix) != 0)\
		or (dir == Vector2.UP and ($UpRay.is_colliding() or Global.get_matrix(xcell, ycell-1, Global.room_matrix)!=Global.get_matrix(xcell, ycell, Global.room_matrix)) and Global.get_matrix(xcell, ycell-1, Global.room_matrix) != 0):
			can_move = false
		else:
			can_move = true
	return can_move

func wiggle():
	if not wiggling:
		wiggling = true
		while int(position.x) % tile_size == 0 and int(position.y) % tile_size == 0:
			match nextplan_move:
				Vector2.UP:
					t1=0
				Vector2.DOWN:
					t1=1
				Vector2.LEFT:
					t1=2
				Vector2.RIGHT:
					t1=3
			t2+=1
			if t2==4:
				t2=0
			$Sprite2d.region_rect=Rect2(t1*108,t2*36,36,36)
			await get_tree().create_timer(Global.mini_delay*3.5).timeout
		wiggling = false

func _ready():
	move_step(Vector2.ZERO,36)


func _process(delta):
	wiggle()
	del = delta

	if $DownRay.is_colliding() and $DownRay.get_collider().isgoal:
		$DownRay.add_exception($DownRay.get_collider())
	elif $UpRay.is_colliding() and $UpRay.get_collider().isgoal:
		$UpRay.add_exception($UpRay.get_collider())
	elif $LeftRay.is_colliding() and $LeftRay.get_collider().isgoal:
		$LeftRay.add_exception($LeftRay.get_collider())
	elif $RightRay.is_colliding() and $RightRay.get_collider().isgoal:
		$RightRay.add_exception($RightRay.get_collider())

	if moving or not (int(position.x) % tile_size == 0 and int(position.y) % tile_size == 0):
		can_move = false
		return

	if Global.get_matrix(xcell,ycell,Global.special_matrix) == 1:
		if may_slide(nextplan_move) == true and nextplan_move != Vector2.ZERO:
			ice_step(nextplan_move)
		else:
			control()

	elif Global.get_matrix(xcell,ycell,Global.special_matrix) == 2:
		if may_slide(Vector2.UP) == true:
			ice_step(Vector2.UP)
			nextplan_move=Vector2.UP
		else:
			control()

	elif Global.get_matrix(xcell,ycell,Global.special_matrix) == 3:
		if  may_slide(Vector2.DOWN) == true:
			ice_step(Vector2.DOWN)
			nextplan_move=Vector2.DOWN
		else:
			control()

	elif Global.get_matrix(xcell,ycell,Global.special_matrix) == 4:
		if may_slide(Vector2.LEFT) == true:
			ice_step(Vector2.LEFT)
			nextplan_move=Vector2.LEFT
		else:
			control()

	elif Global.get_matrix(xcell,ycell,Global.special_matrix) == 5:
		if  may_slide(Vector2.RIGHT) == true:
			ice_step(Vector2.RIGHT)
			nextplan_move=Vector2.RIGHT
		else:
			control()

	elif Global.get_matrix(xcell, ycell, Global.special_matrix) == 0:
		control()

func move_step(dir: Vector2,num) -> void:
	match dir:
		Vector2.UP:
			t1=0
		Vector2.DOWN:
			t1=1
		Vector2.LEFT:
			t1=2
		Vector2.RIGHT:
			t1=3
	moving = true
	position += dir * Global.step_size
	await get_tree().create_timer(Global.mini_delay).timeout
	while int(position.x) % tile_size != 0 or int(position.y) % tile_size != 0:
		t2+=1
		t2 = t2 % 4
		$Sprite2d.region_rect=Rect2(t1*108+num,t2*36,36,36)
		position += dir * Global.step_size
		await get_tree().create_timer(Global.mini_delay).timeout
	last_move = dir
	xcell = (position.x - (int(position.x) % 36)) / 36
	ycell = (position.y - (int(position.y) % 36)) / 36
	Global.x = xcell
	Global.y = ycell
	Global.moves +=1
	moving = false
	
func ice_step(dir: Vector2) -> void:
	if not (Global.toggle or Global.clear):
		moving = true
		position += dir * Global.step_size
		await get_tree().create_timer(Global.mini_delay).timeout

		while int(position.x) % tile_size != 0 or int(position.y) % tile_size != 0:
			position += dir * Global.step_size
			await get_tree().create_timer(Global.mini_delay).timeout
		last_move = dir
		xcell = (position.x - (int(position.x) % 36)) / 36
		ycell = (position.y - (int(position.y) % 36)) / 36
		Global.x = xcell
		Global.y = ycell
		moving = false
