class Event < ApplicationRecord
  validates :name, presence: true
  validates :start_time, presence: true, uniqueness: true
  validates :location, presence: true
  validates :user_id, presence: true, numericality: true
end
