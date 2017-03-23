class Rsvp < ActiveRecord::Base
  belongs_to :attendee, class_name: :User
  belongs_to :party, class_name: :Potluck
  
  validates :attendee_id, presence: true
  validates :party_id, presence: true
  validates :food_name, presence: true
  validates :food_name, uniqueness: { scope: :party_id}
end
