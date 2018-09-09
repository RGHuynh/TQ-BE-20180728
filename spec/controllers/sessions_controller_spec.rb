require 'rails_helper'

RSpec.describe SessionsController, type: :controller do
  describe '#create_code' do 
    before {
      User.create({name: 'Bob', email: 'tom@gmail.com', password: '1234'})
    }

    it 'is not a valid email' do
      param = {email: 'tom@gmail.com', password: '12fd34'}
      post :create_code, params: param
      expect(response.header[:jwt]).to be_nil
    end

    it 'is valid params attributes' do 
      param = {email: 'tom@gmail.com', password: '1234'}
      post :create_code, params: param
      expect(response.header["Content-Type"]).to eq("application/json; charset=utf-8")
    end
  end

  describe '#authenticate_params' do 
    before {
      User.create({name: 'Bob', email: 'tom@gmail.com', password: '1234'})
    }

    it 'is valid with permited params' do 
      param = {email: 'tom@gmail.com', password: '1234'}
      post :create_code, params: param
      expect(response.body).to_not eq("")
    end

    it 'is not valid with unpermited params' do
      param = {email: 'tom@gmail.com'}
      post :create_code, params: param
      expect(response.body).to eq("")
    end
  end

  describe 'Application#authenticate' do
    before {
      User.create({name: 'Bob', email: 'tom@gmail.com', password: '1234'})
    }

    it 'is not valid without token' do 
      applicationController = ApplicationController.new
      expect {applicationController.authenticate}.to raise_error(JWT::DecodeError)
    end
  end

end
