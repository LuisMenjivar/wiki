class Wiky < ActiveRecord::Base
  belongs_to :user
  has_many :collaborations
  has_many :collaborators, through: :collaborations, source: "user"
  validates :title, length: { minimum: 5 }
  scope :public_wikys, -> { where(public: true) }
  scope :private_wikys, -> {where(public: false)}

  def self.search_for(keyword)
    keywords = "%#{keyword}%"
    Wiky.where("title LIKE  ? OR body LIKE ?", keywords, keywords)
  end
end
