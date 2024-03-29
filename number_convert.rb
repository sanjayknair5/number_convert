require "./trie"

class NumberConvert

  def initialize
    puts "Intializing Dictionary"
    @trie = Trie.new
    File.read("dictionary.txt").each_line do |word|
      @trie.insert(word.strip)
    end
  end

  def check_dict(word)
    word = @trie.find word
    return !word.nil?
  end


  def wordBreakUtil(str,n,result)
    for i in 3..n
      #extract sub -srting from 3 index as we need words to be greater or qual to 3 char.
      prefix = str[0, i]

      # if dictionary conatins this prefix, then
      # check for remaining string.
      # if not found , ignore the prefix and try next

      if (check_dict(prefix))
        if (i == n)
          result += prefix;
          @result << result
          break
        end
        wordBreakUtil(str[i, n-i], n-i, result + prefix + " ");
      end
    end
  end


  def word_break(str)
    @result = []
    wordBreakUtil(str, str.length, "");
    return @result
  end


  def convert(number)
    number = number.to_s
    return "Invalid Input. Enter 10 digit number" if number.length != 10
    return [] if number == ''

    mapping = ['', '', 'ABC', 'DEF', 'GHI', 'JKL', 'MNO', 'PQRS', 'TUV', 'WXYZ']
    f_solu = []
    combinations = [""]
    for i in 0...number.length
      num = number[i].to_i
      while combinations[0].length == i
        new_str = combinations.shift
        mapping[num].chars.each do |char|
          str = new_str + char
          if str.length == 3
            tree_check = @trie.check_tree(str.upcase)
            combinations.push(str) unless tree_check.nil?
          else
            if str.length == 10
              words = word_break(str.upcase)
              f_solu += words if words.any?
            end
            combinations.push(str)
          end
        end
      end
    end
    return f_solu
  end

end
