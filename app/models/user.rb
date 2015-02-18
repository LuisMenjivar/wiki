class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  has_many :wikys
  has_many :collaborations
  has_many :collaborated_wikys, through: :collaborations, source: "wiky"
  before_validation :default_to_standard

 
  
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
    self.role = "standard" if self.role.blank?
  end
end 