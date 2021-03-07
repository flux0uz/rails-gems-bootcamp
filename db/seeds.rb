puts "Creating User"
User.create!(email: "admin@admin.com", password: "admin!", password_confirmation: "admin!")
puts "User created"

puts "Creating Fake Courses"
30.times do
  Course.create!([{
    title: Faker::Educator.course_name,
    description: Faker::TvShows::GameOfThrones.quote,
    user: User.first
  }])
end
puts "Course created"