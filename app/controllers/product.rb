require 'byebug'
#NEW
get '/product/new' do
	erb :"/products/new"
end

#CREATE new product
post '/product' do
	@product = Product.create(name: params[:name],description: params[:description], price: params[:price], user_id: current_user.id)
	redirect :"/users/main"
end

#INDEX
get '/product' do
	@product = Product.all.order(:id)
	@user = User.all
	erb :"/products/main"
end

#SHOW
get '/product/:product_id' do
end

#EDIT
get '/:product_id/edit' do
	@product = Product.find(params[:product_id])
	if @product.user_id == current_user.id
	erb :"/products/edit"
		else
	@error = "You cannot edit products which do not belong to you!"
	end
end

#UPDATE
put '/product/:product_id/patch' do
	@product = Product.find(params[:product_id])
	@product.update(name: params[:edited_name], description: params[:edited_description], price: params[:edited_price])
	redirect :"/product"
end

#DELETE
delete '/product/:product_id/delete' do
	@product = Product.find(params[:product_id])
	@favourite = Favourite.where(product_id: params[:product_id])
	if @product.user_id == current_user.id
		@product.destroy
		redirect :"/product"
	else
		@error ="You cannot delete products which do not belong to you!"
	end
end