require "./number_convert"
require "json"

describe NumberConvert do
  before(:all) do
    @sample_results = JSON.parse(File.read('spec/sample_output.json'))
    @convertor = NumberConvert.new
  end
  context 'normal 10 digit word and gives desired output' do
    it "should give desired output" do
      @sample_results.each_pair do |key,val|
        expect(@convertor.convert(key)).to eq val
      end
    end
  end


  context 'adding non 10 digit number' do
    it "should give desired output" do
      expect(@convertor.convert("123")).to eq "Invalid Input. Enter 10 digit number"
    end
  end



end
