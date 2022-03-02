def substrings(sentence, dictionary)#Takes a string and an array of words and creates a hash displaying how many times each words appears in the string

    dictionary.reduce(Hash.new(0)) do |hash, word|
        sum = includeCount(sentence.downcase, word.downcase)
        hash[word] += sum if sum > 0
        hash
    end
end

def includeCount(string, search_string) #like ruby's native include? function, but it gives a count of how many times it is included.
    return 0 if search_string == '' || string == ''
    string_array = string.chars
    search_string_array = search_string.chars
    sum = 0
    i = 0
    j = 0
    while i < string.length do 
        string_array[i] == search_string_array[j] ? j += 1 : (i -= j; j = 0) #increments j if letters match, else resets j and sets i to a char after j's check started
        if j == search_string.length
            sum += 1
            i -= j - 1 #restarts the check a character after j started
            j = 0
        end
        i += 1

    end
    sum
end


#------------------------ testing

dictionary = ["He", "ello", "hell", "lo", "l"]
p substrings("hello", dictionary)
dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]
p substrings("below", dictionary)
p substrings("Howdy partner, sit down! How's it going?", dictionary)
