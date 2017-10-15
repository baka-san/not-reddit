require 'random_data'


# Create Topics
50.times do |i|
  Topic.create!(
    name:        "Topic #{i}",
    description: RandomData.random_paragraph
  )
end
topics = Topic.all

# Create Users
5.times do
  User.create!(
    name:     RandomData.random_name,
    email:    RandomData.random_email,
    password: RandomData.random_sentence
  )
end

# Create Grant/admin
user = User.first
user.update_attributes!(
  name: 'Grant',
  email: 'gsbackes@gmail.com', 
  password: 'password',
  role: 'admin'
)

# Create an admin user
admin = User.create!(
  name:     'Admin User',
  email:    'admin@gmail.com',
  password: 'password',
  role:     'admin'
)

# Create a member
member = User.create!(
  name:     'Member User',
  email:    'member@gmail.com',
  password: 'password'
)

users = User.all

# Create Posts
50.times do |i|
  post = Post.create!(
  	topic: topics.sample,
    title:  "A random post #{i}",
    body:   RandomData.random_paragraph,
    user: users.sample
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end

posts = Post.all

# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph,
    user: users.sample
  )
end

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"