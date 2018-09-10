require 'rails_helper'

RSpec.describe Checkin, type: :model do

  it 'is valid with valid attributes' do 
    User.create({name: 'timmy', email: 'jdfk@gmail.com', password: '123'})
    checkin = Checkin.new({name: 'Store', latitude: 1.2324, longitude: 23.2313, checkin: "true", user_id: 35})
    expect(checkin).to be_valid
  end

  it 'is not valid without a name' do 
    checkin = Checkin.new({ latitude: 1.2324, longitude: 23.2313})
    expect(checkin).to_not be_valid
  end

  it 'is not valid without a longitude' do 
    checkin = Checkin.new({ name: 'Jake Store', longitude: 23.2313})
    expect(checkin).to_not be_valid
  end
  it 'is not valid without a latitude' do 
    checkin = Checkin.new({ name: 'Jake Store', latitude: 1.2324})
    expect(checkin).to_not be_valid
  end
end
