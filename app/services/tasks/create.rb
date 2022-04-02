# frozen_string_literal: true

module Tasks
  class Create
    def call(project_id:, name:, deadline: nil, description: nil, important: 1)
      Task.create!(project_id: project_id, name: name, deadline: deadline, description: description, important: important)
    end
  end
end
