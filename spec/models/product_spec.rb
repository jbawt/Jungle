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
      expect(@product.errors.full_messages)
    end

    it 'should validate error message for price' do
      @category = Category.new(name: 'sports')
      @product = Product.new(name: 'basketball', price: nil, quantity: 10, category: @category)
      expect(@product.errors.full_messages)
    end
    
    it 'should validate quantity' do
      @category = Category.new(name: 'sports')
      @product = Product.new(name: 'basketball', price: 1234, quantity: nil, category: @category)
      expect(@product.errors.full_messages)
    end

    it 'should validate category' do 
      @product = Product.new(name: 'basketball', price: 1234, quantity: 10, category: nil)
      expect(@product.errors.full_messages)
    end

  end
end

