class Spot < ApplicationRecord
  belongs_to :user

  attachment :spot_image, destroy: false

  def self.search(search)
  	if
  		search
  		Spot.where(['spot_name LIKE ?', "%#{search}%"])

  	else
  		Spot.all
  	end
  end

end
