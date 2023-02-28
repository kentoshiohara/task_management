class List < ApplicationRecord
  acts_as_list
  
  belongs_to :user
  has_many :cards, -> { order(position: :asc) }, dependent: :destroy

  validates :title, length: {in: 1...255}
end
