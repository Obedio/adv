require 'test_helper'

class AnnexesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @annex = annexes(:one)
  end

  test "should get index" do
    get annexes_url
    assert_response :success
  end

  test "should get new" do
    get new_annex_url
    assert_response :success
  end

  test "should create annex" do
    assert_difference('Annex.count') do
      post annexes_url, params: { annex: { description: @annex.description, lawsuit_id: @annex.lawsuit_id, user_id: @annex.user_id } }
    end

    assert_redirected_to annex_url(Annex.last)
  end

  test "should show annex" do
    get annex_url(@annex)
    assert_response :success
  end

  test "should get edit" do
    get edit_annex_url(@annex)
    assert_response :success
  end

  test "should update annex" do
    patch annex_url(@annex), params: { annex: { description: @annex.description, lawsuit_id: @annex.lawsuit_id, user_id: @annex.user_id } }
    assert_redirected_to annex_url(@annex)
  end

  test "should destroy annex" do
    assert_difference('Annex.count', -1) do
      delete annex_url(@annex)
    end

    assert_redirected_to annexes_url
  end
end
