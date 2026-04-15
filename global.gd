extends Node

var mini_delay := 0.07
var step_size = 6
var full_delay := 0.04
var wiggle_delay = 0.175
var room_matrix := []
var special_matrix := []
var cols = 10
var rows = 8
var GridT = 0.5
var goals := 0
var fgoals := 0
var toggle = false
var moves := 0
var clear = false
var level = 20
var x := 0
var y := 0
var save:=[[0,0,0,0,1],\
[1,50,40,30,1],[2,78,68,58,1],[3,73,63,53,1],[4,150,135,120,1],[5,65,55,45,1],\
[6,80,70,60,1],[7,86,76,66,1],[8,108,98,88,1],[9,48,38,28,1],[10,66,56,46,1],\
[11,62,52,42,1],[12,118,108,98,1],[13,109,99,89,1],[14,115,105,95,1],[15,76,66,56,1],\
[16,85,80,75,1],[17,215,205,195,1],[18,148,138,128,1],[19,230,220,210,1],[20,730,700,670,1]]

func get_matrix(a,b,mat):
	if a <= cols and b <= rows and a >= 0 and b >= 0:
		return mat[a][b]
	else:
		return 999
func prepare(n):
	fgoals = 0
	goals = 0
	fill_rect(room_matrix,0,0,cols,rows,999)
	fill_rect(special_matrix,0,0,cols,rows,0)

func _ready():
	for a in range(64):
		var c := []
		var r:=[]
		for b in range(64):
			c.append(0)
			r.append(999)
		room_matrix.append(r)
		special_matrix.append(c)
		
func fill_rect(m, a, b, c, d, v):

	for f in range(a, c + 1):
		for g in range(b, d + 1):
			m[f][g] = v

func _process(_delta: float) -> void:
	pass
