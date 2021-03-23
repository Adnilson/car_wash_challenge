require "test_helper"

class MakerTest < ActiveSupport::TestCase
  test "Validates name's uniqueness" do
    Maker.create(name: 'BMW')
    second = Maker.new(name: 'BMW')

    assert_not second.save
  end
end
