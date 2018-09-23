require 'test_helper'

class DriverhistoriesControllerTest < ActionController::TestCase
  setup do
    @driverhistory = driverhistories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:driverhistories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driverhistory" do
    assert_difference('Driverhistory.count') do
      post :create, driverhistory: { no_of_incidents: @driverhistory.no_of_incidents }
    end

    assert_redirected_to driverhistory_path(assigns(:driverhistory))
  end

  test "should show driverhistory" do
    get :show, id: @driverhistory
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driverhistory
    assert_response :success
  end

  test "should update driverhistory" do
    patch :update, id: @driverhistory, driverhistory: { no_of_incidents: @driverhistory.no_of_incidents }
    assert_redirected_to driverhistory_path(assigns(:driverhistory))
  end

  test "should destroy driverhistory" do
    assert_difference('Driverhistory.count', -1) do
      delete :destroy, id: @driverhistory
    end

    assert_redirected_to driverhistories_path
  end
end
