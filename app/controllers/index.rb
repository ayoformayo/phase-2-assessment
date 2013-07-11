enable 'sessions'

get '/' do
 @user = User.find(session[:user_id].to_i) if session[:logged_in]
  erb :index
end

get '/sign_in' do

erb :sign_in
end

post '/sign_in' do
@user = User.authenticate(params[:user][:email], params[:user][:password])

session[:user_id] = @user.id
session[:logged_in] = true
redirect '/'
end

get '/sign_up' do
  erb :sign_up
end

post '/sign_up' do

  p params[:user]
  @user = User.new(params[:user])
  p @user
  if @user.save
    session[:user_id] = @user.id
    session[:logged_in] = true
    redirect '/'
  end

end

post '/logout' do
session.clear
redirect '/'
end
