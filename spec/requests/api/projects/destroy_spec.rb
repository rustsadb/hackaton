# frozen_string_literal: true

require 'swagger_helper'

RSpec.describe 'api/projects/:id', type: :request do
  path '/api/projects/{id}' do
    delete 'Delete project' do
      tags 'Projects'

      consumes 'application/json'
      produces 'application/json'

      parameter name: :id, in: :path, type: :integer

      let!(:user) { create(:user, :random_password, :random_phone_number) }
      let!(:project) { create(:project, :random_documentation) }
      let!(:stage) { create(:stage, project_id: project.id) }

      response '200', 'stage deleted' do
        let!(:id) { project.id }

        run_test! do |response|
          expect(response.status).to eq 200
          expect(Project.all.size).to eq 0
          expect(Stage.all.size).to eq 0
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
