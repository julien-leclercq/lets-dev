require 'test_helper'

class LanguageSetMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language_set_membership = language_set_memberships(:one)
  end

  test "should get index" do
    get language_set_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_language_set_membership_url
    assert_response :success
  end

  test "should create language_set_membership" do
    assert_difference('LanguageSetMembership.count') do
      post language_set_memberships_url, params: { language_set_membership: { language_id_id: @language_set_membership.language_id_id, language_set_id_id: @language_set_membership.language_set_id_id } }
    end

    assert_redirected_to language_set_membership_url(LanguageSetMembership.last)
  end

  test "should show language_set_membership" do
    get language_set_membership_url(@language_set_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_language_set_membership_url(@language_set_membership)
    assert_response :success
  end

  test "should update language_set_membership" do
    patch language_set_membership_url(@language_set_membership), params: { language_set_membership: { language_id_id: @language_set_membership.language_id_id, language_set_id_id: @language_set_membership.language_set_id_id } }
    assert_redirected_to language_set_membership_url(@language_set_membership)
  end

  test "should destroy language_set_membership" do
    assert_difference('LanguageSetMembership.count', -1) do
      delete language_set_membership_url(@language_set_membership)
    end

    assert_redirected_to language_set_memberships_url
  end
end
