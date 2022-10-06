def is_valid_brackets_expression(input)
    stack = []
    brackets = { '{' => '}', '[' => ']', '(' => ')' }

    for i in 0..input.length
        if brackets.has_key? input[i]
            stack.push(input[i])
        elsif brackets.has_value? input[i]
            if stack.pop != brackets.key(input[i])
                return false
            end
        end
    end

    return stack.empty?
end

def main
    while true
        print "\nType an expression to check or \"q\" to exit\n>"
        input = gets.chomp.downcase

        if input == "q"
            puts "See you later!"
            break
        else
            puts ("\"" + input + "\" => " + is_valid_brackets_expression(input).to_s)
        end
    end 
end

main