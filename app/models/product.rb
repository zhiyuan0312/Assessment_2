class Product < ActiveRecord::Base
	#e.g., User.authenticate('zen@hotmail.com','ilovecoding')
	belongs_to :user
	has_many :favourites, dependent: :destroy
    
end