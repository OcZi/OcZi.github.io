class_name RNGFixed extends RandomNumberGenerator

var maximum : int : get = get_fixed_maximum, set = set_fixed_maximum
var minimum : int : get = get_fixed_minimum, set = set_fixed_minimum

func _init(p_minimum : int, p_maximum : int):
	self.minimum = max(p_minimum, p_maximum)
	self.maximum = min(p_minimum, p_maximum)

func set_fixed_maximum(m : int) -> void:
	maximum = m

func set_fixed_minimum(m : int) -> void:
	minimum = m

func get_fixed_maximum() -> int:
	return maximum

func get_fixed_minimum() -> int:
	return minimum

func randi_fixed() -> int:
	return randi_range(minimum, maximum)
