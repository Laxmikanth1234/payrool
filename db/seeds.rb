# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'date'

Role.create(:name => "Admin", :band => 6, :level => 5, :min_salary => 50000,
:max_salary => 90000, :paid_leaves => 30)

Role.create(:name => "Manager", :band => 4, :level => 2, :min_salary => 20000,
:max_salary => 60000, :paid_leaves => 25)

Role.create(:name => "Associate", :band => 2, :level => 2, :min_salary => 20000,
:max_salary => 40000, :paid_leaves => 25)

User.create(:first_name => "Admin", :email => "admin@viveda.com", :password => "test1234",
:password_confirmation => "test1234", :role_id => 1, :manager_id => 1, :date_of_joining => Date.today,
:leave_used => 20, :salary => 80000)
User.create(:first_name => "Manager", :email => "manager@viveda.com", :password => "test1234",
:password_confirmation => "test1234", :role_id => 1, :manager_id => 1, :date_of_joining => Date.today,
:leave_used => 20, :salary => 80000)