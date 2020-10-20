require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do

    it 'should create user when passwords match' do
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'testPass', password_confirmation: 'testPass')
      @user.save!
      expect(@user.id).to be_present
    end

    it 'should not create user when passwords do not match' do
      @user = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'testPass', password_confirmation: 'tespa')
      @user.valid?
      expect(@user.errors.full_messages).to eq ["Password confirmation doesn't match Password"]
    end

    it 'should not create user when email is not unique' do
      @user1 = User.new(first_name: 'john', last_name: 'doe', email: 'john@doe.com', password: 'testPass', password_confirmation: 'testPass')
      @user1.save!
      @user2 = User.new(first_name: 'johnny', last_name: 'does', email: 'john@doe.com', password: 'testPass', password_confirmation: 'testPass')
      @user2.valid?
      expect(@user2.errors.full_messages).to eq ["Email has already been taken"]
    end

    it 'should not create user without first name field' do
      @user = User.new(first_name: nil, last_name: 'does', email: 'john@doe.com', password: 'testPass', password_confirmation: 'testPass')
      @user.valid?
      expect(@user.errors.full_messages).to eq ["First name can't be blank"]
    end

    it 'should not create user without first name field' do
      @user = User.new(first_name: 'John', last_name: nil, email: 'john@doe.com', password: 'testPass', password_confirmation: 'testPass')
      @user.valid?
      expect(@user.errors.full_messages).to eq ["Last name can't be blank"]
    end

    it 'should not create user without password field' do
      @user = User.new(first_name: 'john', last_name: 'does', email: 'john@doe.com', password: nil, password_confirmation: 'testPass')
      @user.valid?
      expect(@user.errors.full_messages).to eq ["Password can't be blank", "Password can't be blank", "Password is too short (minimum is 5 characters)"]
    end

    it 'should not create user without password confirmation field' do
      @user = User.new(first_name: 'john', last_name: 'does', email: 'john@doe.com', password: 'testPass', password_confirmation: nil)
      @user.valid?
      expect(@user.errors.full_messages).to eq ["Password confirmation can't be blank"]
    end

    it 'should not create user when password password is too short' do
      @user = User.new(first_name: 'john', last_name: 'does', email: 'john@doe.com', password: 'pass', password_confirmation: 'pass')
      @user.valid?
      expect(@user.errors.full_messages).to eq ["Password is too short (minimum is 5 characters)"]
    end
  end
end
