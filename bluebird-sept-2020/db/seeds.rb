# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the 'rails db:seed' command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

  User.destroy_all
  
  # Instructors
  joe = User.create!(username: "trader_joes_4lyf3", age: 99, political_affiliation: "Ruby", email: "thetraderjoe@aa.io")
  walker = User.create!(username: "wakka_wakka", age: 99, political_affiliation: "JavaScript", email: "wakka@wakka.walking")
  mike = User.create!(username: "like_mike", age: 99, political_affiliation: "Ruby", email: "magicmike@aa.io")
  michelle = User.create!(username: "mish_mosh", age: 99, political_affiliation: "JavaScript", email: "headphones@aa.io")
  vanessa = User.create!(username: "aa_celebrity", age: 99, political_affiliation: "Ruby", email: "vans@aa.io")
  jen = User.create!(username: "jen_ken_intensifies", age: 99, political_affiliation: "JavaScript", email: "jen@aa.io")

  elliot = User.create!(username: "all_knowing_elliot", age: 99, political_affiliation: "C", email: "those_are_teef@aa.io")
  dean = User.create!(username: "mean_dean", age: 99, political_affiliation: "Ruby", email: "deans_diary@aa.io")
  alissa = User.create!(username: "brussels_sprout", age: 99, political_affiliation: "JavaScript" , email: "cows@aa.io")
  angela = User.create!(username: "loves_capy", age: 99, political_affiliation: "JavaScript", email: "chosenone@aa.io")
  
  ryan = User.create!(username: "will_climb_rocks", age: 99, political_affiliation: "JavaScript" , email: "boulderz@aa.io")
  charlos = User.create!(username: "charlos_gets_buckets", age: 99, political_affiliation: "Ruby", email: "ballin@aa.io")
  lina = User.create!(username: "bonjour_6am_yoga", age: 99, political_affiliation: "Ruby", email: "bonjour_programmeurs@aa.io")
  julia = User.create!(username: "boba_queen", age:99, political_affiliation: "JavaScript", email: "juliagulia@aa.io" )
  erik = User.create!(username: "stpaterik", age: 99, political_affiliation: "Ruby", email: "bokchoy@aa.io")
  zack = User.create!(username: "sickjams", age: 99, political_affiliation: "JavaScript", email: "zackattack@aa.io")

  big_company = User.create!(username: "corporate_overlord", age: 52, political_affiliation: "Investors", email: "giveus@money.pls")
  
  Chirp.destroy_all

  # Chirps
  chirp1 = Chirp.create!(author_id: walker.id, body: "Please use my messaging app, WalkerTalker, it's way better than Slack.")
  chirp2 = Chirp.create!(author_id: big_company.id, body: "Hello fellow instructors.")
  chirp3 = Chirp.create!(author_id: big_company.id, body: "Have you seen this sweet instructor merch?")
  chirp4 = Chirp.create!(author_id: michelle.id, body: "Sweeeeeet.")
  chirp5 = Chirp.create!(author_id: mike.id, body: "Kahoots are an opportunity to mess with students.")

  chirp6 = Chirp.create!(author_id: vanessa.id, body: "I am not Michelle.")
  chirp7 = Chirp.create!(author_id: jen.id, body: "This is a random quote I found online. -Some person, 2020.")
  chirp8 = Chirp.create!(author_id: mike.id, body: "You know we had free beer on fridays when we were still in person?")
  chirp9 = Chirp.create!(author_id: walker.id, body: "JavaScript is the best coding language.")
  chirp10 = Chirp.create!(author_id: joe.id, body: "Programmer: A machine that turns coffee into code.")

  chirp11 = Chirp.create!(author_id: big_company.id, body: "You're a wizard, instructor.")

  Like.destroy_all

  # Likes

  # Walker
  Like.create!(liker_id: walker.id, chirp_id: chirp4.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp5.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp6.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp7.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp8.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp9.id)
  Like.create!(liker_id: walker.id, chirp_id: chirp10.id)

  # Michelle
  Like.create!(liker_id: michelle.id, chirp_id: chirp6.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp7.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp8.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp9.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp4.id)
  Like.create!(liker_id: michelle.id, chirp_id: chirp10.id)

  # Mike
  Like.create!(liker_id: mike.id, chirp_id: chirp4.id)
  Like.create!(liker_id: mike.id, chirp_id: chirp5.id)
  Like.create!(liker_id: mike.id, chirp_id: chirp6.id)

  # Jen
  Like.create!(liker_id: jen.id, chirp_id: chirp5.id)
  Like.create!(liker_id: jen.id, chirp_id: chirp6.id)
  Like.create!(liker_id: jen.id, chirp_id: chirp10.id)

  # Big Company
  Like.create!(liker_id: big_company.id, chirp_id: chirp1.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp4.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp5.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp6.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp7.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp8.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp9.id)
  Like.create!(liker_id: big_company.id, chirp_id: chirp10.id)

  # Dean
  Like.create!(liker_id: dean.id, chirp_id: chirp10.id)
  Like.create!(liker_id: dean.id, chirp_id: chirp11.id)

  # Comments
#   Comment.create(body: 'Quit advertising your stuff, Walker.', author_id: mike.id, chirp_id: chirp1.id)
#   Comment.create(body: 'This is correct.', author_id: michelle.id, chirp_id: chirp6.id)
#   Comment.create(body: 'Is this big company pretending to be an instructor?', author_id: joe.id, chirp_id: chirp3.id)
#   Comment.create(body: 'Stop with the references.', author_id: vanessa.id, chirp_id: chirp11.id)
#   Comment.create(body: 'Please, just stop.', author_id: jen.id, chirp_id: chirp11.id)
#   Comment.create(body: 'Stooooooooppppppp.', author_id: walker.id, chirp_id: chirp11.id)