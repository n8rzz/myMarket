User.create!(name:  "Tommy Callahan",
             email: "niner@callahanauto.com",
             password:              "36niner",
             password_confirmation: "36niner",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

99.times do |n|
  name  = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  User.create!(name:  name,
               email: email,
               password:              password,
               password_confirmation: password,
               activated: true,
               activated_at: Time.zone.now)
end

Stock.create!(ticker: "HAL",
              shares: "100",
              entryprice: "53.66",
              entryfee: "9.99",
              exitprice: "",
              exitfee: "")

Stock.create!(ticker: "CAT",
              shares: "10",
              entryprice: "101.07",
              entryfee: "9.99",
              exitprice: "",
              exitfee: "")

Stock.create!(ticker: "AMD",
              shares: "2500",
              entryprice: "4.02",
              entryfee: "9.99",
              exitprice: "3.22",
              exitfee: "9.99")