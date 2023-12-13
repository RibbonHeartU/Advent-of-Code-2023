extends Node
#String.find(":")

func _ready():
	var file = FileAccess.open("day_5_input.txt", FileAccess.READ)
	var seeds = Array(file.get_line().split(" ", false)).slice(1)
	for s in seeds.size():
		seeds[s] = seeds[s].to_int()
	var map = []
	while not file.eof_reached():
		var line = file.get_line()
		#check for line with new map info
		if line.find(":") != -1:
			#move new map info over to the seed if found
			if not map.is_empty():
				for x in seeds.size():
					if map[x] >= 0:
						seeds[x] = map[x]
			#reset map info with default placeholder
			map = []
			for x in seeds.size():
				map.append(-1)
		elif not line.is_empty():
			line = Array(line.split(" ", false))
			for m in line.size():
				line[m] = line[m].to_int()
			for s in seeds.size():
				#if the seed number is within the source range and a mapping has not already been found
				if map[s] < 0 and seeds[s] >= line[1] and seeds[s] <= line[1] + line[2]:
					#add the new to the appropriate map slot
					map[s] = line[0] + (seeds[s] - line[1])
	#final replace
	for x in seeds.size():
		if map[x] >= 0:
			seeds[x] = map[x]
	print(seeds.min())
	file.close()
