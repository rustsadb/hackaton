require 'swagger_helper'

RSpec.describe 'api/projects', type: :request do
  path '/api/projects' do
    post 'Create project' do
      tags 'Projects'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'lol' }
        },
        required: [ 'name' ]
      }

      response '200', 'project created' do
        let(:data) { { name: 'lol' } }

        run_test! do |response|
          expect(parse_response_body(response.body)['data']['id']).to eq Project.last.id.to_s
        end
      end

      response '422', 'params error' do
        let(:data) { { name: 123123 } }

        run_test! do |response|
          expect(response.status).to eq 422
        end
      end
    end
  end
end
