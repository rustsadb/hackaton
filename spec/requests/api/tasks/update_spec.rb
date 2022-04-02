# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/tasks/', type: :request do
  path '/api/tasks/' do
    put 'Update task' do
      tags 'Tasks'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :data, in: :body, schema: {
        type: :object,
        properties: {
          id: { type: :integer, example: 1 },
          stage_id: { type: :integer, example: 1 }
        }
      }

      let!(:project) { create(:project, :random_documentation) }
      let!(:stage_1) { create(:stage, project_id: project.id) }
      let!(:stage_2) { create(:stage, project_id: project.id) }
      let!(:task) { create(:task, stage_id: stage_1.id) }

      response '200', 'update successful' do
        let(:data) { { id: task.id , stage_id: stage_2.id } }

        run_test! do |response|
          expect(parse_response_body(response.body)['data']['attributes']['stage_id']).to eq stage_2.id
          expect(stage_1.tasks.size).to eq 0
          expect(stage_2.tasks.size).to eq 1
        end
      end

      response '404', 'record not exists' do
        let(:data) { { id: task.id , stage_id: stage_2.id + 100 } }

        run_test! do |response|
          expect(response.status).to eq 404
          expect(parse_response_body(response.body)['errors']['title']).to eq I18n.t('api.errors.record_not_found')
        end
      end

      response '422', 'params fail' do
        let!(:data) { { id: 'lol' } }

        run_test! do |response|
          expect(response.status).to eq 422
        end
      end
    end
  end
end
