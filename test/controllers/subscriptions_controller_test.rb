require "test_helper"

class SubscriptionsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @car = Car.last
  end

  test "should get new" do
    get new_car_subscription_url(@car)
    assert_response :success
  end

  test "should get create" do
    assert_difference('Subscription.count') do
      post car_subscriptions_url(@car), params: { subscription: { start: Date.today, end: 1.month.from_now } }
    end

    assert_redirected_to car_url(Subscription.last.car_id)
  end

  test "should destroy car" do
    subscription = @car.subscriptions.last

    assert_difference('Subscription.count', -1) do
      delete car_subscription_url(@car, subscription)
    end

    assert_redirected_to car_url(@car)
  end
end
