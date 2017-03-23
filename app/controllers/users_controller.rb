before '/users/new' do
  authorization_redirect
end

get '/users/new' do
  authorization_redirect
  erb :'/users/new'
end


post '/users' do
  authorization_redirect
  user = User.new(params[:user])
  
  if user.save
    session[:user_id] = user.id
    redirect "/"
  else
    @errors = user.errors.full_messages
    erb :'users/new'
  end
end

get '/users/:user_id' do
  authorization_redirect
  
  if authorized?(params[:user_id])
    erb :'users/show'
  else
    redirect "/users/#{current_user.id}"
  end
end
