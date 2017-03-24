get '/weather/show' do
  @current_weather = get_weather(params[:city_name], params[:unit_type])
  
  erb :'weather/index'
end

get '/weather' do
  @current_weather = get_weather(request.location.city.capitalize)
  erb :'weather/index'
end