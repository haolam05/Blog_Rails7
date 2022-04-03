# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)



=begin
User.create!(name: "Hao Lam", email: 'tuonghao2001@gmail.com', password: '1q2w3e', password_confirmation: '1q2w3e', role: User.roles[:admin])
User.create!(name: "htl", email: 'lamtuonghao2001@gmail.com', password: '1q2w3e', password_confirmation: '1q2w3e')

elapsed = Benchmark.measure do
  100.times do |x|
    puts "Creating user #{x}"
    post = Post.create(title: "Title #{x}", body: "Body #{x} Words go here Idk", user_id: User.first.id)

    2.times do |y|
      puts "Creating comment #{x} for post #{y}"
      Comment.create(body: "Comment #{y}", user_id: User.second.id, post_id: post.id)
    end
  end
end

puts "Created #{Post.count} posts and #{Comment.count} comments in #{elapsed.real} seconds"
=end




# optimize version: hitting database too many times previously due to #create
User.create!(name: "Hao Lam", email: 'tuonghao2001@gmail.com', password: '1q2w3e', password_confirmation: '1q2w3e', role: User.roles[:admin])
User.create!(name: "htl", email: 'lamtuonghao2001@gmail.com', password: '1q2w3e', password_confirmation: '1q2w3e')


comments = []
posts = []

elapsed = Benchmark.measure do
  1000.times do |x|
    puts "Creating user #{x}"
    post = Post.new(title: "Title #{x}", body: "Body #{x} Words go here Idk", user_id: User.first.id)
    posts << post

    10.times do |y|
      puts "Creating comment #{x} for post #{y}"
      comment = Comment.new(body: "Comment #{y}", user_id: User.second.id, post_id: post.id)
      comments << comment
    end
  end
end

Post.import(posts)
Comment.import(comments)

puts "Created #{Post.count} posts and #{Comment.count} comments in #{elapsed.real} seconds"
