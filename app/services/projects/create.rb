# frozen_string_literal: true

module Projects
  class Create
    def call(name:)
      Project.create!(name: name)
    end
  end
end
