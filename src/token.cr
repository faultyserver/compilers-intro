enum TokenType
  NAME        # [a-z]+
  NUMBER      # [0-9]+
  PLUS        # +
  MINUS       # -
  STAR        # *
  SLASH       # /
  EQUAL       # =
  LPAREN      # (
  RPAREN      # )
  AT          # @
  WHITESPACE  # spaces, newlines, tabs, etc.
  EOF         # End of File character
end

class Token
  property type : TokenType = TokenType::EOF
  property value : String = ""
end
