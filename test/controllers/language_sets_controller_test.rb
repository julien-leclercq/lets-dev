require 'test_helper'

class LanguageSetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @language_set = language_sets(:one)
  end

  test "should get index" do
    get language_sets_url
    assert_response :success
  end

  test "should get new" do
    get new_language_set_url
    assert_response :success
  end

  test "should create language_set" do
    assert_difference('LanguageSet.count') do
      post language_sets_url, params: { language_set: { name: @language_set.name } }
    end

    assert_redirected_to language_set_url(LanguageSet.last)
  end

  test "should show language_set" do
    get language_set_url(@language_set)
    assert_response :success
  end

  test "should get edit" do
    get edit_language_set_url(@language_set)
    assert_response :success
  end

  test "should update language_set" do
    patch language_set_url(@language_set), params: { language_set: { name: @language_set.name } }
    assert_redirected_to language_set_url(@language_set)
  end

  test "should destroy language_set" do
    assert_difference('LanguageSet.count', -1) do
      delete language_set_url(@language_set)
    end

    assert_redirected_to language_sets_url
  end
end
