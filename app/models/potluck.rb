class Potluck < ActiveRecord::Base
  belongs_to :host, class_name: :User
  has_many   :rsvps, foreign_key: :party_id
  has_many   :attendees, through: :rsvps
  
  validates :name, presence: true, uniqueness: true
  validates :location, presence: true
  validates :starts_at, presence: true
  validates :host_id, presence: true
end
