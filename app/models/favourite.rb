class Favourite < ActiveRecord::Base
	#e.g., User.authenticate('zen@hotmail.com','ilovecoding')
	belongs_to :user
	belongs_to :product
    
end