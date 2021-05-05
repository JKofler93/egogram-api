# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Post.destroy_all
Comment.destroy_all
Like.destroy_all
Follow.destroy_all

u1 = User.create(
    username: "NOWAYJOEK",
    bio: "this is my bio",
    email: "joe@email.com",
    password: "123456"
)

u2 = User.create(
    username: "NOWAYJOHNA",
    bio: "this is my bio",
    email: "john@email.com",
    password: "123456"
)

p1 = Post.create(
    user_id: u1.id,
    content: "this is the first post"
)

p2 = Post.create(
    user_id: u2.id,
    content: "This is the second post"
)