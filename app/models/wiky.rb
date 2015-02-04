class Wiky < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations, class_name: "User"
  validates :title, length: { minimum: 5 }
  scope :public_wikys, -> { where(public: true) }
  scope :private_wikys, -> {where(public: false)}
end
