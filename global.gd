extends Node

var mini_delay := 0.02
var full_delay := 0.03
var wiggle_delay = full_delay*5
var room_matrix := []
var hurt_matrix := []
var special_matrix := []
var cols = 17
var rows = 14
var GridT = 0.5
var goals := 0
var fgoals := 0
var toggle = false
var moves := 0
var clear = false
var level = 1
var save:=[[0,0,0,0,1],\
[1,50,40,30,1],[2,78,68,58,0],[3,73,63,53,0],[4,105,95,85,0],[5,65,55,45,0],\
[6,80,70,60,0],[7,86,76,66,0],[8,108,98,88,0],[9,48,38,28,0],[10,66,56,46,0],\
[11,62,52,42,0],[12,118,108,98,0],[13,109,99,89,0],[14,115,105,95,0],[15,730,700,670,0]]



func get_matrix(x,y,mat):
	if x <= cols and y <= rows and x >= 0 and y >= 0:
		return mat[x][y]
	else:
		return 999
func prepare(n):
	fgoals = 0
	goals = 0
	fill_rect(room_matrix,0,0,cols,rows,999)
	fill_rect(special_matrix,0,0,cols,rows,0)
	match n:
		1:
			cols = 10
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1) #bg
			fill_rect(room_matrix,0,0,0,1,999)
			fill_rect(room_matrix,5,0,7,0,999)
			fill_rect(room_matrix,0,7,1,8,999)
			fill_rect(room_matrix,9,6,10,8,999)
			fill_rect(room_matrix,3,3,6,5,999)
			fill_rect(room_matrix,4,3,6,4,1)

		2:
			cols = 10
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1) #bg
			fill_rect(room_matrix,6,0,10,5,999)
			fill_rect(room_matrix,1,0,3,0,999)
			fill_rect(room_matrix,4,2,5,3,999)
			room_matrix[5][2]=1
			fill_rect(room_matrix,0,5,2,6,999)
			fill_rect(room_matrix,6,6,8,6,999)

		3:
			cols = 10
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1) #bg
			fill_rect(room_matrix,2,0,2,2,999)
			room_matrix[4][0]=999
			fill_rect(room_matrix,0,4,1,6,999)
			fill_rect(room_matrix,2,5,7,5,999)
			fill_rect(room_matrix,4,2,4,4,999)
			fill_rect(room_matrix,7,1,7,3,999)

		4:
			cols = 10
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1) #bg
			fill_rect(room_matrix,2,4,7,6,999)
			fill_rect(room_matrix,2,4,5,5,1)
			fill_rect(room_matrix,0,4,0,5,999)
			fill_rect(room_matrix,5,0,7,0,999)
			fill_rect(room_matrix,8,1,8,2,999)
			room_matrix[1][8]=999
			room_matrix[3][7]=999

		5:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1) #bg
			fill_rect(room_matrix,6,0,cols,rows,2)
			room_matrix[5][4]=0
			fill_rect(room_matrix,0,5,2,8,999)
			fill_rect(room_matrix,1,5,2,6,1)
			room_matrix[2][7]=1
			fill_rect(room_matrix,3,0,5,1,999)
			room_matrix[3][1]=1
			fill_rect(room_matrix,9,5,11,8,999)
			fill_rect(room_matrix,9,5,10,6,2)
			room_matrix[9][7]=2
			fill_rect(room_matrix,6,0,8,1,999)
			room_matrix[8][1]=2

		6:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,5,8,1)
			fill_rect(room_matrix,6,0,11,3,2)
			fill_rect(room_matrix,6,4,cols,rows,3)
			room_matrix[5][6]=0
			room_matrix[5][1]=0
			fill_rect(room_matrix,11,4,11,4,0)
			fill_rect(room_matrix,3,0,5,0,999)
			fill_rect(room_matrix,9,0,10,3,999)
			fill_rect(room_matrix,9,0,9,1,2)
			fill_rect(room_matrix,0,7,2,8,999)
			fill_rect(room_matrix,1,7,2,7,1)
			room_matrix[6][8]=999
			fill_rect(room_matrix,9,6,11,8,999)

		7:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,11,3,1)
			fill_rect(room_matrix,0,4,5,4,2)
			fill_rect(room_matrix,6,4,11,4,3)
			fill_rect(room_matrix,0,5,cols,rows,4)
			fill_rect(room_matrix,5,5,6,5,0)
			room_matrix[0][3]=0
			room_matrix[11][3]=0
			fill_rect(room_matrix,5,0,6,3,999)
			fill_rect(room_matrix,0,6,1,8,999)
			fill_rect(room_matrix,4,7,11,8,999)
			fill_rect(room_matrix,8,7,10,8,4)
			fill_rect(room_matrix,5,7,6,7,4)

		8:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,7,8,1)
			fill_rect(room_matrix,8,0,11,8,2)
			fill_rect(room_matrix,4,6,7,8,2)
			fill_rect(room_matrix,4,3,7,5,3)
			room_matrix[5][2]=0
			room_matrix[6][6]=0
			fill_rect(room_matrix,0,7,3,8,999)
			room_matrix[1][7]=1
			fill_rect(room_matrix,8,0,11,1,999)
			room_matrix[10][1]=2
			room_matrix[1][1]=999
			room_matrix[2][4]=999
			room_matrix[4][5]=999
			room_matrix[7][3]=999
			room_matrix[9][4]=999
			room_matrix[10][7]=999

		9:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,11,3,1)
			fill_rect(room_matrix,0,4,cols,rows,2)
			fill_rect(room_matrix,5,0,7,1,999)
			fill_rect(room_matrix,11,2,11,3,999)
			fill_rect(room_matrix,0,6,1,8,999)
			fill_rect(room_matrix,1,6,1,7,2)
			room_matrix[10][4]=0
			fill_rect(special_matrix,2,5,9,7,1)

		10:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1)
			fill_rect(room_matrix,3,0,3,8,999)
			fill_rect(room_matrix,8,0,8,7,999)
			fill_rect(room_matrix,3,3,8,5,1)
			fill_rect(special_matrix,0,3,11,5,1)

		11:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1)
			fill_rect(room_matrix,5,1,9,7,999)
			fill_rect(room_matrix,1,0,1,3,999)
			fill_rect(room_matrix,6,1,9,4,1)
			fill_rect(room_matrix,5,6,9,6,1)
			room_matrix[10][6]=999
			room_matrix[0][5]=999
			fill_rect(special_matrix,11,6,11,8,2)
			fill_rect(special_matrix,9,0,9,1,3)
			special_matrix[4][6]=4
			special_matrix[0][4]=5
			fill_rect(special_matrix,5,0,8,6,5)
			fill_rect(special_matrix,5,1,8,5,0)
			fill_rect(special_matrix,5,8,10,8,5)

		12:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1)
			fill_rect(room_matrix,0,3,5,5,2)
			fill_rect(room_matrix,0,6,11,8,2)
			room_matrix[5][4]=0
			special_matrix[11][8]=2
			special_matrix[6][5]=2
			special_matrix[11][0]=3
			special_matrix[11][5]=4
			special_matrix[11][7]=4
			special_matrix[6][4]=5
			special_matrix[0][6]=5
			fill_rect(room_matrix,5,1,9,2,999)
			fill_rect(room_matrix,6,1,6,2,1)
			fill_rect(room_matrix,1,4,3,8,999)
			fill_rect(room_matrix,1,6,3,6,2)
			fill_rect(room_matrix,6,7,8,7,999)
			room_matrix[9][4]=999

		13:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1)
			fill_rect(room_matrix,6,0,11,4,2)
			fill_rect(room_matrix,0,4,5,8,3)
			fill_rect(room_matrix,6,5,cols,rows,4)
			fill_rect(room_matrix,5,1,5,2,0)
			fill_rect(room_matrix,5,6,5,7,0)
			fill_rect(room_matrix,2,4,3,4,0)
			fill_rect(room_matrix,8,4,9,4,0)
			fill_rect(special_matrix,5,1,5,2,4)
			fill_rect(special_matrix,6,1,6,2,1)
			fill_rect(special_matrix,5,6,5,7,1)
			fill_rect(special_matrix,6,6,6,7,5)
			fill_rect(special_matrix,2,4,3,4,3)
			fill_rect(special_matrix,2,3,3,3,1)
			fill_rect(special_matrix,8,4,9,4,2)
			fill_rect(special_matrix,8,5,9,5,1)
			fill_rect(room_matrix,2,1,3,2,999)
			fill_rect(room_matrix,8,2,11,2,999)
			fill_rect(room_matrix,0,6,2,6,999)
			fill_rect(room_matrix,10,8,11,8,999)
			room_matrix[5][8]=999

		14:
			cols = 11
			rows = 8
			fill_rect(room_matrix,0,0,cols,rows,1)
			fill_rect(room_matrix,6,3,11,5,2)
			fill_rect(room_matrix,0,6,11,8,2)
			fill_rect(special_matrix,2,1,9,7,1)
			fill_rect(special_matrix,5,1,6,1,4)
			special_matrix[9][7]=2
			special_matrix[2][1]=3
			special_matrix[9][1]=4
			special_matrix[2][7]=5
			room_matrix[2][5]=0
			room_matrix[9][3]=0
			fill_rect(special_matrix,3,2,8,6,0)
			fill_rect(room_matrix,5,0,6,8,999)
			room_matrix[5][5]=1
			room_matrix[6][3]=2
			fill_rect(room_matrix,5,1,6,1,1)
			fill_rect(room_matrix,5,7,6,7,2)
			fill_rect(room_matrix,0,8,2,8,999)
			fill_rect(room_matrix,9,0,11,0,999)

		15:
			cols = 31
			rows = 17
			fill_rect(room_matrix,0,0,10,8,1)
			fill_rect(room_matrix,11,0,20,7,3)
			fill_rect(room_matrix,21,0,31,10,4)
			fill_rect(room_matrix,0,9,8,17,4)
			fill_rect(room_matrix,10,11,24,17,3)
			fill_rect(room_matrix,25,11,31,17,2)
			fill_rect(room_matrix,6,4,15,10,2)
			fill_rect(room_matrix,16,8,24,13,1)
			fill_rect(special_matrix,7,5,20,6,1)
			fill_rect(special_matrix,18,0,19,6,1)
			fill_rect(special_matrix,2,15,24,16,1)

func _ready():
	for x in range(64):
		var c := []
		var r:=[]
		for y in range(64):
			c.append(0)
			r.append(999)
		room_matrix.append(r)
		special_matrix.append(c)
		
func fill_rect(m, a, b, c, d, v):

	for x in range(a, c + 1):
		for y in range(b, d + 1):
			m[x][y] = v

func _process(_delta: float) -> void:
	pass
