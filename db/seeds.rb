# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# an account with all seeded posts created by it
u = User.create(first_name: 'Frank', last_name: 'Liu',
              email: 'frankliu81@gmail.com', password: 'bu',
              password_confirmation: 'bu', activated: true)
# another test account with no posts created by it
u2 = User.create(first_name: 'Franky', last_name: 'Liu',
              email: 'frankliu82@gmail.com', password: 'bu',
              password_confirmation: 'bu', activated: true)
admin_user = User.create(first_name: 'Admin', last_name: 'Admin',
              email: 'admin@admin.com', password: 'admin',
              password_confirmation: 'admin', activated: true, admin: true)

10.times do
  proj = FactoryGirl.create(:project, user: u)

  3.times do
    t = FactoryGirl.create(:task, user: u, project: proj)
  end

  2.times do
    d = FactoryGirl.create(:discussion, user: u, project: proj)

    3.times do
      c = FactoryGirl.create(:comment, user: u, discussion: d)
    end
  end

end
