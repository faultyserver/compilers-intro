require "./lexer.cr"
require "./parser.cr"
require "./interpreter.cr"

# Parse the source code into instructions.
parser = Parser.new(%q(
  @a = 2 + 2
  @b = 1 + 3 * 3
  @c = b / a
))
parser.parse_program

# Run those instructions.
vm = Interpreter.new(parser.instructions)
vm.run

# Output results to the user.
puts "Stack contents: #{vm.stack}"
puts "Variables:"
vm.variables.each do |name, value|
  puts "\t#{name} = #{value}"
end
