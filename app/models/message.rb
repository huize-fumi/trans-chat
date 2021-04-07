class Message < ApplicationRecord

  with_options presence true do
    validates :title
    validates :content
  end

  validates :image

  belongs_to :user
  has_one_attached :image
#  belongs_to :room

end
