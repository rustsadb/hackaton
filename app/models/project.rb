class Project < ApplicationRecord
  has_many :stages, dependent: :destroy
end
