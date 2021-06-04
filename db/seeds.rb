# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Removing all movies..."
Movie.destroy_all
List.destroy_all

puts "Creating movies..."
url = 'http://tmdb.lewagon.com/movie/top_rated?api_key=%3Cyour_api_key%3E'
response = RestClient.get(url)
data = JSON.parse(response.body)

puts "Creating movies..."
data['results'].each do |info|
  Movie.create!(
    title: info['title'],
    overview: info['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500#{info['poster_path']}",
    rating: info['vote_average']
  )
end

puts "All done 🎉"
