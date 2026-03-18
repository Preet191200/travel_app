# db/seeds.rb
require 'faker'

puts "Clearing old data..."
Review.destroy_all
Attraction.destroy_all
City.destroy_all
Country.destroy_all

puts "Creating countries..."
countries = ["Canada", "India", "USA"]
countries.each do |name|
  Country.create!(
    name: name,
    region: "Sample Region",
    population: rand(1_000_000..100_000_000)
  )
end

puts "Creating cities..."
Country.all.each do |country|
  3.times do
    City.create!(
      name: Faker::Address.city,
      country: country
    )
  end
end

puts "Creating attractions..."
City.all.each do |city|
  2.times do
    Attraction.create!(
      name: Faker::Lorem.word.capitalize + " Attraction",
      description: Faker::Lorem.sentence(word_count: 8),
      city: city
    )
  end
end

puts "Creating reviews..."
Attraction.all.each do |attraction|
  2.times do
    review = Review.new(
      rating: rand(1..5),
      comment: Faker::Lorem.sentence,
      attraction: attraction
    )
    unless review.save
      puts "Failed to create review for #{attraction.name}: #{review.errors.full_messages.join(', ')}"
    end
  end
end

puts "Seeding done!"