require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { estimated_annual_mileage: @vehicle.estimated_annual_mileage, estimated_vehicle_value: @vehicle.estimated_vehicle_value, policy_start_date: @vehicle.policy_start_date, typical_parking_location: @vehicle.typical_parking_location, vehicle_registration: @vehicle.vehicle_registration }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { estimated_annual_mileage: @vehicle.estimated_annual_mileage, estimated_vehicle_value: @vehicle.estimated_vehicle_value, policy_start_date: @vehicle.policy_start_date, typical_parking_location: @vehicle.typical_parking_location, vehicle_registration: @vehicle.vehicle_registration }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
