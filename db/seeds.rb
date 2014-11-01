User.create!(name:  "Tommy Callahan",
             email: "niner@callahanauto.com",
             password:              "36niner",
             password_confirmation: "36niner",
             admin: true)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password)
end