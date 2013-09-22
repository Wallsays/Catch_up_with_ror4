# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

categories = Category.create([{ name: 'Ruby' },
                              { name: 'JavaScript' }, 
                              { name: 'Blog' }])
Product.create(title: 'First', 
               body: "some info bla-bal-bal",
               category_id: 1)
Product.create(title: 'Second', 
               body: "some info bla-bal-bal",
               category_id: 2)
