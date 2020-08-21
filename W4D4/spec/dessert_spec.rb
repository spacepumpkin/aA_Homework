require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef") }
  subject(:dessert) { Dessert.new("dessert",5,chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("dessert")
    end

    it "sets a quantity" do
      expect(dessert.quantity).to eq(5)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("dessert","a",chef) }.to raise_error(ArgumentError)
    end

  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      # expect(dessert).to receive(:add_ingredient)
      dessert.add_ingredient("flour")
      expect(dessert.ingredients.last).to eq("flour")
    end
  end

  describe "#mix!" do
    it "uses #shuffle!" do
      expect(dessert.ingredients).to receive(:shuffle!)
      dessert.mix!
      
    end
    it "shuffles the ingredient array" do
      ingredients = ["flour", "sugar", "cream", "milk", "chocolate"]
      ingredients.each { |ingredient| dessert.ingredients << ingredient }
      expect(dessert.ingredients).to eq(ingredients)
      dessert.mix!
      expect(dessert.ingredients).to_not eq(ingredients)
      
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(2)
      expect(dessert.quantity).to be(3)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(6) }.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef Tucker")
      expect(dessert.serve).to include("Chef Tucker")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
