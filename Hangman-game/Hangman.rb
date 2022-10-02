@words = [
    ["Word", "Something letters"],
    ["Hangman", "This game"],
    ["Ruby", "Programing language used for this game"],
    ["Player", "Someone who is playing"]
  ]

@lives = 7
@exit = false
@done = false

@entered_letter = []
@teaser = ""

def show_teaser()
    teaser = ""
    for letter in @teaser.split
        teaser += letter + " " 
    end
    puts teaser
end

def user_input()
    print ">"
    letter = gets.chomp.upcase

    if letter == "EXIT"
        @exit = true
    elsif letter.length > 1
        return nil
    end

    return letter.upcase
end

def check_letter(letter, word)
    if @entered_letter.include? letter
        return nil
    elsif word.include? letter
        update_teaser(letter, word)
    else
        @entered_letter << letter
        @lives -= 1
    end
end

def update_teaser(letter, word)
    for i in 0..word.length
        if letter == word[i]
            @teaser[i] = letter
        end
    end
    if !@teaser.include? "_"
        @exit = true
        @done = true
    end
end

def show_entered_letter()
    letters = "Used Letters: "
    for letter in @entered_letter
        letters += letter + " "
    end
    puts letters
end

def show_game_info (hint)
    puts ("\nYou have " + @lives.to_s + " lives")
    puts ("Your hint: " + hint)
    show_entered_letter
    show_teaser
end

def main()
    choise = @words.sample
    word = choise[0].upcase
    hint = choise[1]

    @teaser = "_" * word.length

    while @lives > 0 and !@exit
        show_game_info(hint)

        puts "Type letter or \"exit\" to end game"
        letter = user_input()

        if letter == nil
            puts "Type only ONE letter!"
        else
            check_letter(letter, word)
        end
    end

    if @done
        puts "You Win!!!"
        show_game_info(hint)
    elsif @exit
        puts "See you later!"    
    else
        puts "You Lose!"
    end 
end

main()