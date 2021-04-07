class Room < ApplicationRecord

  with_options presence: true do
    validates :name
    validates :post
  end
end
