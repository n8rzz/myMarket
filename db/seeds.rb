### users
User.create!(name:  "Tommy Callahan",
             email: "niner@callahanauto.com",
             password:              "36niner",
             password_confirmation: "36niner",
             admin: true,
             activated: true,
             activated_at: Time.zone.now)

User.create!(name:  "Harry Douglas",
             email: "myharry@isdouglas.com",
             password:              "pedro69",
             password_confirmation: "pedro69",
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

### stocks and options for Tommy Callahan
Stock.create!(ticker: "HAL",
              shares: "100",
              entryprice: "53.66",
              entryfee: "9.99",
              exitprice: "",
              exitfee: " ",
              entrydate: 2.months.ago,
              exitdate: " ",
              user_id: "1")

Stock.create!(ticker: "CAT",
              shares: "10",
              entryprice: "101.07",
              entryfee: "9.99",
              exitprice: " ",
              exitfee: " ",
              entrydate: 1.month.ago,
              exitdate: " ",
              user_id: "1")

Stock.create!(ticker: "AMD",
              shares: "2500",
              entryprice: "4.02",
              entryfee: "9.99",
              exitprice: "3.22",
              exitfee: "9.99",
              entrydate: 1.year.ago,
              exitdate: " ",
              user_id: "1")

Option.create!(ticker: "BAC",
               side: "Buy",
               optiontype: "Call",
               contracts: "5",
               size: "100",
               expiration: "01/15/2015",
               strike: "16",
               entryprice: "0.25",
               entryfee: "13.74",
               exitprice: " ",
               exitfee: "13.74",
               entrydate: 2.months.ago,
               exitdate: " ",
               user_id: "1")

Option.create!(ticker: "CAT",
               side: "Buy",
               optiontype: "Put",
               contracts: "10",
               size: "100",
               expiration: "01/15/2015",
               strike: "90",
               entryprice: "0.05",
               entryfee: "17.74",
               exitprice: " ",
               exitfee: "17.74",
               entrydate: 2.weeks.ago,
               exitdate: " ",
               user_id: "1")

Option.create!(ticker: "AMD",
               side: "Sell",
               optiontype: "Call",
               contracts: "10",
               size: "100",
               expiration: "12/15/2014",
               strike: "3",
               entryprice: "0.15",
               entryfee: "17.74",
               exitprice: " ",
               exitfee: "17.74",
               entrydate: 2.days.ago,
               exitdate: " ",
               user_id: "1")

Option.create!(ticker: "CAT",
               side: "Buy",
               optiontype: "Put",
               contracts: "2",
               size: "100",
               expiration: "11/18/2015",
               strike: "100",
               entryprice: "0.25",
               entryfee: "13.74",
               exitprice: "0.88",
               exitfee: "13.74",
               entrydate: 3.weeks.ago,
               exitdate: 2.weeks.ago,
               user_id: "1")

Option.create!(ticker: "CAT",
               side: "Buy",
               optiontype: "Call",
               contracts: "5",
               size: "100",
               expiration: "01/15/2015",
               strike: "95",
               entryprice: "1.05",
               entryfee: "13.74",
               exitprice: " ",
               exitfee: "13.74",
               entrydate: 2.days.ago,
               exitdate: " ",
               user_id: "1")

### stocks/options for user_id(2)
Stock.create!(ticker: "HAL",
              shares: "100",
              entryprice: "53.66",
              entryfee: "9.99",
              exitprice: "",
              exitfee: "",
              entrydate: Time.zone.now,
              exitdate: "",
              user_id: "2")

Stock.create!(ticker: "CAT",
              shares: "10",
              entryprice: "101.07",
              entryfee: "9.99",
              exitprice: "",
              exitfee: "",
              entrydate: Time.zone.now,
              exitdate: "",
              user_id: "2")

Option.create!(ticker: "CAT",
               side: "Buy",
               optiontype: "Call",
               contracts: "5",
               size: "100",
               expiration: "01/15/2015",
               strike: "95",
               entryprice: "1.05",
               entryfee: "13.74",
               exitprice: "",
               exitfee: "13.74",
               entrydate: 4.days.ago,
               exitdate: " ",
               user_id: "2")