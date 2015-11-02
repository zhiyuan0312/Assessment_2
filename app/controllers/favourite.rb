require 'byebug'
#NEW
get '/product/:product_id/favourite/new' do

end

#CREATE new favourite
post '/product/:product_id/favourite' do
	@product = Product.find(params[:product_id])
	@favourite = Favourite.find_by(product_id: params[:product_id], user_id: current_user.id)
	byebug
	if @product.user_id == current_user.id
	@error = "You cannot add your own products to favourite!"
	elsif 
		@favourite != nil && @favourite.user_id == current_user.id
		@error = "You cannont favourite the same item twice!"
		else
	@favourite_new = Favourite.create(user_id: current_user.id, product_id: params[:product_id])
	redirect :"/product"
	end
end

#INDEX view all favourite item by user
get '/user/:user_id/favourite' do
	@my_favourite = Favourite.where(user_id: current_user.id)
	erb :"/favourite/main"

end

#SHOW
get '/product/:product_id/favourite/:favourite_id' do
end

#EDIT
get '/:product/:product_id/favourite/:favourite_id/edit' do

end

#UPDATE
put '/product/:product_id/favourite/:favourite_id/patch' do

end

#DELETE
delete '/user/:user_id/favourite/:favourite_id/delete' do
	@favourite = Favourite.find(params[:favourite_id])
	@favourite.delete
	redirect :"/user/:user_id/favourite"

end