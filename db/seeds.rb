# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'uri'
require 'net/http'
require 'json'

x = 1
shows = [] 
show_info = []

while x < 30
  url = URI("https://api.themoviedb.org/3/tv/top_rated?language=en-US&page=#{x}")

  http = Net::HTTP.new(url.host, url.port)
  http.use_ssl = true

  request = Net::HTTP::Get.new(url)
  request["accept"] = 'application/json'
  request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZGY2MDQ2MmRmZGM1NDMxMGVhOTFiNzg2N2QyNDkyMCIsIm5iZiI6MTcyOTcxODAwOS45OTg2MzMsInN1YiI6IjY3MTE4MjMyMWYwZWE0NzE0ZWRiYzk2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.fmmPh6S7de2KQD_pXv3I-gSRE3szPQ01Wufdx9W-qS8'

  response = http.request(request)
  page_data = JSON.parse(response.read_body) 
  shows.concat(page_data["results"]) 

  x += 1
end

# Print the original_name of each show
shows.each do |show|
  title = show['original_name']
  image = "https://media.themoviedb.org/t/p/w300_and_h450_bestv2#{show['poster_path']}.jpg"
  overview = show['overview'] 
  show_id = show['id']
  avg_rating = show['vote_average']


  new_show = Show.find_or_create_by!(
        title: title,
        image: image,
        overview: overview,
        show_id: show_id,
        avg_rating: avg_rating
      )
  
  if new_show.persisted?
url = URI("https://api.themoviedb.org/3/tv/#{show['id']}?language=en-US")

http = Net::HTTP.new(url.host, url.port)
http.use_ssl = true
      
request = Net::HTTP::Get.new(url)
request["accept"] = 'application/json'
request["Authorization"] = 'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJjZGY2MDQ2MmRmZGM1NDMxMGVhOTFiNzg2N2QyNDkyMCIsIm5iZiI6MTcyOTk4MDk2NS41MTg5NTQsInN1YiI6IjY3MTE4MjMyMWYwZWE0NzE0ZWRiYzk2NiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.PPUqL_xs0Ept08pFyzRc0mme-B13usfR7rvwDe6RrDw'
      
response = http.request(request)
show_info = JSON.parse(response.read_body) 

name = show_info['name'] 
overview = show_info['overview']
number_of_episodes = show_info['number_of_episodes']
number_of_seasons = show_info['number_of_seasons']
new_show_detail = new_show.create_show_detail!(
  name: name,
  overview: overview,
  number_of_episodes: number_of_episodes,
  number_of_seasons: number_of_seasons
)

  show_info['seasons'].each do |season|
    season_name = season['name']
    number_of_episodes = season['episode_count']
    poster_path = season['poster_path']
    vote_average = season['vote_average']
    overview = season['overview']
  
    new_season = new_show_detail.seasons.create!(
      season_name: season_name,
      number_of_episodes: number_of_episodes,
      poster_path: poster_path,
      vote_average: vote_average,
      overview: overview
    )
    
    end

  
  end
end

# for episode_num in 1..number_of_episodes do
  


  
# end


