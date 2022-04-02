require 'swagger_helper'

RSpec.describe 'api/stages', type: :request do
  path '/api/stages' do
    post 'Create stages' do
      tags 'Stages'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'lol' },
          project_id: { type: :integer, example: 1 },
        },
        required: ['name', 'project_id']
      }

      let!(:project) { create(:project, :random_documentation) }

      response '200', 'project created' do
        let(:data) { { name: 'stage', project_id: project.id } }

        run_test! do |response|
          expect(parse_response_body(response.body)['data']['id']).to eq Stage.last.id.to_s
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
