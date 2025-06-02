extends Node

func _ready() -> void:
	example_numbers()
	example_dictionary()

func example_numbers() -> void:
	var maybe_number: Optional = Optional.of_nullable(42)
	maybe_number.if_present(print)
	
	var result: int = maybe_number.map(func(v): return v * 2).unwrap_or(0)
	print(result)

func example_dictionary() -> void:
	var dictionary: Dictionary = {
		"Void": "Stepper",
		"GDScript": "Optional"
	}
	var maybe_dictionary_entry_1: Optional = Optional.of_nullable(dictionary.get("Void"))
	if maybe_dictionary_entry_1.is_present():
		print(maybe_dictionary_entry_1.unwrap())
		
	var maybe_dictionary_entry_2: Optional = Optional.of_nullable(dictionary.get("Wrong"))
	print(maybe_dictionary_entry_2.unwrap_or("Alternative"))
