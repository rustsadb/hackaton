# frozen_string_literal: true

class Stage < ApplicationRecord
  belongs_to :project
  has_many :tasks, dependent: :destroy
end
