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

# u1 = User.create(
#     username: "NOWAYJOEK",
#     bio: "this is my bio",
#     email: "joe@email.com",
#     password: "123456"
# )

# u2 = User.create(
#     username: "NOWAYJOHNA",
#     bio: "this is my bio",
#     email: "john@email.com",
#     password: "123456"
# )

# u3 = User.create(
#     username: "NOWAYJANEK",
#     bio: "this is my bio...",
#     email: "jane@email.com",
#     password: "123456"
# )

# u4 = User.create(
#     username: "NOWAYJACKP",
#     bio: "this is my bio...",
#     email: "jack@email.com",
#     password: "123456"
# )

# p1 = Post.create(
#     user_id: u1.id,
#     content: "this is the first post...."
# )

# p2 = Post.create(
#     user_id: u2.id,
#     content: "This is the second post...."
# )

# p3 = Post.create(
#     user_id: u3.id,
#     content: "this is the thrid post...."
# )

# p4 = Post.create(
#     user_id: u4.id,
#     content: "This is the forth post...."
# )

# c1 = Comment.create(
#     user_id: u1.id,
#     post_id: p4.id,
#     content: "First comment on the 4th post..."
# )

# c2 = Comment.create(
#     user_id: u2.id,
#     post_id: p3.id,
#     content: "Frist comment on the 3rd post..."
# )

# c3 = Comment.create(
#     user_id: u3.id,
#     post_id: p2.id,
#     content: "First comment on the 2nd post...."
# )

# c4 = Comment.create(
#     user_id: u4.id,
#     post_id: p1.id,
#     content: "First comment on the 1st post..."
# )

# l1 = Like.create(
#     user_id: u1.id,
#     post_id: p4.id
# )

# l2 = Like.create(
#     user_id: u2.id,
#     post_id: p3.id
# )

# l3 = Like.create(
#     user_id: u3.id,
#     post_id: p2.id
# )

# l1 = Like.create(
#     user_id: u4.id,
#     post_id: p1.id
# )

# # nowayjoek Follows
# f1 = Follow.create(
#     follower_id: u1.id, 
#     followed_user_id: u2.id 
# )

# f2 = Follow.create(
#     follower_id: u1.id, 
#     followed_user_id: u3.id
# )

# f3 = Follow.create(
#     follower_id: u1.id, 
#     followed_user_id: u4.id
# )

# # NOWAYJOHNA follows
# f4 = Follow.create(
#     follower_id: u2.id, 
#     followed_user_id: u1.id
# )

# f5 = Follow.create(
#     follower_id: u2.id, 
#     followed_user_id: u3.id
# )

# f6 = Follow.create(
#     follower_id: u2.id, 
#     followed_user_id: u4.id
# )

# # NOWAYJANEK follows
# f7 = Follow.create(
#     follower_id: u3.id, 
#     followed_user_id: u1.id
# )

# f8 = Follow.create(
#     follower_id: u3.id, 
#     followed_user_id: u2.id
# )

# f9 = Follow.create(
#     follower_id: u3.id, 
#     followed_user_id: u4.id
# )

# # NOWAYJACKP follows
# f10 = Follow.create(
#     follower_id: u4.id, 
#     followed_user_id: u1.id
# )

# f11 = Follow.create(
#     follower_id: u4.id, 
#     followed_user_id: u2.id
# )

# f12 = Follow.create(
#     follower_id: u4.id, 
#     followed_user_id: u3.id
# )
