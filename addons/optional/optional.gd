@tool
extends RefCounted

class_name Optional

var value: Variant = null

static func of(v: Variant) -> Optional:
	assert(v != null, "Optional.of() received a null value. Use Optional.of_nullable() instead if nulls are expected.")
	var optional := Optional.new()
	optional.value = v
	return optional

static func of_nullable(v: Variant) -> Optional:
	if v == null:
		return empty()
	return of(v)

static func empty() -> Optional:
	var optional := Optional.new()
	optional.value = null
	return optional

func is_present() -> bool:
	return value != null

func is_absent() -> bool:
	return value == null

func unwrap() -> Variant:
	assert(is_present(), "Tried to unwrap an empty Optional. Check is_present() before calling unwrap().")
	return value

func unwrap_or(default_val: Variant) -> Variant:
	return value if is_present() else default_val

func map(f: Callable) -> Optional:
	assert(f.get_argument_count() == 1, "Optional.map() expects a Callable that takes exactly one argument.")
	return Optional.of_nullable(f.call(value)) if is_present() else Optional.empty()

func flat_map(f: Callable) -> Optional:
	assert(f.get_argument_count() == 1, "Optional.flat_map() expects a Callable that takes exactly one argument.")
	if is_present():
		var result = f.call(value)
		assert(result is Optional, "flat_map() must return an Optional instance.")
		return result
	return Optional.empty()

func if_present(f: Callable) -> void:
	if is_present():
		f.call(value)

func if_absent(f: Callable) -> void:
	if is_absent():
		f.call()
