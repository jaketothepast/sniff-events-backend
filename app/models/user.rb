class User < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  enum permissions: { user: 0, admin: 1, super_admin: 2 }
  has_secure_password

  def is_admin?
    User.permissions[permissions] > User.permissions["user"]
  end
end
