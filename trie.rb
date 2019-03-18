require 'set'
class Trie

  attr_accessor :children, :value, :flag

  def initialize value=nil
    @children = {}
    @value = value
    @flag = false #flag to represent that a word ends at this node
  end
  
  def add char
    val = value ? value + char : char
    children[char] = Trie.new val
  end
  
  def insert word
    node = self
    word.each_char do |char|
      node.add char if not node.children.has_key? char
      node = node.children[char]
    end
    node.flag = true
  end
  
  def check_word word
    node = self
    word.each_char do |char|
      return nil if not node.children.has_key? char
      node = node.children[char]
    end
    return node
  end

  def find word
    check =  check_word word
    if !check.nil? && check.flag
       return check.value
    else 
       return nil
    end  
  end
  
  def check_tree word
    check =  check_word word
    unless check.nil?
      return {value: check.value,word_end: check.flag} 
    else  
    return nil
    end
  end  
  

end
