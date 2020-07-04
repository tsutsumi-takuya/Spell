class Spot < ApplicationRecord
  belongs_to :user

  attachment :spot_image, destroy: false
end
