require 'rails_helper'

RSpec.describe Project do
	it "has a valid factory" do
    expect(FactoryBot.build(:project)).to be_valid
  end

  it {is_expected.to belongs_to(:user)}
  it {is_expected.to has_many(:tasks)}
  it {is_expected.to ensure_length_of(:name).is_at_least(4).is_at_most(30)}
  it {is_expected.not_to allow_value('').for(:name)}
  it {is_expected.to validate_presence_of(:user)}
end
