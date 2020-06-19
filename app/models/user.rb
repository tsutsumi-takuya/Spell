class User < ApplicationRecord
	# Include default devise modules. Others available are:
	# :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

	has_many :spots, dependent: :destroy

	enum is_active: {Available: true, Invalid: false}

	def active_for_authentication?
		super && (self.is_active === "Available")
	end

end
