class Test < ApplicationRecord
  belongs_to :user
  has_many :questions
  has_many :test_memberships
  has_many :test_takers, through: :test_memberships

  validate :user_should_be_admin

  private

  def user_should_be_admin
    unless user.is_admin?
      errors.add(:user, "user must be admin")
    end
  end
end
