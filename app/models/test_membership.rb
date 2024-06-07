class TestMembership < ApplicationRecord
  belongs_to :test_taker
  belongs_to :test
end
