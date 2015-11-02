get '/' do
	if session[:user_id] != nil
		redirect :"users/main"
	else
		@list = User.all
		erb :"static/index"
	end
end

post '/' do
	redirect :"static/index"
end

#Go to the user's main page
get '/users/main' do
	erb :"/users/main"
end

# get 'users/login' do
# 	redirect :"users/login"
# end