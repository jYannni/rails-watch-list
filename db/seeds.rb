# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Bookmark.destroy_all
List.destroy_all
Movie.destroy_all

10.times do
  movie = Movie.create(
    title: Faker::Movie.title,
    overview: Faker::Lorem.sentence(word_count: 3, supplemental: false, random_words_to_add: rand(2..5)),
    poster_url: Faker::LoremPixel.image(size: "100x150", is_gray: false, category: 'sports', number: rand(1..10)),
    rating: rand(0.0..10.0).round(1)
  )
  p movie
  p movie.valid?
end

10.times do
  list = List.create(
    name: Faker::Lorem.sentence(word_count: rand(3..7), supplemental: true, random_words_to_add: rand(2..5))
  )
  rand(4..7).times do
    bookmark = Bookmark.new( comment: Faker::ChuckNorris.fact )
    bookmark.list = list
    bookmark.movie = Movie.all.sample
    bookmark.save
  end
end

List.all.each do |list|
  pp "List: " + list.to_s
  list.bookmarks.each do |bookmark|
    pp " |-Bookmark: " + bookmark.comment.to_s
    pp " |-Title: " + bookmark.movie.title.to_s
  end
end

# Movie.create(title: "Wonder Woman 1984", overview: "Wonder Woman comes into conflict with the Soviet Union during the Cold War in the 1980s", poster_url: "https://image.tmdb.org/t/p/original/8UlWHLMpgZm9bx6QYh0NFoq67TZ.jpg", rating: 6.9)
# Movie.create(title: "The Shawshank Redemption", overview: "Framed in the 1940s for double murder, upstanding banker Andy Dufresne begins a new life at the Shawshank prison", poster_url: "https://image.tmdb.org/t/p/original/q6y0Go1tsGEsmtFryDOJo3dEmqu.jpg", rating: 8.7)
# Movie.create(title: "Titanic", overview: "101-year-old Rose DeWitt Bukater tells the story of her life aboard the Titanic.", poster_url: "https://image.tmdb.org/t/p/original/9xjZS2rlVxm8SFx8kPC3aIGCOYQ.jpg", rating: 7.9)
# Movie.create(title: "Ocean's Eight", overview: "Debbie Ocean, a criminal mastermind, gathers a crew of female thieves to pull off the heist of the century.", poster_url: "https://image.tmdb.org/t/p/original/MvYpKlpFukTivnlBhizGbkAe3v.jpg", rating: 7.0)
