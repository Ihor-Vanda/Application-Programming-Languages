def split_cake(cake)
    matrix = get_matrix(cake)

    rows = matrix.length
    cols = matrix[0].length

    possible_piece_x = []
    for i in 1..rows
        possible_piece_x << i if matrix.length % i == 0
    end

    possible_piece_y = []
    for i in 1..cols
        possible_piece_y << i if matrix[0].length % i == 0
    end

    solutions = []
    for i in 0...possible_piece_x.length
        for j in 0...possible_piece_y.length
            pieces = []
            possible = true
            row_n = rows / possible_piece_x[i]
            col_n = cols / possible_piece_y[j]

            x = 0
            while x < rows
                y = 0
                while y < cols
                    sub_m = get_sub_matrix(matrix, x, row_n, y, col_n)
                    
                    if check_raisin(sub_m) != 1
                        possible = false
                        break
                    end
                    pieces << sub_m
                    y += col_n
                end
                break if !possible
                x += row_n
            end
            if possible
                solutions << pieces
            end 
        end
    end
    return solutions
end

def print_result(solutions)
    return nil if solutions.nil?
    print "Num of solution: #{solutions.length}\n\n"
    
    for i in 0...solutions.length
        puts "========Solution #{i + 1}========"
        for j in 0...solutions[i].length
            puts "Piece #{j + 1}"
            print_matrix(solutions[i][j])
        end
        puts "=========================="
    end
end

def check_raisin(matrix)
    count = 0
    for i in 0...matrix.length
        for j in 0...matrix[i].length
            if matrix[i][j] == "o"
                count += 1
            end
        end
    end
    return count
end

def get_matrix(cake)
    array = cake.split("\n")
    matrix = []

    for i in 0...array.length
        matrix[i] = array[i].split("")
    end
    return matrix
end

def get_sub_matrix(matrix, x, row_num, y, col_num)
    if matrix.nil?
        return nil 
    end

    sub_matrix = []

    for i in 0...row_num
        sub_matrix[i] = []
        for j in 0...col_num
            sub_matrix[i][j] = matrix[i + x][j + y]
        end
    end
    return sub_matrix
end

def print_matrix(matrix)
    for i in 0...matrix.length
        for j in 0...matrix[i].length
            print "#{matrix[i][j]}"
        end
        puts ""
    end
    puts ""
end

def main
    cake =  "........\n" +
            "..o.....\n" +
            "...o....\n" +
            "........\n"

    matrix = get_matrix(cake)
    puts "======Cake======"
    print_matrix(matrix)

    solutions = split_cake(cake)
    print_result(solutions)
end

main