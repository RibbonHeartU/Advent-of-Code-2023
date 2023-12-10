extends Node
var digits = ["one","two","three","four","five","six","seven","eight","nine"]

func _ready():
	var file = FileAccess.open("day_1_input.txt", FileAccess.READ)
	var total_val = 0
	while not file.eof_reached():
		var line = file.get_line()
		var first_val = null
		var last_val = null
		for i in line.length():
			var chr = line.substr(i,1)
			if chr.is_valid_int():
				var num = chr.to_int()
				if first_val == null:
					first_val = num
				last_val = num
		if first_val != null:
			total_val += first_val * 10 + last_val
	print(total_val)
	file.close()
	part2()

func part2():
	var file = FileAccess.open("day_1_input.txt", FileAccess.READ)
	var total_val = 0
	while not file.eof_reached():
		var line = file.get_line()
		var first_val = null
		var last_val = null
		for i in line.length():
			var chr = line.substr(i,1)
			if chr.is_valid_int():
				var num = chr.to_int()
				if first_val == null:
					first_val = num
				last_val = num
			else:
				for x in digits.size():
					var rest = line.substr(i,digits[x].length())
					if rest == digits[x]:
						if first_val == null:
							first_val = x + 1
						last_val = x + 1
		if first_val != null:
			total_val += first_val * 10 + last_val
	print(total_val)
	file.close()
