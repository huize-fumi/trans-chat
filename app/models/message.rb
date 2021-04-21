class Message < ApplicationRecord

  validates :content, presence: true, unless: :was_attached?

  # validates :comment, presence: true, unless: :was_attached?
  # validates :translate, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end



  belongs_to :user
  has_one_attached :image
  belongs_to :room
  # belongs_to :trans

end