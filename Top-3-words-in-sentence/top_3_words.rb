def split_text_by_words(text)
    words = Hash.new

    # text.downcase.gsub(/[^\w\`\'\ ]/, "").split() - все приводим в нижний регистр, 
    # удаляем все символы кроме  букв, чисел апострофов и пробелов, разделяем строку по пробелам
    for word in text.downcase.gsub(/[^\w\d\`\'\ ]/, "").split()
        if (words.has_key? word) 
            words[word] += 1
        else
            words.store(word, 1)
        end
    end

    return words
end

def main
    print "Enter text\n>"
    text = gets.chopm
    # text = "In a village of La Mancha, the name of which I have no desire to call to
    # mind, there lived not long since one of those gentlemen that keep a lance
    # in the lance-rack, an old buckler, a lean hack, and a greyhound for
    # coursing. An olla of rather more beef than mutton, a salad on most
    # nights, scraps on Saturdays, lentils on Fridays, and a pigeon or so extra
    # on Sundays, made away with three-quarters of his income."

    words = split_text_by_words(text)
    words.delete_if { |k, v| v < 2 }.sort_by { |k, v| -v }

    for i in 0..2
        if !words.keys[i].nil?
            puts "Top-#{i + 1}: #{ words.keys[i] }"
        end
    end 

end

main