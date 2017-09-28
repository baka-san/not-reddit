require 'random_data'


# Create Topics
50.times do
  Topic.create!(
    name:        RandomData.random_sentence,
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
50.times do
  Post.create!(
  	topic: topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph,
    user: users.sample
  )
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