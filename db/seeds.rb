require 'random_data'

# Funny Topic
bloccit_support = Topic.create!(
  name:        "Technical Support",
  description: "We live to serve. Ask us for help on anything tech related!"
)

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
grant = User.first
grant.update_attributes!(
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

# Create spanish Post
spanish = Post.create!(
  topic: bloccit_support,
  title:  "HELP bloccit turned spanish and i cannot undo it!",
  body:   "5 min ago my bloccit all turned spanish....all the tabs, preferences..etc. I went into preferences and made sure they were checked to english....they were....what is going on? I cant read spanish so I am in need of some help here....i am asking you b/c I cannot find the mod help link b/c I cannot read it.

  UPDATE- ok- it must have something to do with firefox. And to all of you telling me how to change lang. preference, OF COURSE I TRIED THAT before I posted. On IE all is normal. On my desktop all is normal. On my netbook, using firefox, it is a taco show. I ran the page through google translator and I especially enjoy the rick roll. So anyone know how to un-spanish bloccit in firefox? This is the only page it is happening on.

EDIT- I must admit this is hilarious. I wish i had paid more attention in spanish class....

UPDATE- So I wake up this morning to about 1500 replies in my inbox that I cannot read. And then I run them through Google translator and most of them say stuff like 'the dog is in my pants' and 'where is the library'.

Thanks, bloccit.

As far as the Spanish problem goes.. I disabled all my firefox extensions, cleared all my cookies and restarted it all again. THE SPANISH IS GONE! I do not know what possessed my computer to run for the border, but I am glad it is back. :)
",
  user: grant
)

spanish.update_attribute(:created_at, rand(10.minutes .. 10.days).ago)
rand(10..50).times { spanish.votes.create!(value: [-1, 1].sample, user: users.sample) }
rand(30).times { spanish.votes.create!(value: 1, user: users.sample) }

# Create Post bloccit

cloud = Post.create!(
  topic: bloccit_support,
  title:  "how to download things innto clouds",
  body:   "i REALLY wanna download things into clouds. help guys..",
  user: grant
)

cloud.update_attribute(:created_at, rand(10.minutes .. 10.days).ago)
rand(10..50).times { cloud.votes.create!(value: [-1, 1].sample, user: users.sample) }
rand(30).times { cloud.votes.create!(value: 1, user: users.sample) }

# Create Post caps lock
caps_lock = Post.create!(
  topic: bloccit_support,
  title:  "OMG HELP ALL OF MY LETTERS ARE REALLY BIG!!!!",
  body:   "IDK WHATS HAPPENEING BUT ALL OF MY LETTERS GOT BIG ALL OF THE SUDDEN!!! 
  SERIOUSLY WHY IS THIS HAPPENING PLZ FIX IT!!!",
  user: grant
)

caps_lock.update_attribute(:created_at, rand(10.minutes .. 10.days).ago)
rand(10..50).times { caps_lock.votes.create!(value: [-1, 1].sample, user: users.sample) }
rand(30).times { caps_lock.votes.create!(value: 1, user: users.sample) }


# Create Comments
100.times do
  Comment.create!(
    post: posts.sample,
    body: RandomData.random_paragraph,
    user: users.sample
  )
end

# Spanish comments
Comment.create!(
  post: spanish,
  body: "Simplemente vaya a su página de preferencias y busque la opción de idioma apropiado.",
  user: users.sample
)

Comment.create!(
  post: spanish,
  body: "Si senora. Me gusta gato?",
  user: users.sample
)

Comment.create!(
  post: spanish,
  body: "Jajaja hasta los admins trollean en bloccit, toma un voto arriba, ningún tema en bloccit habia tenido tantos votos en español soy tan feliz",
  user: users.sample
)

Comment.create!(
  post: spanish,
  body: "Obtener una buena cantidad de mantequilla de maní en un cuchillo o una cuchara 
  (esta cantidad varía en función de sus preferencias personales) y se distribuyen de manera
   uniforme en uno o dos rebanadas de pan para que el pan no se empapada por la jalea. 
   Limpie cualquier resto de la mantequilla de maní residual de la navaja en la segunda pieza 
   de pan. Scoop un poco de jalea en la otra rebanada de pan. Una vez más, 
   la cantidad depende de usted, pero en caso de duda, utilice menos y no más. 
   Jelly tiende a apretar los bordes y goteo si se utiliza demasiado. 
   Asegúrese de difundir la gelatina uniformemente. Presione suavemente las dos 
   rebanadas de pan juntos. Siempre ponga la mantequilla de maní y jalea lados juntos,
    de lo contrario será un lío (además de no se peguen).
     Considere eliminar la corteza seca con un cortador de galletas de 
     buena forma o un cortador de sandwich especial. Cortar las cortezas de preparar el 
     sándwich más apetecible y más fácil para los niños de tragar. Cortar las cortezas de
      preparar el sándwich más apetecible y más fácil para los niños de tragar. 
      Mantequilla el primer pan (el lado con la mantequilla de maní) realza el sabor.
       Tenga en cuenta que también añade grasa a la comida. Usted puede hacer sandwiches 
       con rapidez haciendo todos a la vez.",
  user: users.sample
)

# Create comment bloccit
Comment.create!(
  post: cloud,
  body: "its pretty easy

1 - put your usb and hard drives into a pan

2 - heat on high for 20-30 mins (longer = faster transfer speed)

3 - take outside and let the data steam rise into the cloud
",
  user: users.sample
)

Comment.create!(
  post: cloud,
  body: "Did you update the driver on your steam.exe??",
  user: users.sample
)

Comment.create!(
  post: cloud,
  body: "Buy a plane ticket to your hosting provider.

When you get into the sky, add the files to your cloud service by URL.

When you land, make sure they've arrived. If they did, fly back. You're done.
",
  user: users.sample
)

# Create comments caps lock
Comment.create!(
  post: caps_lock,
  body: "DONT WORRY BRO MY COMPUTER IS THE SAME SOME COMPUTERS JUST GET LIKE THIS WHEN THEIR OLD",
  user: users.sample
)

Comment.create!(
  post: caps_lock,
  body: "did you try pushing num lock?",
  user: users.sample
)

Comment.create!(
  post: caps_lock,
  body: "did you try turning the power off?",
  user: users.sample
)

Comment.create!(
  post: caps_lock,
  body: "unplug the router, wait 10 seconds, and then plug it back in bro!",
  user: users.sample
)

Comment.create!(
  post: caps_lock,
  body: "Idk man but this kind of stuff has been happening ever since that Obama guy took office...",
  user: users.sample
)

puts "Seed finished"
puts "#{Topic.count} topics created"
puts "#{User.count} users created"
puts "#{Post.count} posts created"
puts "#{Comment.count} comments created"
puts "#{Vote.count} votes created"