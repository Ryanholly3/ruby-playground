
class RpnCalculator

  def initialize
    @expression = []
    @stack = []
  end

  def run
    puts "Welcome to Reverse Polish Calculator!"
    puts "Enter a valid RPN expression, then press enter to solve"
    puts "If you'd like to quit the application, press q."
    enter_expression
  end

  def enter_expression
    input = $stdin.gets.chomp
    num = Integer(input)

    #case where input can be converted to integer
    puts "type of #{num.class}"
    validate_character(num)
  rescue ArgumentError
    #case where string input could not be converted to integer
    validate_character(input)
  end

  def validate_character(value)
    if value.is_a? Integer
      @expression.push(value)
      puts "an integer!"
    elsif value == "+" || value == "-" || value == "*" || value == "/"
      @expression.push(value)
      puts "an opperand!"
    elsif value == "="
      validate_expression
    else
      puts "invalid character, try again!"
      enter_expression
    end
    validate_expression
  end

  def validate_expression
    exitApp if @expression.include? "q"
    calculate
  end

  def calculate
    puts "here's your expression: #{@expression}"
  end

  def invalidCharacter
    puts "you entered an invalid expression, try again."
    run
  end

  def exitApp
    puts "goodbye!"
    exit!
  end
end
