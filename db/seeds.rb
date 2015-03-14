# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
#

# These seeds are for development not production
Product::Category.where(name: 'Other').first_or_create do |cate|
  cate.name = 'Other'
end

User.where(email: "xuwupeng2000@gmail.com").first_or_create do |user|
  user.first_name = 'Jack'
  user.last_name = 'Wu'
  user.email = 'xuwupeng2000@gmail.com'
  user.password = 'daigoubao'
end

User.where(email: "xuwupeng2000@gmail.com").first.add_role :admin

30.times do
  FactoryGirl.create(:product)
end
