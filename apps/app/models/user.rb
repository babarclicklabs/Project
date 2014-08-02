class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  attr_accessor  :signin
  validates :username, :uniqueness=> {:case_sensitive =>false}     
  
  def self.find_for_database_authentication(warden_conditions)
  conditions = warden_conditions.dup
  login = conditions.delete(:signin)
  where(conditions).where(["lower(username) = :value OR lower(email) = 
    :value", {:value => login.strip.downcase }]).first
end

end
