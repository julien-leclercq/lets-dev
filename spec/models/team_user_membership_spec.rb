require 'rails_helper'

describe TeamUserMembership do
  it :has_valid_factory do
    expect(FactoryGirl.build(:team_user_membership)).to be_valid
  end

  describe :validates do
    describe :presence_of do
      it :team do
        expect(FactoryGirl.build(:team_user_membership, team: nil)).not_to be_valid
      end

      it :user do
        expect(FactoryGirl.build(:team_user_membership, user: nil)).not_to be_valid
      end
    end

    #describe :uniqueness_of do
    #  it :active_membership_by_user do
    #    t = FactoryGirl.create(:team_user_membership)
    #    expect(FactoryGirl.build(:team_user_membership, user: t.user)).not_to be_valid
    #  end
    #end
  end
end
