require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "Johnny") }
  let(:cake) { Dessert.new("cake", 50, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(cake.type).to eq("cake")
    end

    it "should set variables @type, @quantity, @chef" do
      expect(dessert.instance_variable_get(:@type)).to eq("cake")
      expect(dessert.instance_variable_get(:@chef)).to eq(Chef)
      expect(dessert.instance_variable_get(:quantity)).to eq(50)
    end

    it "sets a quantity" do
      expect(cake.quantity).to eq(50)
    end

    it "starts ingredients as an empty array" do 
      expect(cake.ingredients).to eq([])
    end

    it "raises an argument error when given a non-integer quantity" do 
      expect { Dessert.new("cake", "50", chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      cake.add_ingredient("flour")
      expect(cake.ingredients.size).to eq(1)
      expect(cake.ingredients). to include("flour")
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      ingredients = ['flour', 'cream', 'sugar', 'butter']

      ingredients.each do |ingredient|
        cake.add_ingredient(ingredient)
      end

      expect(cake.ingredients).to eq(ingredients)
      expect(cake.ingredients).not_to eq(ingredients)
      expect(cake.ingredients.size).to eq(ingredients.size)
      expect(cake.ingredients.sort).to eq(ingredients.sort)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      cake.eat(5)
      expect(cake.quantity).to eq(45)
    end

    it "raises an error if the amount is greater than the quantity" do 
      expect { cake.eat(55)}.to raise_error("not enough cakes")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
    allow(chef).to receive(:titleize).and_return?("Johnny's Bakery")
    expect(cake.serve).to eq("Chef Johnny's Bakery hash made 50 cakes")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do 
      expect(chef).to receive(:bake).with(cake)
      cake.make_more
  end
end
