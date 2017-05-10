require 'test_helper'

class TeamChallengeMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_challenge_membership = team_challenge_memberships(:one)
  end

  test "should get index" do
    get team_challenge_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_team_challenge_membership_url
    assert_response :success
  end

  test "should create team_challenge_membership" do
    assert_difference('TeamChallengeMembership.count') do
      post team_challenge_memberships_url, params: { team_challenge_membership: { challenge_id_id: @team_challenge_membership.challenge_id_id, team_id_id: @team_challenge_membership.team_id_id } }
    end

    assert_redirected_to team_challenge_membership_url(TeamChallengeMembership.last)
  end

  test "should show team_challenge_membership" do
    get team_challenge_membership_url(@team_challenge_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_team_challenge_membership_url(@team_challenge_membership)
    assert_response :success
  end

  test "should update team_challenge_membership" do
    patch team_challenge_membership_url(@team_challenge_membership), params: { team_challenge_membership: { challenge_id_id: @team_challenge_membership.challenge_id_id, team_id_id: @team_challenge_membership.team_id_id } }
    assert_redirected_to team_challenge_membership_url(@team_challenge_membership)
  end

  test "should destroy team_challenge_membership" do
    assert_difference('TeamChallengeMembership.count', -1) do
      delete team_challenge_membership_url(@team_challenge_membership)
    end

    assert_redirected_to team_challenge_memberships_url
  end
end
