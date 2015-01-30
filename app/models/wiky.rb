class Wiky < ActiveRecord::Base
  belongs_to :user
  scope :public_wikys, -> { where(public: true) }
  scope :private_wikys, -> {where(public: false)}
end
