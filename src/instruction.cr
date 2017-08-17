enum InstructionType
  PUSH
  STORE
  LOAD
  ADD
  SUBTRACT
  MULTIPLY
  DIVIDE
end

class Instruction
  property type : InstructionType
  # Arguments that the instruction requires to execute properly.
  # For example, `PUSH` needs an argument of _what_ to push onto the stack.
  property args : Array(String)

  def initialize(@type : InstructionType, @args = [] of String); end
end
