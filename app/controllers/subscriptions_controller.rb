class SubscriptionsController < ApplicationController
  def new
    @subscription = Subscription.new
  end

  def create
    @car = Car.find(params[:car_id])
    @subscription = @car.subscriptions.new(subscription_params)

    if @subscription.save
      redirect_to car_path(@subscription.car_id), notice: 'Subscription successfully created'
    else
      render :new
    end
  end

  def destroy
    @subscription = Subscription.find(params[:id])
    @subscription.destroy

    redirect_to car_path(@subscription.car_id), notice: 'Subscription successfully created'
  end

  private

    def subscription_params
      params.require(:subscription).permit(:start, :end)
    end
end
