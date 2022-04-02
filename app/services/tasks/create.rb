# frozen_string_literal: true

module Tasks
  class Create
    def call(stage_id:, name:, deadline: nil, description: nil, important: 1)
      Task.create!(stage_id: stage_id, name: name, deadline: deadline, description: description, important: important)
    end
  end
end
