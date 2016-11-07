require 'test_helper'

class DataUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @data_user = data_users(:one)
  end

  test "should get index" do
    get data_users_url
    assert_response :success
  end

  test "should get new" do
    get new_data_user_url
    assert_response :success
  end

  test "should create data_user" do
    assert_difference('DataUser.count') do
      post data_users_url, params: { data_user: { born: @data_user.born, name: @data_user.name, office_id: @data_user.office_id, sex: @data_user.sex, user_id: @data_user.user_id } }
    end

    assert_redirected_to data_user_url(DataUser.last)
  end

  test "should show data_user" do
    get data_user_url(@data_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_data_user_url(@data_user)
    assert_response :success
  end

  test "should update data_user" do
    patch data_user_url(@data_user), params: { data_user: { born: @data_user.born, name: @data_user.name, office_id: @data_user.office_id, sex: @data_user.sex, user_id: @data_user.user_id } }
    assert_redirected_to data_user_url(@data_user)
  end

  test "should destroy data_user" do
    assert_difference('DataUser.count', -1) do
      delete data_user_url(@data_user)
    end

    assert_redirected_to data_users_url
  end
end
