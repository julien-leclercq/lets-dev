require 'test_helper'

class JuryChallengeMembershipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @jury_challenge_membership = jury_challenge_memberships(:one)
  end

  test "should get index" do
    get jury_challenge_memberships_url
    assert_response :success
  end

  test "should get new" do
    get new_jury_challenge_membership_url
    assert_response :success
  end

  test "should create jury_challenge_membership" do
    assert_difference('JuryChallengeMembership.count') do
      post jury_challenge_memberships_url, params: { jury_challenge_membership: { challenge_id_id: @jury_challenge_membership.challenge_id_id, user_id_id: @jury_challenge_membership.user_id_id } }
    end

    assert_redirected_to jury_challenge_membership_url(JuryChallengeMembership.last)
  end

  test "should show jury_challenge_membership" do
    get jury_challenge_membership_url(@jury_challenge_membership)
    assert_response :success
  end

  test "should get edit" do
    get edit_jury_challenge_membership_url(@jury_challenge_membership)
    assert_response :success
  end

  test "should update jury_challenge_membership" do
    patch jury_challenge_membership_url(@jury_challenge_membership), params: { jury_challenge_membership: { challenge_id_id: @jury_challenge_membership.challenge_id_id, user_id_id: @jury_challenge_membership.user_id_id } }
    assert_redirected_to jury_challenge_membership_url(@jury_challenge_membership)
  end

  test "should destroy jury_challenge_membership" do
    assert_difference('JuryChallengeMembership.count', -1) do
      delete jury_challenge_membership_url(@jury_challenge_membership)
    end

    assert_redirected_to jury_challenge_memberships_url
  end
end
