require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should exist id for new records even with password confirmation' do
      @user = User.new(:name => 'Kapil', :email=>'iamkapilgarg@gmail.com', :password=>"abcd", :password_confirmation=>"abcd")
      @user.save!
      expect(@user.id).to be_present  
    end

    it 'should match password and password_confirmation' do
      @user = User.new(:name => 'Kapil', :email=>'iamkapilgarg@gmail.com', :password=>"abcd", :password_confirmation=>"efgh")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should check minimum length of the password' do
      @user = User.new(:name => 'Kapil', :email=>'iamkapilgarg@gmail.com', :password=>"a", :password_confirmation=>"a")
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 3 characters)")
    end

    it 'should check email already exists' do
      @user = User.new(:name => 'Kapil', :email=>'iamkapilgarg@gmail.com', :password=>"abcd", :password_confirmation=>"abcd")
      @user2 = User.new(:name => 'Kapil', :email=>'IAMKAPILGARG@gmail.com', :password=>"abcd", :password_confirmation=>"abcd")
      @user.save!
      @user2.valid?
      p @user2.errors.full_messages
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end
    
  end
end