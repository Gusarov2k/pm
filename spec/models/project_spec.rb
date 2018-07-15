require 'rails_helper'

RSpec.describe Project, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end

RSpec.describe Project do
	it "has a valid factory" do
		expect(FactoryBot.build(:project)).to be_valid
	end
	# it { is_expected belong_to(:user).class_name(User) }
end