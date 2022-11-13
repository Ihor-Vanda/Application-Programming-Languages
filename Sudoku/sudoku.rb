def get_empty_cells(grid)
    empty_cells = []

    for i in 0...grid.length
        for j in 0...grid[i].length
            if grid[i][j] == 0
                empty_cells.push([i, j])
            end
        end
    end
    return empty_cells
end

def is_valid_for_row?(grid, row, num)
    return !grid[row].include?(num)
end

def is_valid_for_coloumn?(grid, col, num)
    for i in 0...grid.length 
        return false if grid[i][col] == num
    end
    return true
end

def is_valid_for_square?(grid, row, col, num)
    down_side = 3 * (row / 3)
    up_side = down_side + 3
    left_side = 3 * (col / 3)
    right_side = left_side + 3

    for i in down_side...up_side
        for j in left_side...right_side
            return false if grid[i][j] == num
        end
    end
    return true
end

def is_valid_num?(grid, row, col, num)
    return is_valid_for_row?(grid, row, num) && 
        is_valid_for_coloumn?(grid, col, num) && 
        is_valid_for_square?(grid, row, col, num)
end

def show_grid(grid)
    for i in 0...grid.length
        for j in 0...grid[i].length
            print(" #{grid[i][j]}")
        end
        puts ""
    end
end

def solve_sudoku(grid)
    cells = get_empty_cells(grid)
    return true if cells.empty?

    i = 0

    while i < cells.length
        row = cells[i][0]
        col = cells[i][1]

        num = grid[row][col] + 1
        done = false
        while !done && num <= 9
            if is_valid_num?(grid, row, col, num)
                done = true
                grid[row][col] = num
                i += 1
            else
                num += 1
            end
        end

        if !done
            grid[row][col] = 0
            i -= 1 
            return false if i < 0
        end
    end

    return grid
end

def main 

    grid = [
        [5,3,0,0,7,0,0,0,0],
        [6,0,0,1,9,5,0,0,0],
        [0,9,8,0,0,0,0,6,0],
        [8,0,0,0,6,0,0,0,3],
        [4,0,0,8,0,3,0,0,1],
        [7,0,0,0,2,0,0,0,6],
        [0,6,0,0,0,0,2,8,0],
        [0,0,0,4,1,9,0,0,5],
        [0,0,0,0,8,0,0,7,9]
    ]

    # 36 seconds
    # grid = [
    #     [ 0, 0, 0, 0, 6, 0, 7, 0, 0 ],
    #     [ 0, 5, 9, 0, 0, 0, 0, 0, 0 ],
    #     [ 0, 1, 0, 2, 0, 0, 0, 0, 0 ],
    #     [ 0, 0, 0, 1, 0, 0, 0, 0, 0 ],
    #     [ 6, 0, 0, 5, 0, 0, 0, 0, 0 ],
    #     [ 3, 0, 0, 0, 0, 0, 4, 6, 0 ],
    #     [ 0, 0, 0, 0, 0, 0, 0, 0, 0 ],
    #     [ 0, 0, 0, 0, 0, 0, 0, 9, 1 ],
    #     [ 8, 0, 0, 7, 4, 0, 0, 0, 0 ]
    # ]

    puts "SUDOKU grid:"
    show_grid(grid)

    solution = solve_sudoku(grid)

    if solution == true
        puts "SUDOKU already solved!"
    elsif solution == false
        print "\n\nSUDOKU haven`t solution!"
    else
        print "\nSUDOKU solved!\n"
        show_grid(grid)
    end
end

main