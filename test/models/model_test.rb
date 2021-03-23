require "test_helper"

class ModelTest < ActiveSupport::TestCase
  test "Validates name's uniqueness" do
    @maker = Maker.last
    Model.create(name: 'X1', maker: @maker)
    second = Model.new(name: 'X1', maker: @maker)

    assert_not second.save
  end
end
