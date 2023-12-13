extends Node

func _ready():
	var file = FileAccess.open("day_4_input.txt", FileAccess.READ)
	var total_val = 0
	while not file.eof_reached():
		var line = Array(file.get_line().split(" ", false))
		var winning_nums = []
		var points = 0
		var pos = 2
		while pos <= line.size() - 1 and line[pos] != "|":
			if line[pos].is_valid_int():
				winning_nums.append(line[pos])
			pos += 1
		while pos <= line.size() - 1:
			if winning_nums.has(line[pos]):
				if points == 0:
					points = 1
				else:
					points = points * 2
			pos += 1
		total_val += points
	print(total_val)
	file.close()
	part2()

func part2():
	var file = FileAccess.open("day_4_input.txt", FileAccess.READ)
	var total_val = 0
	var card_copy = {}
	while not file.eof_reached():
		var line = Array(file.get_line().split(" ", false))
		if line.size() > 1:
			var winning_nums = []
			var card_num = line[1].to_int()
			var pos = 2
			var wins = 0
			var copies = card_copy.get(card_num, 1)
			while pos <= line.size() - 1 and line[pos] != "|":
				if line[pos].is_valid_int():
					winning_nums.append(line[pos])
				pos += 1
			while pos <= line.size() - 1:
				if winning_nums.has(line[pos]):
					wins += 1
				pos += 1
			total_val += copies
			for x in wins:
				card_copy[card_num + x + 1] = card_copy.get(card_num + x + 1, 1) + copies
	print(total_val)
	file.close()
