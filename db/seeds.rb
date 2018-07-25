# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

    Category.create(id: 1, max_length: 20, max_width:20, max_height:20, max_weight:2)
    Category.create(id: 2, max_length: 40, max_width:40, max_height:40, max_weight:5)
    Category.create(id: 3, max_length: 80, max_width:80, max_height:80, max_weight:15)