# Reverse Polish Notation Calculator
  
A simple `RPNCalculator` class that supports the four basic arithmetic operators.

It only has one public Method:
  
`input_value(value)`  
_Returns `value` if it passes validation and is numeric. Performs operation and returns result if `value` is an operator._

## Error Handling

Invalid operations raise a `RPNCalculatorError` error.


## Command Line Usage

If you'd prefer to interact with the calculator via your console run:

    ruby interactive_rpn_calculator.rb

Errors are output to the console

Exit with `q`

## Known Issues

**Infinity**  
Handling of Infinity is rather limited. As this was a demo project and primarily based around the command line input where inputing Infinity is not practical, it was not given much effort to solve for the Infinity problem.

**Limited Function Support**  
At this time, it only supports the four standard arithmetic operators, `+` `-` `*` and `/`.

## Testing

Run tests with `ruby test_rpn_calculator.rb`

## License

MIT