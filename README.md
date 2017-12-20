# Not Reddit
A place where you can share links and discuss rad topics with neckbeards.While Not Reddit may be navigated by guests, for the best experience, an account should be created. This provides the ability to create new posts, comment, upvote and downvote, favorite and follow posts receiving email notifications when another user comments, maintain a profile, as well as a few other features. 

The app is deployed on Heroku: https://not-reddit-heroku.herokuapp.com/

### Features
- Guests can browse the site, except for private topics.
- Guests are not allowed to change or delete anything.
- Users can sign up for a free account.
- Users can sign in and out.
- Users can view topics and posts.
- Users can comment on posts.
- Users can create new posts and edit posts they own.
- Users can up/down vote any post.
- Users can favorite any post.
- Users can be emailed with updates about posts they've favorited.
- A user's profile displays their posts and comments.
- Users can add a Gravatar to their profile.
- A special user called admin is available.
- Admins can delete or edit any topic or post.
- The development database is seeded automatically with users, topics and posts.

### Setup and Configuration
**Languages and Frameworks:**
- Ruby 2.4.0
- Rails 5.1.3
- Bootstrap 3

**Databases:**
- SQLite (Test, Development)
- PostgreSQL (Production)

**Development Tools and Gems include**:
- BCrypt for secure passwords
- SendGrid for email confirmation
- Rspec and FactoryGirl for tests

**Environment and Setup**
- Figaro was used to set environmental variables and can be found in `config/application.yml`. For security reasons, this file has been replaced with an example file `config/application.example.yml` on github to demonstrate proper storage of environmental variables.

### To Run Locally
- [Clone the repository](https://help.github.com/articles/cloning-a-repository/)
- Run `bundle install` on command line
- Create and migrate the SQLite database with `rake db:create` and `rake db:migrate`
- Start the server using `rails server`
- Run the app on `localhost:3000`

