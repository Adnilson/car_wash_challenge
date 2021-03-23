require "test_helper"

class CarTest < ActiveSupport::TestCase
  def setup
    @model ||= Model.first
  end

  test "Fields presence validations" do
    car = Car.new(year: 2021, color: 'blue', license_plate: '33-DS-22', price: 320, model: @model)
    car2 = Car.new(color: 'blue', license_plate: 'PT', price: 320, model: @model)
    car3 = Car.new(year: 2021, license_plate: 'PT', price: 320, model: @model)
    car4 = Car.new(year: 2021, color: 'blue', price: 320, model: @model)
    car5 = Car.new(year: 2021, color: 'blue', license_plate: 'PT', model: @model)
    car6 = Car.new(year: 2021, color: 'blue', license_plate: 'PT', price: 320)

    assert car.save
    assert_not car2.save
    assert_not car3.save
    assert_not car4.save
    assert_not car5.save
    assert_not car6.save
  end

  test "license_plate uniqueness validation" do
    Car.create(year: 2021, color: 'blue', license_plate: 'PT', price: 320, model: @model)
    second = Car.new(year: 2021, color: 'blue', license_plate: 'PT', price: 320, model: @model)

    assert_not second.save
  end

  test "license_plate format validation" do
    car = Car.new(year: 2021, color: 'blue', license_plate: '33-DS-22', price: 320, model: @model)
    car2 = Car.new(year: 2021, color: 'blue', license_plate: '', price: 320, model: @model)
    car3 = Car.new(year: 2021, color: 'blue', license_plate: 'DS-DS-22', price: 320, model: @model)
    car4 = Car.new(year: 2021, color: 'blue', license_plate: 'PT', price: 320, model: @model)

    assert car.save
    assert_not car2.save
    assert_not car3.save
    assert_not car4.save
  end
end
