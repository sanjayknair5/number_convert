require "./number_convert"
require "json"

describe NumberConvert do
  before do
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

end  