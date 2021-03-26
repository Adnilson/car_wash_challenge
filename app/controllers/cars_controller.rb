class CarsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :set_car, only: [:show, :edit, :update, :destroy]

  # GET /cars
  def index
    @cars = Car
              .includes(:subscriptions, model: [:maker])
              .order(sort_column + ' ' + sort_direction)
              .page(params[:page])
  end

  # GET /cars/1
  def show
    @subscriptions = @car.subscriptions&.order(:end)
  end

  # GET /cars/new
  def new
    @car = Car.new
  end

  # GET /cars/1/edit
  def edit
  end

  # POST /cars
  def create
    @car = Car.new(car_params)

    if @car.save
      redirect_to @car, notice: 'Car was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /cars/1
  def update
    if @car.update(car_params)
      redirect_to @car, notice: 'Car was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /cars/1
  def destroy
    @car.destroy
    redirect_to cars_url, notice: 'Car was successfully destroyed.'
  end

  private
    def set_car
      @car = Car.includes(:subscriptions, model: [:maker]).find(params[:id])
    end

    def car_params
      params.require(:car).permit(:model_id, :year, :color, :license_plate, :price)
    end

    def sort_column
      sorting_options.include?(params[:sort]) ? params[:sort] : 'price'
    end

    def sort_direction
      %w(asc desc).include?(params[:direction]) ? params[:direction] : 'asc'
    end

    def sorting_options
      @sorting_options ||= [
        'makers.name',
        'color',
        'year',
        'price',
        'availability'
      ]
    end
end
