class Wiky < ActiveRecord::Base
  belongs_to :user
  validates :title, length: { minimum: 5 }
  scope :public_wikys, -> { where(public: true) }
  scope :private_wikys, -> {where(public: false)}
end
