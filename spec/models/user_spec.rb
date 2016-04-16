require 'rails_helper'

RSpec.describe User, type: :model do

  it "can be saved with a valid password" do
    user = FactoryGirl.create(:user)
    user.save

    expect(user.valid?).to be(true)
    expect(User.count).to eq(1)
  end

  it "can be saved with a password just long enough with a capital letter and digit" do
    user = User.create username:"user1", password:"paWss1"

    expect(user.valid?).to be true
    expect(User.count).to eq(1)
  end

  it "can be saved with password having with multiple capital letters and digits" do
    user = User.create username: "user1", password:"PaSwo123123rD10213"

    expect(user).to be_valid
    expect(User.count).to eq(1)
  end

  it "can't be saved without a password" do
    user = User.create username:"user1"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "can't be saved with password not long enough" do
    user = User.create username:"user1", password:"pasW1"

    expect(user.valid?).to be(false)
    expect(User.count).to eq(0)
  end

  it "is not saved with password consisting only of lower case letters" do
    user = User.create username:"user1", password:"secret"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with password having a digit but not having a capital letter" do
    user = User.create username:"user1", password:"sec1ret"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

  it "is not saved with password having a capital letter but no digit" do
    user = User.create username: "user1", password:"seCret"

    expect(user).not_to be_valid
    expect(User.count).to eq(0)
  end

end
