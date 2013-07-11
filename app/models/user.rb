class User < ActiveRecord::Base
  validates :password, presence: true
  validates :email, uniqueness: true
  has_many :created_events, class_name: "Event"
  has_many :event_attendances
  has_many :attended_events, through: :event_attendances, :source => :event

  # validates :email, presence: true, email: true
  include BCrypt


  # def attended_events
  #   @attended = self.event_attendances
    

  #   eventIdArray = []
  #   @attended.each do |event|
  #     eventIdArray << event.event_id
  #   end
  #   @events = []
  #   eventIdArray.each do |id|
  #     event = Event.find(id)
  #     @events << event
  #   end
  #   return @events
  # end

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @entered_password = pass
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(email, password)
    user = User.find_by_email(email)
    return user if user && (user.password == password)
    nil
  end

end
