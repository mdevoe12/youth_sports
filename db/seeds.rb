# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ben = Player.create(id: 202, type: "Player", first_name: "Benedict", last_name: "White", created_at: "2017-09-07 15:45:00", updated_at: "2017-09-07 15:45:00", username: "queenie@example.net", password_digest: "$2a$10$dy43Exucr92dahA.xrd/luWel2W8nJVpwD/l/HI58Ui...", provider: nil, uid: nil, oauth_token: nil, oauth_expires_at: nil, secret: nil)
lebron = FavoritePlayer.create(id: 1, screen_name: "@KingJames", created_at: "2017-09-07 17:26:58", updated_at: "2017-09-07 17:26:58", player_id: 202)
