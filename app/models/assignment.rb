class Assignment < ApplicationRecord
  validates :name, uniqueness: true
  has_many :student_assignments
end
