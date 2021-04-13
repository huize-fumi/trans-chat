class Message < ApplicationRecord

  
  validates :content, presence: true

  belongs_to :user
  has_one_attached :image
  belongs_to :room

end
