namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_users
    make_projects
    make_relationships
    make_participations
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
  users = User.all(limit: 20)
  5.times do |n|
    title = "Project-#{n+1}"
    city = "Madrid"
    tags = "#sample #hunger #art"
    users.each { |user| content = Faker::Lorem.sentence(5)
                  description = Faker::Lorem.paragraph(5) 
                  user.projects.create!(title: title,
                                              content: content, 
                                              description: description, 
                                              city: city,
                                              tags: tags)

                  }
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

def make_participations
  users = User.all
  projects = Project.all
  user  = users.first
  project = projects.first
  joined_projects = projects[2..50]
  participants      = users[3..40]
  joined_projects.each { |project| user.join!(project) }
  participants.each      { |participant| participant.join!(user) }
end