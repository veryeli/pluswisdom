namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_authors
    make_articles
    make_users
    make_reviews
    make_relationships
  end
end

def make_articles
  99.times do |n|
    title = Faker::Lorem.sentence(5)
    Article.create!(title: title)
  end
end

def make_authors
  99.times do |n|
    name = Faker::Name.name
    Author.create!(name: name)
  end
end

def make_users
  admin = User.create!(name:     "Example User",
                       email:    "example@pw.org",
                       password: "foobar",
                       password_confirmation: "foobar")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@pw.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_reviews
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.reviews.create!(content: content*50,
      article_title: "Towards a " + content) }
  end
end

def make_relationships
  users = User.all
  user  = users.first
  followed_users = users[2..50]
  followers      = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each      { |follower| follower.follow!(user) }
end
