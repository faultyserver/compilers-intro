require "./token.cr"

class Lexer
  # The source code being lexed.
  property source : String
  # The current position in the source String.
  property pos : Int32
  # The token currently being lexed.
  property current_token : Token

  def initialize(@source : String)
    @pos = 0
    @current_token = Token.new
  end

  # Reset the current token
  def advance_token
    @current_token = Token.new
  end

  # Scan the source until the next token has been completed and return
  # that new token.
  def read_token
    # Ensure a clean slate before lexing the next token.
    advance_token

    # Switch over whatever the current character is.
    case current_char
    when '\0'
      read_char
      @current_token.type = TokenType::EOF
    when '+'
      read_char
      @current_token.type = TokenType::PLUS
    when '-'
      read_char
      @current_token.type = TokenType::MINUS
    when '*'
      read_char
      @current_token.type = TokenType::STAR
    when '/'
      read_char
      @current_token.type = TokenType::SLASH
    when '='
      read_char
      @current_token.type = TokenType::EQUAL
    when '('
      read_char
      @current_token.type = TokenType::LPAREN
    when ')'
      read_char
      @current_token.type = TokenType::RPAREN
    when '@'
      read_char
      @current_token.type = TokenType::AT
    when .ascii_whitespace?
      # Keep reading characters as long as they count as whitespace.
      while current_char.ascii_whitespace?
        read_char
      end
      @current_token.type = TokenType::WHITESPACE
    when .ascii_number?
      # Keep reading characters as long as they are numeric digits.
      while current_char.ascii_number?
        read_char
      end
      @current_token.type = TokenType::NUMBER
    when .ascii_letter?
      # Keep reading characters as long as they are alphabetic.
      while current_char.ascii_letter?
        read_char
      end
      @current_token.type = TokenType::NAME
    else
      raise "Unrecognized character `#{current_char}`."
    end

    # Return the newly read token
    @current_token
  end


  # Return the character at the current position in the source.
  private def current_char
    @source[@pos]? || '\0'
  end

  # Add the current character to the token buffer and advance the position
  # in the source by one character.
  private def read_char
    @current_token.value += current_char
    @pos += 1
  end
end
