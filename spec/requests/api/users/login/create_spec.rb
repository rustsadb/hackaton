require 'swagger_helper'

RSpec.describe 'api/sessions', type: :request do
  path '/api/sessions' do
    post 'Login user' do
      tags 'User login'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          phone_number: { type: :integer, example: 79781234567 },
          password: { type: :string, example: 'my_password' }
        },
        required: [ 'phone_number', 'password' ]
      }

      let(:phone_number) { 89_780_111_222 }
      let(:password) { 'password' }

      response '200', 'user logged in' do
        before do
          User.create(phone_number: phone_number, password: password)
        end

        let(:data) { { phone_number: phone_number, password: password } }

        run_test! do |response|
          expect(response.header['Authorization']).not_to be_nil
        end
      end

      response '401', 'auth error' do
        let(:data) { { phone_number: phone_number, password: password } }

        before do
          User.create(phone_number: 1234567891)
        end

        run_test! do |response|
          expect(response.status).to eq 401
        end
      end

      response '422', 'record not found' do
        let(:password) { 1 }
        let(:data) { { phone_number: phone_number, password: password } }

        run_test! do |response|
          expect(response.status).to eq 422
        end
      end
    end
  end
end
