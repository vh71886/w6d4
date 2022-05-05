# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ApplicationRecord.connection.reset_pk_sequence!('users')
ApplicationRecord.connection.reset_pk_sequence!('artworks')
ApplicationRecord.connection.reset_pk_sequence!('artwork_shares')

User.destroy_all
user1 = User.create!(username: "Joe")
user2 = User.create!(username: "Bob")
user3 = User.create!(username: "Sara")

Artwork.destroy_all
art1 = Artwork.create!(title: "Candle", image_url: "candle.com", artist_id: user1.id)
art2 = Artwork.create!(title: "Bottle", image_url: "bottle.com", artist_id: user2.id)
art3 = Artwork.create!(title: "Can", image_url: "can.com", artist_id: user3.id)
art4 = Artwork.create!(title: "Glasses", image_url: "glasses.com", artist_id: user3.id)
art5 = Artwork.create!(title: "Water", image_url: "water.com", artist_id: user2.id)
art6 = Artwork.create!(title: "Bread", image_url: "bread.io", artist_id: user2.id)

ArtworkShare.destroy_all
share1 = ArtworkShare.create!(artwork_id: art1.id, viewer_id: user2.id)
share2 = ArtworkShare.create!(artwork_id: art2.id, viewer_id: user1.id)
share3 = ArtworkShare.create!(artwork_id: art3.id, viewer_id: user1.id)
