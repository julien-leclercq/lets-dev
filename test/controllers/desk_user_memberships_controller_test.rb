require 'test_helper'

class DeskUserMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @desk_user_membership = desk_user_memberships(:one)
  end

  test "should get index" do
    get desk_user_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_desk_user_membership_url
    assert_response :success
  end

  test "should create desk_user_membership" do
    assert_difference('DeskUserMembership.count') do
      post desk_user_memberships_url, params: { desk_user_membership: { desk_id_id: @desk_user_membership.desk_id_id, user_id_id: @desk_user_membership.user_id_id } }
    end

    assert_redirected_to desk_user_membership_url(DeskUserMembership.last)
  end

  test "should show desk_user_membership" do
    get desk_user_membership_url(@desk_user_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_desk_user_membership_url(@desk_user_membership)
    assert_response :success
  end

  test "should update desk_user_membership" do
    patch desk_user_membership_url(@desk_user_membership), params: { desk_user_membership: { desk_id_id: @desk_user_membership.desk_id_id, user_id_id: @desk_user_membership.user_id_id } }
    assert_redirected_to desk_user_membership_url(@desk_user_membership)
  end

  test "should destroy desk_user_membership" do
    assert_difference('DeskUserMembership.count', -1) do
      delete desk_user_membership_url(@desk_user_membership)
    end

    assert_redirected_to desk_user_memberships_url
  end
end
