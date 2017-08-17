require "./instruction.cr"

class Interpreter
  # The 'stack' in our Stack Machine.
  property stack : Array(Float64)
  # A table of variables and their current values.
  property variables : Hash(String, Float64)
  # The list of instructions to be interpreted.
  property instructions : Array(Instruction)

  def initialize(@instructions : Array(Instruction))
    @stack = [] of Float64
    @variables = {} of String => Float64
  end

  def run
    # Attempt to remove the first element from `instructions`. Return nil if none exists.
    while (inst = instructions.shift?)
      case inst.type
      when InstructionType::PUSH
        # PUSH <value>
        # Push <value> onto the stack.
        @stack.push(inst.args[0].to_f64)
      when InstructionType::STORE
        # STORE <name>
        # Pop the top value from the stack and store it as the variable <name>.
        @variables[inst.args[0]] = @stack.pop
      when InstructionType::LOAD
        # LOAD <name>
        # Push the value of the variable <name> onto the stack.
        @stack.push(@variables[inst.args[0]])
      when InstructionType::ADD
        # ADD
        # Pop the two values at the top of the stack, add them together, and push the result.
        b = @stack.pop
        a = @stack.pop
        @stack.push(a + b)
      when InstructionType::SUBTRACT
        # SUBTRACT
        # Pop the two values at the top of the stack, subtract them, and push the result.
        b = @stack.pop
        a = @stack.pop
        @stack.push(a - b)
      when InstructionType::MULTIPLY
        # MULTIPLY
        # Pop the two values at the top of the stack, multiply them, and push the result.
        b = @stack.pop
        a = @stack.pop
        @stack.push(a * b)
      when InstructionType::DIVIDE
        # DIVIDE
        # Pop the two values at the top of the stack, divide them, and push the result.
        b = @stack.pop
        a = @stack.pop
        @stack.push(a / b)
      end
    end
  end
end
