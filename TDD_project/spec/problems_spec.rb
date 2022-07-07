require 'problems'

describe '#uniq' do 
    it 'should remove duplicates and return uniq elements' do 
        arr = [1, 2, 1, 3, 3]
        expect( my_uniq(arr)).to eq([1, 2, 3])
    end
end

describe "Array#two_sum" do 
    it 'should find all pairs of postions that add to zero' do
        expect( [-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end
end