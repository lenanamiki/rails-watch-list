require 'json'
require 'open-uri'

puts 'Fetching url data...'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movies = JSON.parse(URI.open(url).read)['results']

puts 'Creating movie database...'

movies.each do |m|
  Movie.create!(
    title: m['title'],
    overview: m['overview'],
    poster_url: m['poster_path'],
    rating: m['vote_average']
  )
end

puts 'All done!'
