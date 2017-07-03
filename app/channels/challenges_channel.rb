class ChallengesChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'challenges'
  end
end
