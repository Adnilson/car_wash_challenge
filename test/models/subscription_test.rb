require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  test "saves subscription" do
    subscription = Subscription.new(start: Date.today,
                                    end: 1.month.from_now,
                                    car: Car.last)

    assert subscription.save
  end
end
