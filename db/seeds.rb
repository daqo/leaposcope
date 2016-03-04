# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Dir.chdir("db/recordings")
Dir.foreach(".") do |name|
	next if name == '.' or name == '..'
	playback_name = name.split('.').first
	puts "Loading #{name}."
	Playback.create! name: playback_name, data: File.read(name)
end