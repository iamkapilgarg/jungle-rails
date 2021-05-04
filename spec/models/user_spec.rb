require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should exist id for new records' do
      @user = User.new(:name => 'Kapil', :email=>'iamkapilgarg@gmail.com', :password=>"abcd")
      @user.save!
      expect(@user.id).to be_present
    end

    it 'should exist id for new records even with password confirmation' do
      @user = User.new(:name => 'Kapil', :email=>'iamkapilgarg@gmail.com', :password=>"abcd", :password_confirmation=>"abcd")
      @user.save!
      expect(@user.id).to be_present
    end
  end
end