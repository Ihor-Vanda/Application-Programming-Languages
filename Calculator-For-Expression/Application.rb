def is_digit? string
    return string[/^\d+$/]? true : false
end

def is_operator? string 
    operators = "+-*/^"
    return operators.include?(string) || is_trigonometry?(string)
end

def is_trigonometry? string
    return string == "cos" || string == "sin" || string == "tg" || string == "ctg"
end

def get_operation_priority(string)
    case string
    when "+", "-"
        return 1 
    when "*", "/"
        return 4 
    when "cos", "sin", "tg", "ctg"
        return 3
    when "^"
        return 2 
    else
        return 0
    end
end

def convert_to_prefix_expression(expression)
    operators = []
    operands = []

    formated_expression = ""
    for c in expression.split("")
        op = "()+-/*^"
        if op.include? c
            formated_expression += " #{c} "
        else
            formated_expression += c
        end
    end

    for c in formated_expression.split(" ").delete_if {|x| x == " "}
        if is_digit?(c) # число добавляем в стек операндов
            operands.push(c + " ")
        elsif is_operator?(c) # оператор добавляем в стек операторов 
            while operators.length != 0 && get_operation_priority(c) <= get_operation_priority(operators.last.strip)
                push_expression(operators, operands)
            end
            operators.push(c + " ")
        elsif c == "("
            operators.push(c)
        elsif c == ")" # заносим выражения в стек операндов
            while operators.length != 0  && operators.last != "("
                push_expression(operators, operands)
            end
            operators.pop # вытаскиваем открывающую скобку со стека
        end
    end
    # выстаскиваем все операторы и опренды из стека и стоим выражения
    while operators.length != 0 
        push_expression(operators, operands)
    end
    return operands.last
end

def push_expression(operators, operands)
    operator = operators.pop
    if !operator.nil?
        if is_trigonometry?(operator.strip)
            operand = operands.pop
            operands.push(operator + operand) if !operand.nil?
        else
            first_opd = operands.pop
            second_opd = operands.pop
            operands.push(operator + second_opd + first_opd) if !first_opd.nil? && !second_opd.nil?
        end
    end
end

def calculate_prefix_expression(expression)
    stack = []
    for i in expression.split(" ").reverse
        if is_digit?(i)
            stack.push(i.to_f)
        else
            case i
                when "+"
                    first_opd = stack.pop.to_f
                    second_opd = stack.pop.to_f
                    stack.push(first_opd + second_opd)
                when "-"
                    first_opd = stack.pop.to_f
                    second_opd = stack.pop.to_f
                    stack.push(first_opd - second_opd)
                when "*"
                    first_opd = stack.pop.to_f
                    second_opd = stack.pop.to_f
                    stack.push(first_opd * second_opd)
                when "/"
                    first_opd = stack.pop.to_f
                    second_opd = stack.pop.to_f
                    stack.push(first_opd / second_opd)
                when "^"
                    first_opd = stack.pop.to_f
                    second_opd = stack.pop.to_f
                    stack.push(first_opd ** second_opd)
                when "cos"
                    first_opd = stack.pop.to_f
                    stack.push(Math.cos(first_opd))
                when "sin"
                    first_opd = stack.pop.to_f
                    stack.push(Math.sin(first_opd))
                when "tg"
                    first_opd = stack.pop.to_f
                    stack.push(Math.tan(first_opd))
                when "ctg"
                    first_opd = stack.pop.to_f
                    stack.push(1/Math.tan(first_opd))
            end
        end
    end
  
    return stack.pop;
end

def main 
    print "Enter expression:\n>"
    expression = gets.chomp
    conv_expression = convert_to_prefix_expression(expression)
    puts "Expression in prefix notation: #{conv_expression}"
    puts "Result of expression: #{calculate_prefix_expression(conv_expression)}"
end

main