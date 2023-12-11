extends Node
var cube_count = {"red":12, "green":13, "blue":14}

func _ready():
	var file = FileAccess.open("day_2_input.txt", FileAccess.READ)
	var total_val = 0
	while not file.eof_reached():
		var line = Array(file.get_line().split(" "))
		var game_num = 0
		if line.size() > 1:
			game_num = line[1].to_int()
		for i in line.size():
			var val = line[i]
			for col in cube_count:
				var buffer = val.substr(0,col.length())
				if buffer == col:
					if line[i - 1].to_int() > cube_count[col]:
						game_num = 0
		total_val += game_num
	print(total_val)
