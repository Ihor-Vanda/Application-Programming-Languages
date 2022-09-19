moves = ['Камень', 'Ножницы', 'Бумага']

while true
    puts "\nСделайте ход: 0 - Камень, 1 - Ножницы, 2 - Бумага, 3 - Выход"
    
    user_move = gets.to_i
    comp_move = rand(3)

    if user_move == 3
        abort
    end

    puts "Ход компьютера: " + moves[comp_move]
    puts "Ваш ход: " + moves[user_move]
 
    if user_move == comp_move
        puts "Ничья"
    elsif user_move == 0 && comp_move == 1 # камень VS ножницы
        puts "Вы победили"
    elsif user_move == 1 && comp_move == 2 # ножницы VS бумага
        puts "Вы победили"
    elsif user_move == 2 && comp_move == 0 # бумага VS камень
        puts "Вы победили"
    else
        puts "Вы проиграли"
    end
end
