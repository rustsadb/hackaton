# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/projects/:id', type: :request do
  path '/api/projects/{id}' do
    get 'Show project' do
      tags 'Projects'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :integer

      let!(:user) { create(:user, :random_password, :random_phone_number) }
      let!(:project) { create(:project, :random_documentation) }
      let!(:stage_1) { create(:stage, project_id: project.id, name: 'На очереди ') }
      let!(:stage_2) { create(:stage, project_id: project.id, name: 'В разработке') }
      let!(:stage_3) { create(:stage, project_id: project.id, name: 'Тестирование') }
      let!(:task_1) { create(:task, stage_id: stage_1.id) }
      let!(:task_2) { create(:task, stage_id: stage_1.id) }
      let!(:task_3) { create(:task, stage_id: stage_2.id) }

      response '200', 'project showed ' do
        let!(:id) { project.id }

        run_test! do |response|
          expect(parse_response_body(response.body)['data']['attributes']['stages'].size).to eq 3
          expect(response.status).to eq 200
        end
      end

      response '404', 'not found' do
        let!(:id) { project.id + 100 }

        run_test! do |response|
          expect(response.status).to eq 404
        end
      end
    end
  end
end
