# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Role.find_or_create_by(:id => 1, :name => 'costumer') #1

Role.find_or_create_by(:id => 2, :name => 'support_agent') #2

Role.find_or_create_by(:id => 3, :name => 'admin') #3


User.create(
  :email => 'theadmin@gmail.com',
  :password => 'tooradmin',
  :password_confirmation => 'tooradmin',
  :admin => true,
  :role_id => 'admin'
) unless User.find_by_email("theadmin@gmail.com")