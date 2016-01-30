require 'test_helper'

class OrdersControllerTest < ActionController::TestCase
  setup do
    @order = orders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:orders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order" do
    assert_difference('Order.count') do
      post :create, order: { adress: @order.adress, city: @order.city, co: @order.co, country: @order.country, d_adress: @order.d_adress, d_city: @order.d_city, d_co: @order.d_co, d_country: @order.d_country, d_zipcode: @order.d_zipcode, email: @order.email, mobile: @order.mobile, name: @order.name, status: @order.status, zipcode: @order.zipcode }
    end

    assert_redirected_to order_path(assigns(:order))
  end

  test "should show order" do
    get :show, id: @order
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order
    assert_response :success
  end

  test "should update order" do
    patch :update, id: @order, order: { adress: @order.adress, city: @order.city, co: @order.co, country: @order.country, d_adress: @order.d_adress, d_city: @order.d_city, d_co: @order.d_co, d_country: @order.d_country, d_zipcode: @order.d_zipcode, email: @order.email, mobile: @order.mobile, name: @order.name, status: @order.status, zipcode: @order.zipcode }
    assert_redirected_to order_path(assigns(:order))
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete :destroy, id: @order
    end

    assert_redirected_to orders_path
  end
end
