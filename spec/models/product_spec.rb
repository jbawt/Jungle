require 'rails_helper'

RSpec.describe Product, type: :model do

  describe 'Validations' do

    it 'should exist when saved with all four categories' do
      @category = Category.new(name: 'sports')
      @product = Product.new(name: 'football', price: 123456, quantity: 23, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end 

    it 'should validate error message for name' do
      @category = Category.new(name: 'sports')
      @product = Product.new(name: nil, price: 32452, quantity: 10, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to eq ["Name can't be blank"]
    end

    it 'should validate error message for price' do
      @category = Category.new(name: 'sports')
      @product = Product.new(name: 'basketball', price: nil, quantity: 10, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to eq ["Price cents is not a number", "Price is not a number", "Price can't be blank"]
    end
    
    it 'should validate quantity' do
      @category = Category.new(name: 'sports')
      @product = Product.new(name: 'basketball', price: 1234, quantity: nil, category: @category)
      @product.valid?
      expect(@product.errors.full_messages).to eq ["Quantity can't be blank"]
    end

    it 'should validate category' do 
      @product = Product.new(name: 'basketball', price: 1234, quantity: 10, category: nil)
      @product.valid?
      expect(@product.errors.full_messages).to eq ["Category can't be blank"]
    end

  end
end


