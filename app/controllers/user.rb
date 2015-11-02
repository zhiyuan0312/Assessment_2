require 'byebug'
#NEW
get '/users/new' do
	erb :"/users/new"
end

#CREATE new user
post '/users' do
	@user = User.new(email: params[:email], password: params[:password])
	if @user.save
		redirect to '/'
		@message = "Signed up. You may login now."
	else
		redirect to '/failed_create_user'
		@message ="Please enter a valid emai"
	end
end

#INDEX
get '/users/' do
end

#SHOW
get '/users/:user_id' do
end

#EDIT
get '/users/:user_id/edit' do
end

#UPDATE
put '/users/:user_id' do
end

#DELETE
delete '/users/:user_id' do
end

post '/login' do
	#apply authentication method to check if a user has entered a valid email and password
	#if a user has successfully been authenticated, assign the current user id to a session

	@login = User.authenticate(params[:email], params[:password])
		case @login
			when "email_invalid"
				@error = "Invalid email"
			when "password_invalid"
				@error = "Password invalid"
		else
			#save user id into session (similiar to params)
			session[:user_id] = @login
			redirect :"/users/main"
		end
end

post '/users/logout' do
	#kill a session when user chooses to logout
	session[:user_id] = nil
	redirect :"/"
end

#show all my products which has been favourite by other users
get '/user/:user_id/popular_product' do
	product_num = []
	@all_favourite = Favourite.all
	@my_products = Product.where(user_id: current_user.id)
	@my_products.each do |x|
			product_num << x.id
	@popular_product = @all_favourite.where(product_id: [product_num])
	end
	byebug
	erb :"/users/popular_product"
end
