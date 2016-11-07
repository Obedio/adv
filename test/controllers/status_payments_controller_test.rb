require 'test_helper'

class StatusPaymentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @status_payment = status_payments(:one)
  end

  test "should get index" do
    get status_payments_url
    assert_response :success
  end

  test "should get new" do
    get new_status_payment_url
    assert_response :success
  end

  test "should create status_payment" do
    assert_difference('StatusPayment.count') do
      post status_payments_url, params: { status_payment: { name: @status_payment.name } }
    end

    assert_redirected_to status_payment_url(StatusPayment.last)
  end

  test "should show status_payment" do
    get status_payment_url(@status_payment)
    assert_response :success
  end

  test "should get edit" do
    get edit_status_payment_url(@status_payment)
    assert_response :success
  end

  test "should update status_payment" do
    patch status_payment_url(@status_payment), params: { status_payment: { name: @status_payment.name } }
    assert_redirected_to status_payment_url(@status_payment)
  end

  test "should destroy status_payment" do
    assert_difference('StatusPayment.count', -1) do
      delete status_payment_url(@status_payment)
    end

    assert_redirected_to status_payments_url
  end
end
