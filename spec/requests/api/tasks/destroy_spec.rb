# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/tasks/:id', type: :request do
  path '/api/tasks/{id}' do
    delete 'Delete task' do
      tags 'Tasks'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :integer

      let!(:project) { create(:project, :random_documentation) }
      let!(:stage) { create(:stage, project_id: project.id) }
      let!(:task) { create(:task, stage_id: stage.id) }

      response '200', 'task deleted' do
        let!(:id) { task.id }

        run_test! do |response|
          expect(response.status).to eq 200
          expect(Task.all.size).to eq 0
        end
      end

      response '404', 'not found' do
        let!(:id) { task.id + 100 }

        run_test! do |response|
          expect(response.status).to eq 404
        end
      end
    end
  end
end
