class User < ActiveRecord::Base
	validates :email, confirmation: true
	validates :country, :password, :name,:mobile, presence: true
	before_validation :check_all_value
  before_create :ensure_username_has_a_value
 
  protected
    def ensure_username_has_a_value
       if !username.present?
        self.username = email unless email.blank?
      end
    end

    def check_all_value
    	if !email.present? or !password.present? or !name.present? or !mobile.present? 
    	 errors.add(:email, "please write email")
    	 errors.add(:name, "name can't be blank plz fill")
    	 errors.add(:password, "password is compulsury")
    	end
    end
end
