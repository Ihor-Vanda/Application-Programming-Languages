
puts "Input first number"
firstNum = gets.to_i

#if !firstNum.is_a?(Integer)
#    puts "Is not integer number"
#    exit 0
#end

puts "Input second number"
secondNum = gets.to_i

#if !firstNum.is_a?(Integer) 
#    puts "Is not integer number"
#    exit 0
#end 

puts "Input operation (+, -, *, /): "
operation = gets.chomp

case operation
when "+"
    puts firstNum + secondNum
when "-"
    puts firstNum - secondNum
when "*"
    puts firstNum * secondNum
when "/"
    begin
        puts firstNum / secondNum
    rescue => ZeroDivisionError
        puts "Can not division by zero"        
    end
else
    puts "Incorrect operation"
end