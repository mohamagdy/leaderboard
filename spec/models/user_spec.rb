require 'spec_helper'

describe User do
	describe 'Mass assignment' do
		it 'should not mass assign protected attributes' do
			User.accessible_attributes.should_not include(:level, :overall)
		end

		it 'should mass assign accessible attributes' do
			User.accessible_attributes.should include(:name)
		end
	end

	describe 'Listing' do
		before(:each) do
			@users = 10.times.inject([]) { |memo, time| memo << FactoryGirl.create(:user, level: time, overall: time); memo }.reverse
		end

		describe 'Valid attributes' do
			it 'should list top 10' do
				User.list.should == @users
			end

			it 'should list top 5' do
				User.list({top: 5}).should == @users[0..4]
			end

			it 'should sort by level only' do
				@users << (top = FactoryGirl.create(:user, level: 100, overall: 0))
				User.list({sort: 'level'}).first.should == top
			end
		end

		describe 'Invalid attributes' do
			it 'should ignore the invalid sorting parameter' do
				User.list({invalid: :parameter}).should == @users
			end
		end
	end
end
