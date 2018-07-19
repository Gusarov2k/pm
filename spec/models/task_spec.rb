require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:task)).to be_valid
  end

  it {is_expected.to validate_presence_of(:name)}
  it {is_expected.to validate_presence_of(:description)}
end
