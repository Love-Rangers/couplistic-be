require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :start_time}
    it {should validate_uniqueness_of :start_time}
    it {should validate_presence_of :location}
    it {should validate_presence_of :user_id}
    it {should validate_numericality_of :user_id}

    it "validates that the start_time must be datetime" do
      expect { Event.create!(location: 'red', name: 'jax', start_time: 'tt', user_id: 5) }.to raise_exception(ActiveRecord::RecordInvalid)
    end
  end
end
