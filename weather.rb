require 'csv'

weather = CSV.read('weather-2013.csv')
headers = weather.shift

CSV.open('weather-new.csv', 'a') do |csv|
  csv << ['date', 'tmin', 'tmax']
  
  weather.each do |row|
    date = DateTime.strptime(row[2], '%Y%m%d')
    if (3..5) === date.month
      csv << [date.strftime('%Y-%m-%d'), Float(row[7]) / 10, Float(row[6]) / 10]
    end
  end
end
