require 'byebug'
#NEW
get '/product/new' do
	erb :"/products/new"
end

#CREATE new product
post '/product' do
	@product = Product.create(name: params[:name],description: params[:description], price: params[:price], user_id: current_user.id)
	byebug
	redirect :"/users/main"
end

#INDEX
get '/product' do
	@product = Product.all.order(:id)
	erb :"/products/main"
end

#SHOW
get '/product/:product_id' do
end

#EDIT
get '/:product_id/edit' do
end

#UPDATE
put '/product/:product_id' do
end

#DELETE
delete '/product/:product_id' do
end