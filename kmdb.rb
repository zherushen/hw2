# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!


# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!
studio = Studio.new
studio["name"] = "Warner Bros." 
studio.save
WB = Studio.find_by({"name" => "Warner Bros."})

movies = Movie.new
movies["title"] = "Batman Begins"
movies["year_released"] = 2005
movies["rated"] = "PG-13"
movies["studio_id"] = WB["id"]
movies.save
BB = Movie.find_by({"title" => "Batman Begins"})

movies = Movie.new
movies["title"] = "The Dark Knight"
movies["year_released"] = 2008
movies["rated"] = "PG-13"
movies["studio_id"] = WB["id"]
movies.save
DN = Movie.find_by({"title" => "The Dark Knight"})

movies = Movie.new
movies["title"] = "The Dark Knight Rises"
movies["year_released"] = 2012
movies["rated"] = "PG-13"
movies["studio_id"] = WB["id"]
movies.save
DNR = Movie.find_by({"title" => "The Dark Knight Rises"})

actors = Actor.new
actors["name"] = "Christian Bale" #-- 1
actors.save
Bale = Actor.find_by({"name" => "Christian Bale"})

actors = Actor.new
actors["name"] = "Michael Caine" #-- 2
actors.save
Caine = Actor.find_by({"name" => "Michael Caine"})

actors = Actor.new
actors["name"] = "Liam Neeson" #-- 3
actors.save
Neeson = Actor.find_by({"name" => "Liam Neeson"})

actors = Actor.new
actors["name"] = "Katie Holmes" #-- 4
actors.save
Holmes = Actor.find_by({"name" => "Katie Holmes"})

actors = Actor.new
actors["name"] = "Gary Oldman" #-- 5
actors.save
Oldman = Actor.find_by({"name" => "Gary Oldman"})

roles = Role.new
roles["movie_id"] = BB["id"]
roles["actor_id"] = Bale["id"]
roles["character_name"] = "Bruce Wayne"
roles.save

roles = Role.new
roles["movie_id"] = BB["id"]
roles["actor_id"] = Caine["id"]
roles["character_name"] = "Alfred"
roles.save

roles = Role.new
roles["movie_id"] = BB["id"]
roles["actor_id"] = Neeson["id"]
roles["character_name"] = "Ra's Al Ghul"
roles.save

roles = Role.new
roles["movie_id"] = BB["id"]
roles["actor_id"] = Holmes["id"]
roles["character_name"] = "Rachel Dawes"
roles.save

roles = Role.new
roles["movie_id"] = BB["id"]
roles["actor_id"] = Oldman["id"]
roles["character_name"] = "Commissioner Gordon"
roles.save

actors = Actor.new
actors["name"] = "Heath Ledger" #-- 6
actors.save
Ledger = Actor.find_by({"name" => "Heath Ledger"})

actors = Actor.new
actors["name"] = "Aaron Eckhart" #-- 7
actors.save
Eckhart = Actor.find_by({"name" => "Aaron Eckhart"})

actors = Actor.new
actors["name"] = "Maggie Gyllenhaal" #-- 8
actors.save
Gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})

roles = Role.new
roles["movie_id"] = DN["id"]
roles["actor_id"] = Bale["id"]
roles["character_name"] = "Bruce Wayne"
roles.save

roles = Role.new
roles["movie_id"] = DN["id"]
roles["actor_id"] = Ledger["id"]
roles["character_name"] = "Joker"
roles.save

roles = Role.new
roles["movie_id"] = DN["id"]
roles["actor_id"] = Eckhart["id"]
roles["character_name"] = "Harvey Dent"
roles.save

roles = Role.new
roles["movie_id"] = DN["id"]
roles["actor_id"] = Caine["id"]
roles["character_name"] = "Alfred"
roles.save

roles = Role.new
roles["movie_id"] = DN["id"]
roles["actor_id"] = Gyllenhaal["id"]
roles["character_name"] = "Rachel Dawes"
roles.save

actors = Actor.new
actors["name"] = "Tom Hardy" #-- 9
actors.save
Hardy = Actor.find_by({"name" => "Tom Hardy"})

actors = Actor.new
actors["name"] = "Joseph Gordon-Levitt" #-- 10
actors.save
Levitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})

actors = Actor.new
actors["name"] = "Anne Hathaway" #-- 11
actors.save
Hathaway = Actor.find_by({"name" => "Anne Hathaway"})

roles = Role.new
roles["movie_id"] = DNR["id"]
roles["actor_id"] = Bale["id"]
roles["character_name"] = "Bruce Wayne"
roles.save

roles = Role.new
roles["movie_id"] = DNR["id"]
roles["actor_id"] = Oldman["id"]
roles["character_name"] = "Commissioner Gordon"
roles.save

roles = Role.new
roles["movie_id"] = DNR["id"]
roles["actor_id"] = Hardy["id"]
roles["character_name"] = "Bane"
roles.save

roles = Role.new
roles["movie_id"] = DNR["id"]
roles["actor_id"] = Levitt["id"]
roles["character_name"] = "John Blake"
roles.save

roles = Role.new
roles["movie_id"] = DNR["id"]
roles["actor_id"] = Hathaway["id"]
roles["character_name"] = "Selina Kyle"
roles.save

# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
for movie in Movie.all
    title = movie["title"]
    year = movie["year_released"]
    rated = movie["rated"]
    studio = Studio.find_by({"id" => movie["studio_id"]})
    studio_name = studio["name"]
    puts "#{title} #{year} #{rated} #{studio_name}"
end
# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!
for cast in Role.all
    char_name = cast["character_name"]
    movie = Movie.find_by({"id" => cast["movie_id"]})
    title = movie["title"]
    actor = Actor.find_by({"id" => cast["actor_id"]})
    actor_name = actor["name"]
    puts "#{title} #{actor_name} #{char_name}"
end