get '/weather/new' do
  
  erb :'weather/new'
end

get '/weather' do
  @current_weather = get_weather
  erb :'weather/index'
end