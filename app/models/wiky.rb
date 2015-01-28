class Wiky < ActiveRecord::Base
  belongs_to :user
  before_create :default_to_public

  private 
  def default_to_public
    self.public = true
  end 
end
