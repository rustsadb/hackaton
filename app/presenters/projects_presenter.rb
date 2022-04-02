# frozen_string_literal: true

class ProjectsPresenter
  attr_reader :project

  def initialize(project)
    @project = project
  end

  def project_stages
    @project.stages.map do |stage|
      {
        id: stage.id,
        name: stage.name,
        project_id: stage.project_id,
        created_at: stage.created_at,
        tasks: stage_tasks(stage)
      }
    end
  end

  private

  def stage_tasks(stage)
    stage.tasks.map do |task|
      {
        id: task.id,
        name: task.name,
        important: task.important,
        stage_id: task.stage_id,
        description: task.description,
        deadline: task.deadline,
        created_at: task.created_at
      }
    end
  end
end
