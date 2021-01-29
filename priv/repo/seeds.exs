# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     DApp.DApp.Repo.insert!(%DApp.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
DApp.Repo.insert(%DApp.Schema.User{username: "Wasi", password: Argon2.hash_pwd_salt("123")})
DApp.Repo.insert(%DApp.Schema.User{username: "Awais", password: Argon2.hash_pwd_salt("123")})
DApp.Repo.insert(%DApp.Schema.User{username: "Touseef", password: Argon2.hash_pwd_salt("123")})
DApp.Repo.insert(%DApp.Schema.User{username: "Shexi", password: Argon2.hash_pwd_salt("123")})

DApp.Repo.insert(%DApp.Schema.Question{question: "What Would You Drink?", options: %{"a" => "Cold Coffee", "b" => "Hot Coffee"}})
DApp.Repo.insert(%DApp.Schema.Question{question: "What Would You Choose?", options: %{"a" => "Rose", "b" => "Sun Flower", "c" => "Lily", "d" => "Iris"}})
DApp.Repo.insert(%DApp.Schema.Question{question: "What Would You Prefer?", options: %{"a" => "Tattoo", "b" => "No Tattoo"}})
DApp.Repo.insert(%DApp.Schema.Question{question: "What Would You Like To Watch?", options: %{"a" => "Movies", "b" => "TV-Series"}})
DApp.Repo.insert(%DApp.Schema.Question{question: "What Would You Like To Do In Spare Time?", options: %{"a" => "Sports", "b" => "Video Gaming", "c" => "Movies", "d" => "Social Media"}})