require_relative "rpn_calculator"
require "test/unit"

class TestAwesome < Test::Unit::TestCase


  # tests:
  # Invalid behavior (ex, an operator before two operands)
  # negative and decimal numbers
  # + - * /
  # Very large numbers
  # Very small numbers
  # Divide by zero
  
  def setup
    @calculator = RPNCalculator.new
  end
  
  
  def test_operator_before_two_operands
    @calculator.input_value("4")
    assert_raise RPNCalculatorError do
      @calculator.input_value("*")
    end
  end
  
  def test_negative_numbers
    @calculator.input_value("4")
    @calculator.input_value("-4")
    result = @calculator.input_value("*")
    assert_equal( -16, result)
  end
  
  def test_decimal_numbers
    @calculator.input_value("1.5")
    @calculator.input_value("34.7")
    result = @calculator.input_value("+")
    assert_equal( 36.2, result)
  end
  
  def test_addition_and_substraction
    @calculator.input_value("1")
    @calculator.input_value("2")
    @calculator.input_value("+")
    @calculator.input_value("5")
    @calculator.input_value("-")
    @calculator.input_value("12.5")
    result = @calculator.input_value("+")
    assert_equal( 10.5, result)
  end
  
  def test_multiplication_and_division
    @calculator.input_value("5")
    @calculator.input_value("10")
    @calculator.input_value("*")
    @calculator.input_value("25")
    result = @calculator.input_value("/")
    assert_equal( 2, result)
  end
  
  def test_divide_by_zero
    @calculator.input_value("5")
    @calculator.input_value("10")
    @calculator.input_value("*")
    @calculator.input_value("50")
    @calculator.input_value("-")
    assert_raise RPNCalculatorError do
      @calculator.input_value("/")
    end
  end
  
  def test_invalid_input
    @calculator.input_value("5")
    @calculator.input_value("10")
    assert_raise RPNCalculatorError do
      @calculator.input_value("12a")
    end
    assert_raise RPNCalculatorError do
      @calculator.input_value("thirty")
    end
    assert_raise RPNCalculatorError do
      @calculator.input_value("")
    end
  end
    
  # These last tests are testing the examples found in the gist:
  # https://gist.github.com/nilbus/29b0752086f59af3e2bb
  
  def test_example_1
    @calculator.input_value(5)
    @calculator.input_value(8)
    result = @calculator.input_value("+")
    assert_equal( 13, result )
  end
  
  def test_example_2
    @calculator.input_value(-3)
    @calculator.input_value(-2)
    @calculator.input_value("*")
    @calculator.input_value(5)
    result = @calculator.input_value("+")
    assert_equal( 11, result )
  end

  def test_example_3
    @calculator.input_value(2)
    @calculator.input_value(9)
    @calculator.input_value(3)
    @calculator.input_value("+")
    result = @calculator.input_value("*")
    assert_equal( 24, result )
  end

  def test_example_4
    @calculator.input_value(20)
    @calculator.input_value(13)
    @calculator.input_value("-")
    @calculator.input_value(7)
    @calculator.input_value(2)
    result = @calculator.input_value("/")
    assert_equal( 3.5, result )
  end

 
end