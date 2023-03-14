require 'test_helper'

class LemonadeTypesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    post :create, params: {lemonade_type: {label: "testLabel",color:"red",price:20}}
    assert_response :redirect
  end

  # test "should get edit" do
  #   get :edit
  #   assert_response :success
  # end

  # test "should get update" do
  #   get :update
  #   assert_response :success
  # end

  # test "should get destroy" do
  #   delete :destroy
  #   assert_response :success
  # end

end
