class RPNCalculator
  
  def initialize
    @operands = []
  end
  
  def input_value(value)
    result = if value_is_operator?(value)
      perform_operation(value)
    elsif value_is_numeric?(value)
      push_operand(value)
    else
      raise RPNCalculatorError, "Invalid input value"
    end
    if is_integer_like?(result)
      return result.to_i
    else
      return result
    end
  end
  
  private
  
  def value_is_operator?(value)
    !value.nil? && value.kind_of?(String) && ["+", "-", "*", "/"].include?(value)
  end
  
  def validate_operator_for_operands(operator)
    if operator == "/" && @operands.last == 0
      raise RPNCalculatorError, "Cannot divide by zero"
    elsif @operands.size < 2
      raise RPNCalculatorError, "Not enough operands to perform operation"
    end
  end
  
  def value_is_numeric?(value)
    true if Float(value) rescue false
  end

  def push_operand(operand)
    @operands.push(operand.to_f)
    return @operands.last
  end

  def perform_operation(operator)
    validate_operator_for_operands(operator)
    
    operand_2 = @operands.pop
    operand_1 = @operands.pop
    
    # Never had thought about converting a string to anoperator before. This was fun.
    
    result = operand_1.public_send(operator, operand_2)
    push_operand(result)
    return result
  end
  
  def is_integer_like?(value)
    value % 1 == 0
  end

end

class RPNCalculatorError < StandardError; end