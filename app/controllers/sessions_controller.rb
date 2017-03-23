get '/sessions/new' do
  if logged_in?
    redirect "/"
  else
    erb :'sessions/new' #/login
  end
end

post '/sessions' do
  user = User.authenticate(params)
  
  if user
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = ['Invalid username or password.']
    erb :'sessions/new' #/login
  end
end

delete '/sessions' do
  session[:user_id] = nil
  
  redirect '/sessions/new' #/login or home
end
