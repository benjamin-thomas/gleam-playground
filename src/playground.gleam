import gleam/io
import gleam/string_builder as sb
import gleam/int
import gleam/float
import gleam/string

pub fn add(a, b) {
  a + b
}

pub fn multiply(a, b) {
  a * b
}

pub fn add_float(a, b) -> Float {
  a +. b
}

// No Unit type
pub fn greet() -> Nil {
  io.println("Hello, World!")
}

pub fn print_one_plus_two() -> Nil {
  sb.from_string("1 + 2 = ")
  |> sb.append(int.to_string(1 + 2))
  |> sb.to_string()
  |> io.println
}

pub fn print_two_plus_three() -> Nil {
  sb.new()
  |> sb.append("2.0 + 3.0 = ")
  |> sb.append(float.to_string(2. +. 3.))
  |> sb.to_string()
  |> io.println
}

pub fn list_a() -> List(Int) {
  [1, 2, 3, 4]
}

pub fn list_b() -> List(Int) {
  [1, ..[2, 3, 4]]
}

pub fn num_to_string(num) -> String {
  case num {
    0 -> "Zero"
    1 -> "One"
    2 -> "Two"
    _n -> "Some other number"
  }
}

pub fn main() {
  greet()

  print_one_plus_two()
  print_two_plus_three()

  let one_million = int.to_string(1_000_000_000)

  string.concat(["1 million = ", one_million])
  |> io.println

  let tuple = #(list_a(), list_b())
  ["Both lists are equal: ", string.inspect(tuple)]
  |> string.concat()
  |> io.println()

  // Access the tuple item via its index, like Rust.
  ["First list: ", string.inspect(tuple.0)]
  |> string.concat()
  |> io.println()

  ["Second list: ", string.inspect(tuple.1)]
  |> string.concat()
  |> io.println()

  io.println(string.concat(["1 --> ", num_to_string(1)]))
  io.println(string.concat(["9 --> ", num_to_string(9)]))
}
