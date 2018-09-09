require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'is valid with valid attributes' do
    user = User.new({name: "Bob", email: "tom@gmail.com", password: "1234"})
    expect(user).to be_valid
  end

  it "is not valid without a name" do 
    user = User.new({email: "tom@gmail.com", password: "1234"})
    expect(user).to_not be_valid
  end

  it "is not valid without an email" do 
    user = User.new({name: "Bob", password: "1234"})
    expect(user).to_not be_valid
  end

  it "is not valid without a password" do 
    user = User.new({name: "Bob", email: "tome@gmail.com"})
    expect(user).to_not be_valid
  end

  it "is not valid with the same address" do 
    User.create({name: "Bob", email: "tom@gmail.com", password: "1234"})

    new_user = User.new({name: "Bob", email: "tom@gmail.com", password: "1234"})
    expect(new_user).to_not be_valid
  end
end
