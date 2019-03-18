require "./trie"

describe Trie do
  context 'with word "a" and no children' do
    it "should have only a in the tree" do
      trie = Trie.new('a')
      expect(trie.value).to eq "a"
      expect(trie.children).to be_empty
    end
  end

  context 'check find method' do
    before do
      @trie = Trie.new
      @trie.insert("MOT")
      @trie.insert("MOTOR")
      @trie.insert("SPIN")
    end

    it "insert word and retrive the word using find method" do
      expect(@trie.find("MOTOR")).to eq "MOTOR"
      expect(@trie.find("MOT")).to eq "MOT"
      expect(@trie.find("MOTO")).to eq nil
      expect(@trie.find("SPIN")).to eq "SPIN"
    end
  end


  context 'check check_tree method' do
    before do
      @trie = Trie.new
      @trie.insert("MOT")
      @trie.insert("MOTOR")
      @trie.insert("SPIN")
    end

    it "insert word and retrive the word using find method" do
      expect(@trie.check_tree("MOTOR")).to eq({value:"MOTOR",word_end: true})
      expect(@trie.check_tree("MOT")).to eq({value:"MOT",word_end: true})
      expect(@trie.check_tree("MOTO")).to eq({value:"MOTO",word_end: false})
      expect(@trie.check_tree("SPINNER")).to eq nil
    end
  end
end
