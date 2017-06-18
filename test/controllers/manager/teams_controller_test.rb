require 'test_helper'

class Manager::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @manager_team = manager_teams(:one)
  end

  test "should get index" do
    get manager_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_manager_team_url
    assert_response :success
  end

  test "should create manager_team" do
    assert_difference('Manager::Team.count') do
      post manager_teams_url, params: { manager_team: {  } }
    end

    assert_redirected_to manager_team_url(Manager::Team.last)
  end

  test "should show manager_team" do
    get manager_team_url(@manager_team)
    assert_response :success
  end

  test "should get edit" do
    get edit_manager_team_url(@manager_team)
    assert_response :success
  end

  test "should update manager_team" do
    patch manager_team_url(@manager_team), params: { manager_team: {  } }
    assert_redirected_to manager_team_url(@manager_team)
  end

  test "should destroy manager_team" do
    assert_difference('Manager::Team.count', -1) do
      delete manager_team_url(@manager_team)
    end

    assert_redirected_to manager_teams_url
  end
end
