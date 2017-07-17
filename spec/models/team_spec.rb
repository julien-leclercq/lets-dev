require 'rails_helper'

describe Team do
  it :has_valid_factory do
    expect(FactoryGirl.build(:team)).to be_valid
  end

  describe :validates do
    describe :presence_of do
      it :name do
        expect(FactoryGirl.build(:team, name: nil)).not_to be_valid
      end
    end

    describe :uniqueness_of do
      it :name do
        t = FactoryGirl.create(:team)
        expect(FactoryGirl.build(:team, name: t.name)).not_to be_valid
      end
    end
  end
end
