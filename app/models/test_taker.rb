class TestTaker < ApplicationRecord
  has_many :test_memberships, dependent: :delete_all
  has_many :tests, through: :test_memberships
  validates_uniqueness_of :email
  before_destroy :delete_test_memberships

  def delete_test_memberships
    self.test_memberships.destroy_all
  end
end
