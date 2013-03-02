namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_projects
    make_relationships
  end
end

def make_users
  admin = User.create!(name:     "Admin",
                       email:    "admin@ejemplo.es",
                       password: "admin1",
                       password_confirmation: "admin1")
  admin.toggle!(:admin)
  99.times do |n|
    name  = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password  = "password"
    User.create!(name:     name,
                 email:    email,
                 password: password,
                 password_confirmation: password)
  end
end

def make_projects
  users = User.all(limit: 6)
  50.times do |n|
    title = "Project-#{n+1}"
    content = Faker::Lorem.sentence(5)
    tags = "#sample #madrid"
    users.each { |user| user.projects.create!(title: title, content: content, tags: tags) }
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