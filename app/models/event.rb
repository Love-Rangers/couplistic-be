class Event < ApplicationRecord
  validates :name, presence: true
  validates :start_time, presence: true, uniqueness: true
  # validate :start_time_is_valid_datetime
  validates :location, presence: true
  validates :user_id, presence: true, numericality: true


  def start_time_is_valid_datetime
    errors.add(:start_time, 'must be a valid datetime') unless DateTime.parse(start_time).class == DateTime
  end

end
