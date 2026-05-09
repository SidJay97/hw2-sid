# Delete existing data
Role.destroy_all
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

# Studios
warner_bros = Studio.new
warner_bros["name"] = "Warner Bros."
warner_bros.save

# Movies
batman_begins = Movie.new
batman_begins["title"] = "Batman Begins"
batman_begins["year_released"] = 2005
batman_begins["rated"] = "PG-13"
batman_begins["studio_id"] = warner_bros["id"]
batman_begins.save

dark_knight = Movie.new
dark_knight["title"] = "The Dark Knight"
dark_knight["year_released"] = 2008
dark_knight["rated"] = "PG-13"
dark_knight["studio_id"] = warner_bros["id"]
dark_knight.save

dark_knight_rises = Movie.new
dark_knight_rises["title"] = "The Dark Knight Rises"
dark_knight_rises["year_released"] = 2012
dark_knight_rises["rated"] = "PG-13"
dark_knight_rises["studio_id"] = warner_bros["id"]
dark_knight_rises.save

# Actors
christian_bale = Actor.new
christian_bale["name"] = "Christian Bale"
christian_bale["represented"] = true
christian_bale.save

michael_caine = Actor.new
michael_caine["name"] = "Michael Caine"
michael_caine["represented"] = false
michael_caine.save

liam_neeson = Actor.new
liam_neeson["name"] = "Liam Neeson"
liam_neeson["represented"] = false
liam_neeson.save

katie_holmes = Actor.new
katie_holmes["name"] = "Katie Holmes"
katie_holmes["represented"] = false
katie_holmes.save

gary_oldman = Actor.new
gary_oldman["name"] = "Gary Oldman"
gary_oldman["represented"] = false
gary_oldman.save

heath_ledger = Actor.new
heath_ledger["name"] = "Heath Ledger"
heath_ledger["represented"] = false
heath_ledger.save

aaron_eckhart = Actor.new
aaron_eckhart["name"] = "Aaron Eckhart"
aaron_eckhart["represented"] = false
aaron_eckhart.save

maggie_gyllenhaal = Actor.new
maggie_gyllenhaal["name"] = "Maggie Gyllenhaal"
maggie_gyllenhaal["represented"] = false
maggie_gyllenhaal.save

tom_hardy = Actor.new
tom_hardy["name"] = "Tom Hardy"
tom_hardy["represented"] = false
tom_hardy.save

joseph_gordon_levitt = Actor.new
joseph_gordon_levitt["name"] = "Joseph Gordon-Levitt"
joseph_gordon_levitt["represented"] = false
joseph_gordon_levitt.save

anne_hathaway = Actor.new
anne_hathaway["name"] = "Anne Hathaway"
anne_hathaway["represented"] = false
anne_hathaway.save

# Roles - Batman Begins
role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = michael_caine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = liam_neeson["id"]
role["character_name"] = "Ra's Al Ghul"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = katie_holmes["id"]
role["character_name"] = "Rachel Dawes"
role.save

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = gary_oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

# Roles - The Dark Knight
role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = heath_ledger["id"]
role["character_name"] = "Joker"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = aaron_eckhart["id"]
role["character_name"] = "Harvey Dent"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = michael_caine["id"]
role["character_name"] = "Alfred"
role.save

role = Role.new
role["movie_id"] = dark_knight["id"]
role["actor_id"] = maggie_gyllenhaal["id"]
role["character_name"] = "Rachel Dawes"
role.save

# Roles - The Dark Knight Rises
role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = gary_oldman["id"]
role["character_name"] = "Commissioner Gordon"
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = tom_hardy["id"]
role["character_name"] = "Bane"
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = joseph_gordon_levitt["id"]
role["character_name"] = "John Blake"
role.save

role = Role.new
role["movie_id"] = dark_knight_rises["id"]
role["actor_id"] = anne_hathaway["id"]
role["character_name"] = "Selina Kyle"
role.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

movies = Movie.all
for movie in movies
  studio = Studio.find_by({ "id" => movie["studio_id"] })
  puts "#{movie["title"]} #{movie["year_released"]} #{movie["rated"]} #{studio["name"]}"
end

puts ""
puts "Top Cast"
puts "========"
puts ""

for movie in movies
  roles = Role.where({ "movie_id" => movie["id"] })
  for role in roles
    actor = Actor.find_by({ "id" => role["actor_id"] })
    puts "#{movie["title"]} #{actor["name"]} #{role["character_name"]}"
  end
end

puts ""
puts "Represented by agent"
puts "===================="
puts ""

represented = Actor.where({ "represented" => true })
for actor in represented
  puts actor["name"]
end