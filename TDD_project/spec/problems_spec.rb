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

describe "my_transpose" do 
    it "should convert between the row and the column" do 
        my_trans = [
            [0, 1, 2],
            [3, 4, 5],
            [6, 7, 8]
          ]
          expect(my_transpose(my_trans)).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])

    end
end

describe "#stock_picker" do 
    it "buy low sell high" do
        stock_price = [2,1,3,1,9]
        expect(stock_picker(stock_price)).to eq([1,4])
    end
end