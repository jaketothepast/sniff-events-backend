require "test_helper"

class TestTest < ActiveSupport::TestCase
  setup do
    # Get our user
    @non_admin = users(:two)
  end

  test "owning user should be admin" do
    # Create our test - using Test.new
    test = Test.new(name: "fake test", description: "fake test", user: @non_admin)
    assert_not test.valid?
  end
end
