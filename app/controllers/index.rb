get '/' do
  if session[:user].nil?
    @clickhere = $text[0]; @action = "login"; @button = "Log In"
    erb :index
  else
    erb :lobby
  end
end

get '/register' do
  if session[:user].nil?
    @clickhere = $text[2]
    @name = $text[1]; @action = "register"; @button = "submit"
    erb :index
  else
    erb :lobby
  end
end

post '/login' do
  session[:user] = User.login(params[:email], params[:pass])
  if session[:user].nil?
    @error = "Invalid email/password"
    @clickhere = $text[0]; @action = "login"; @button = "Log In"
    erb :index
  else
    erb :lobby
  end
end

post '/register' do
  register = User.register(params[:name], params[:email], params[:pass])
  if register.nil?
    @clickhere = $text[2]
    @name = $text[1]; @action = "register"; @button = "submit"
    @error = "Email has been taken"
    erb :index
  else
    @clickhere = $text[0]; @action = "login"; @button = "Log In"
    @error = "Account Created successfully"
    erb :index
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end