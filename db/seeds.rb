# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

10.times do
  proj = FactoryGirl.create(:project)

  3.times do
    t = FactoryGirl.create(:task)
    proj.tasks.push(t)
  end

  2.times do
    d = FactoryGirl.create(:discussion)
    proj.discussions.push(d)

    3.times do
      c = FactoryGirl.create(:comment)
      d.comments.push(c)
    end
  end

end
