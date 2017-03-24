get '/weather/show' do
  @current_weather = get_weather(params[:city_name], params[:unit_type])
  p @current_weather
  erb :'weather/index'
end

get '/weather' do
  # @current_weather = get_weather
  erb :'weather/index'
end