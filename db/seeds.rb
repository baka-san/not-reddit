require 'random_data'

# Create a unique post
	
unique_post = Post.find_or_create_by!(title: 'This is a unique title', body: 'This is a unique body')

# Create Posts
50.times do
  Post.create!(
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )
end

posts = Post.all

# Create a unique comment
Comment.find_or_create_by!(post: unique_post, body: 'This is a unique body')


# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph
  )
end

puts "Seed finished"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"