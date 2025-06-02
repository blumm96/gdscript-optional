## License

This project is licensed under the [MIT License](LICENSE).

# Optional for Godot (GDScript)

A Java-style `Optional<T>` implementation for Godot Engine (GDScript). Helps you safely wrap nullable values and avoid unsafe null checks.

## Features

- `Optional.of(value)` – requires a non-null value
- `Optional.of_nullable(value)` – wraps value, allows null
- `Optional.empty()` – explicitly empty optional
- `unwrap()` – get the value or assert
- `unwrap_or(default)` – get value or fallback
- `map(func)` – transform value if present
- `flat_map(func)` – transform with function returning Optional

## Example

```gdscript
var maybe_number = Optional.of_nullable(42)
maybe_number.if_present(func(v): print("Value is: ", v))

var result = maybe_number.map(func(v): return v * 2).unwrap_or(0)
print(result) # -> 84
```

## Installation

1. Copy the `addons/optional/` folder into your project.
2. Enable the plugin in Project Settings → Plugins.
3. Use `Optional` in your scripts.
