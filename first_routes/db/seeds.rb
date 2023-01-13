# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.destroy_all
Artwork.destroy_all
ArtworkShare.destroy_all

users = User.create([
    { username: "Jasmine"},
    { username: "Janny"},
    { username: "Chris"},
    { username: "Mike"},
    { username: "Paulo"},
])

artworks = Artwork.create([
    { title: "Mona Lisa", image_url: "monalisa.com", artist_id: User.first.id},
    { title: "Nighthawks", image_url: "nighthawks.com", artist_id: User.second.id},
    { title: "Van Gough", image_url: "vangough.com", artist_id: User.third.id},
    { title: "Starry Night", image_url: "starrynight.com", artist_id: User.fourth.id},
    { title: "Girl With Pearl Earring", image_url: "pearlearring.com", artist_id: User.fifth.id},
])

artwork_shares = ArtworkShare.create([
    { artwork_id: Artwork.first.id, viewer_id: User.fifth.id},
    { artwork_id: Artwork.second.id, viewer_id: User.fourth.id},
    { artwork_id: Artwork.third.id, viewer_id: User.third.id},
    { artwork_id: Artwork.fourth.id, viewer_id: User.second.id},
    { artwork_id: Artwork.fifth.id, viewer_id: User.first.id},
    { artwork_id: Artwork.first.id, viewer_id: User.third.id},
])

comments = Comment.create([
    { author_id: User.first.id, artwork_id: Artwork.fifth.id, body: "Beautiful"},
    { author_id: User.fifth.id, artwork_id: Artwork.fourth.id, body: "Overrated"},
    { author_id: User.third.id, artwork_id: Artwork.third.id, body: "My art is better"},
    { author_id: User.fourth.id, artwork_id: Artwork.second.id, body: "Amazing"},
    { author_id: User.second.id, artwork_id: Artwork.first.id, body: "Lovely"}
])

# user1 = User.create(username: test)
