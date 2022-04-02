require 'swagger_helper'

RSpec.describe 'api/registration_complete', type: :request do
  path '/api/registration_complete' do
    post 'Complete user registration' do
      tags 'User registration'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          avatar_id: { type: :integer },
          phone_number: { type: :integer, example: 79781234567 },
          password: { type: :string, example: 'my_password' },
          name: { type: :string, example: 'Danil' },
          email: { type: :string, example: 'Test@mail.ru' },
          gender: { type: :string, example: 'female' }
        },
        required: [ 'phone_number', 'password, name']
      }

      let(:phone_number) { 79789999999 }
      let(:password) { 'password' }
      let(:name) { 'Andrey' }
      let(:email) { 'test@mail.ru' }
      let(:gender) { 'male' }

      response '200', 'user registred' do
        let(:data) { { phone_number: phone_number, password: password, name: name, email: email, gender: gender } }

        before do
          User.create!(phone_number: phone_number)
        end

        run_test! do |response|
          expect(parse_response_body(response.body)['data']['attributes']['name']).to eq name
          expect(User.last.email).to eq email.downcase
          expect(response.headers['Authorization']).not_to be_nil
        end
      end

      response '422', 'params error' do
        let(:gender) { 'appach_helicopter' }
        let(:data) { { phone_number: phone_number, password: password, name: name, email: email, gender: gender } }

        before do
          User.create!(phone_number: phone_number)
        end

        run_test! do |response|
          expect(response.status).to eq 422
        end
      end

      response '404', 'user not found' do
        let(:data) { { phone_number: 79781111111, password: password, name: name, email: email, gender: gender } }

        before do
          User.create!(phone_number: phone_number)
        end

        run_test! do |response|
          expect(response.status).to eq 404
        end
      end
    end
  end
end
