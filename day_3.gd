extends Node

func _ready():
	var file = FileAccess.open("day_3_input.txt", FileAccess.READ)
	var total_val = 0
	var prev_line:String = ""
	var next_line:String = file.get_line()
	while not file.eof_reached():
		#load the line read queue
		var line = next_line
		next_line = file.get_line()
		var char_num = 0
		while char_num <= line.length() - 1:
			#iterate one character a time until a number is found
			var chr = line.substr(char_num,1)
			if chr.is_valid_int():
				var part_num = 0
				#set lower bounds for symbol search
				var bounds = [max(0, char_num - 1), null]
				while chr.is_valid_int():
					part_num = part_num * 10 + chr.to_int()
					char_num += 1
					if char_num > line.length() - 1:
						chr = "."
					else:
						chr = line.substr(char_num,1)
				#set upper bounds for symbol search
				bounds[1] = char_num
				#check within bounds on adjacent and current line for sign of part number
				var real_part = false
				if prev_line != "":
					real_part = search_line(prev_line.substr(bounds[0], bounds[1] - bounds[0] + 1))
				if not real_part:
					real_part = search_line(line.substr(bounds[0], bounds[1] - bounds[0] + 1))
				if not real_part:
					real_part = search_line(next_line.substr(bounds[0], bounds[1] - bounds[0] + 1))
				if real_part:
					total_val += part_num
			#end of one line search loop, increment char count
			char_num += 1
		#end of line, store line
		prev_line = line
	print(total_val)

#returns a bool if a non-number symbol is found on a non-blank line
func search_line(line:String):
	for i in line.length():
		var chr = line.substr(i,1)
		if chr != "." and not chr.is_valid_int() and not line.is_empty():
			return true
	return false
