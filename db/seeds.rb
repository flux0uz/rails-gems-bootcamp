Course.destroy_all
User.destroy_all

puts "Creating User"
User.create!(email: "admin@admin.com", password: "admin!", password_confirmation: "admin!")
puts "User created"

puts "Creating Fake Courses"
30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    short_description: Faker::Quote.famous_last_words,
    language: ["English", "French", "Spanish"].sample,
    level: ["Beginner","Intermediate", "Advanced"].sample,
    price: Faker::Number.between(from: 100, to: 300),
    user: User.first
  }])
end
puts "Course created"