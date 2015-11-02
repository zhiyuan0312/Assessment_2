class CreateFavourites < ActiveRecord::Migration
	def change
		create_table :favourites do |t|
			t.belongs_to :user, index: true
			t.belongs_to :product, index: true
			t.string :user_name
			t.timestamps null: false
		end
	end
end
