require 'piece.rb'
require 'byebug'

describe Piece do
    # describe and context are the structure of specs and add description
    let(:board) { double(:Banana, {:valid_pos? => true})}
    subject(:piece) { Piece.new(:white, board, [0,0])}
    describe '#initialize' do
        context 'with valid arguments' do
            # it creates a spec and also adds description
            it 'instantiate a piece correctly with getters' do
                #piece = Piece.new(:white, [0,0])
                # be checks object id equivalence but eq checks just value equivalence
                expect(piece.color).to be(:white)
                expect(piece.pos).to eq([0,0])
            end
        end

        context "with invalid arguments" do
            it 'raise an error when provided an invalid color' do
                expect{ Piece.new(:blue, board, [0,0])}.to raise_error("Invalid color")
            end

            it 'raise ab error when provided an invalid postion' do
                allow(board).to receive(:valid_pos?).and_return(false)
                expect{ Piece.new(:white, board, [9,9])}.to raise_error("Invalid pos")
            end 
        end
    end


    describe "#symbol" do 
        it "raise an error" do
            expect { piece.symbol}.to raise_error(NotImplementedError)
        end
    end

    describe "#empty?" do
        it "return false" do 
            expect(piece.empty?).to be(false)
        end
    end

    describe "#pos=" do 
        before(:each) {piece.pos = [1, 1]}
        it 'correctly assigns pos' do 
            piece.pos = [2,3]
            expect(piece.pos).to eq([2, 2])
        end

        it "stil works" do 
            expect(piece.pos).to eq([1, 1])
        end 
    end
end