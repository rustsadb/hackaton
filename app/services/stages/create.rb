# frozen_string_literal: true

module Stages
  class Create
    def call(project_id:, name:)
      Stage.create!(project_id: project_id, name: name)
    end
  end
end
