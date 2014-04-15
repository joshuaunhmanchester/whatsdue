# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# 

# ruby encoding: utf-8

# Delete all Users, Courses, Assignments and Exams.
# Make sure end user accepts this before doing anything.
puts "******** This script will DELETE ALL RECORDS IN DB ************"

puts "******** Seeding Data Start ************"

puts "******** DELETING DATA ********"
User.delete_all
Course.delete_all

# Create admin user.
admin = User.create(:first_name => 'System', :last_name => 'Admin', 
       :email => 'admin@email.com', :password => '4testing', 
       :password_confirmation => '4testing', :school_name => 'UNH Manchester'
       )
       
if admin.errors.blank?
    puts "*** User #{admin.first_name} #{admin.last_name} created ***"
else 
    puts "admin user failed to create due to: "
    admin.errors.each do |x, y|
        # X will be the field name and Y will be the error on it.
        puts "#{x} #{y}"
    end
end      

# Create first class for admin user.
# course = Course.create(:class_name => 'CIS 725 - Wep App Development', 
#          :details => 'Learning various theroies of web development cycles and also Ruby / Ruby on Rails.',
#          :teacher_name => 'Richard Greene', 
#          :user_id => admin.id)
         
# if course.errors.blank?
#     puts "*** Course #{course.class_name} created ***"
# else 
#     puts "course failed to create due to: "
#     course.errors.each do |x, y|
#         # X will be the field name and Y will be the error on it.
#         puts "#{x} #{y}"
#     end
# end


puts "******** Seeding Data End ************"





