get '/login' do
  erb :login
end

post '/login' do
  @user = User.find_by(username: params[:username])
  if @user.authenticate(params[:password])
    session[:user_id] = @user.id
    redirect '/'
  else
    erb :login
  end
end

get '/logout' do
  session[:user_id] = nil
  redirect '/login'
end


