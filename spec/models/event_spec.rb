require 'rails_helper'

RSpec.describe Event, type: :model do
  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :start_time}
    it {should validate_presence_of :location}
    it {should validate_presence_of :user_id}
  end
end
