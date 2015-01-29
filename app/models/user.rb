class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikys

  before_create :default_to_standard
  
  def admin? 
    role == "admin"
  end

  def premium?
    role == "premium"
  end

  def standard?
    role == "standard"
  end

  private
  
  def default_to_standard
    self.role = "standard"
  end 
end 