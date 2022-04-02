require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  path '/api/users' do
    post 'Create user' do
      tags 'User registration'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          phone_number: { type: :integer, example: 79781234567 }
        },
        required: [ 'phone_number' ]
      }

      response '200', 'user created' do
        let(:phone_number) { 89_780_111_222 }
        let(:data) { { phone_number: phone_number } }

        run_test! do |response|
          expect(parse_response_body(response.body)['data']['id']).to eq User.last.id.to_s
        end
      end

      response '422', 'params error' do
        let(:phone_number) { { phone_number: 1234 } }
        let(:data) { { phone_number: phone_number } }

        run_test! do |response|
          expect(response.status).to eq 422
        end
      end
    end
  end
end
