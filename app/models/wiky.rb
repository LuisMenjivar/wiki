class Wiky < ActiveRecord::Base
  has_many :collaborations
  has_many :users, through: :collaborations
  validates :title, length: { minimum: 5 }
  scope :public_wikys, -> { where(public: true) }
  scope :private_wikys, -> {where(public: false)}
end
