# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

5.times do
	User.create(
		:username => Faker::Internet.user_name,
		:email => Faker::Internet.email,
		:password => "helloworld"
	)
end
puts 'created fake users!'

User.all.each do |user|
	5.times do
		user.dreams.create(
			:title => Faker::Lorem.sentence,
			:content => Faker::Lorem.paragraph,
			:user_explanation => Faker::Lorem.sentence
		)
	end
end
puts 'created some dreams for the fake users'