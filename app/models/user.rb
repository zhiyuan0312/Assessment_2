class User < ActiveRecord::Base
	#e.g., User.authenticate('zen@hotmail.com','ilovecoding')
	has_many :products
	has_many :favourites
	
    validates :email, uniqueness: true, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

	def self.authenticate(email, password)
		#if email and password correspond to a valid user, return that user, otherwise return nil
		@user = User.find_by(email: email)
		if (@user != nil)
			return @user.id if @user.password == password
			return "password_invalid" if @user.password != password
		else
			return "email_invalid"
		end
	end
end