
def alphabet_position(text)
    result = "";

    for i in 0..text.length
        if (text[i] =~ /[a-z]/) != nil
            result  += get_number_of_letter(text[i]) + " "
        end
    end
    return result 
end

def get_number_of_letter(letter)
    return (letter.ord - 96).to_s
end

def main()
    print "Enter text\n>"
    text = gets.chomp.downcase

    puts (alphabet_position(text))
end

main()