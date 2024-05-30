# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

30.times do |_index|
  Article.create(title: Faker::Book.title,
                 description: Faker::Lorem.paragraph(sentence_count: 2))
end

Search.create(query: 'test', user_id: 1, quantity: 10)
Search.create(query: 'test', user_id: 2, quantity: 15)
Search.create(query: 'new test', user_id: 2, quantity: 20)

Article.reindex
