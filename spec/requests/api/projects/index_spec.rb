require 'swagger_helper'

RSpec.describe 'api/projects', type: :request do
  path '/api/projects' do
    get 'Show projects' do
      tags 'Projects'

      consumes 'application/json'
      produces 'application/json'

      let!(:project_1) { create(:project, :random_documentation) }
      let!(:project_2) { create(:project, :random_documentation) }
      let!(:project_3) { create(:project, :random_documentation) }

      response '200', 'project list' do
        run_test! do |response|
          expect(parse_response_body(response.body)['data'].pluck('id').size).to eq Project.all.size
        end
      end
    end
  end
end
