# frozen_string_literal: true

class Project < ApplicationRecord
  has_many :stages, dependent: :destroy
end
