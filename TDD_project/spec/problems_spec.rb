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

describe TowersOfHanoi do
    subject (:towersofhanoi) { TowersOfHanoi.new}
    # let(array1) { towersofhanoi.array1}
    # let(array2) { towersofhanoi.array2}
    before(:each) do 
        @array1 = towersofhanoi.array1
        @array2 = towersofhanoi.array2
        @array3 = towersofhanoi.array3
    end

    describe "#initialize" do
        it "array1 should be [3, 2, 1]" do
            expect(towersofhanoi.array1).to eq([3, 2, 1])
            expect(towersofhanoi.array2).to eq([])
            expect(towersofhanoi.array3).to eq([])
        end
    end

    describe "#move" do
        it "should move a disk from an array to another array" do
            expect(towersofhanoi.move(@array1, @array2)).to eq([1])
        end

        it "shound raise an error" do 
            expect(towersofhanoi.move(@array1, @array2))
            expect{towersofhanoi.move(@array1, @array2)}.to raise_error("not valid")
        end
    end

    describe "#valid_move?" do 
        it "should raise an error if the move is not valid" do
            expect{towersofhanoi.move(@array2, @array1)}.to raise_error("stack is empty, pick another stack")
        end
    end

    describe "#won?" do 
        it "should return false" do
            expect(towersofhanoi.won?).to be(false)
            towersofhanoi.array3 = [3,2,1]
            expect(towersofhanoi.won?).to be(true)
        end
    end
end









