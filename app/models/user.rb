class User < ActiveRecord::Base
  has_many :potlucks, foreign_key: :host_id
  has_many :rsvps, foreign_key: :attendee_id
  has_many :parties, through: :rsvps
  
  validates :email, presence: true, uniqueness: true
  validates :username, presence: true, uniqueness: true
  # will nto work with hash because empty string gets hashed
  validates :password, presence: true
  
  # memoization, left side is returned if true
  #if not true right side is evaluated and set equal to left side
  def password
    @password ||= BCrypt::Password.new(hashed_password)
  end
  
  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.hashed_password = @password
  end
  
  def self.authenticate(params)
    user = User.find_by(username: params[:username])
    return user if user && user.password == params[:password]
  end
end
