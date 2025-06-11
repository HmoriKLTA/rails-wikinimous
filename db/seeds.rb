# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

puts 'Cleaning out the DB...'
Article.destroy_all

puts 'Creating articles....'
10.times do
  # inside of the seeds, you can use Article.create! to stop the seeds if it fails
  Article.create!(
    title: Faker::Sport.unusual_sport,
    content: Faker::Quote.yoda
  )
end

puts "... created #{Article.count} articles."
