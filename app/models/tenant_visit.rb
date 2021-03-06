class TenantVisit < ActiveRecord::Base
	before_save { 
		self.email = email.downcase unless self.email.blank?
		self.phone = phone.gsub(/\s+/, "") unless self.phone.blank?
	}

	belongs_to :house

	validates :house_id, presence: true
	validates :name, presence: true
	validates :phone, presence: true
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	# validates :email, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }, case_sensitive: false
end
