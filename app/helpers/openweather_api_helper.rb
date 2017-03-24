helpers do
  def weather_api_key
    ENV["OPENWEATHER_API"]
  end
  
  def get_weather(city='Chicago', units='imperial')
    JSON.load(open("http://api.openweathermap.org/data/2.5/weather?q=#{city}&APPID=#{weather_api_key}&units=#{units}"))
  end
  
  def get_icon_source(icon_code)
    "http://openweathermap.org/img/w/#{icon_code}.png"
  end
  
  def temperature(weather)
    weather['main']['temp']
  end
  
  def pressure(weather)
    weather['main']['pressure']
  end
end