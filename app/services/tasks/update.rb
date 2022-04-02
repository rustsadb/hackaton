# frozen_string_literal: true

module Tasks
  class Update
    def call(id:, stage_id:)
      task = Task.find(id)
      Stage.find(stage_id)
      task.update!(stage_id: stage_id)

      task
    end
  end
end
