require_relative 'rpn_calculator'

calculator = RPNCalculator.new

puts "Reverse Polish Notation calculator"
puts "Created by Ben McFadden"

loop do
  print '> '
  input = gets

  break if input.nil? || input.chomp == "q"

  begin
    puts calculator.input_value(input.chomp)
  rescue RPNCalculatorError => e
    puts e.message
  end
end