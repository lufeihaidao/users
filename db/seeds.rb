# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
puts "管理员, admin@admin.com:iamadmin!"
User.create email: 'admin@admin.com', name: '管理员', password: 'iamadmin!',
            password_confirmation: 'iamadmin!', birthday: Date.today, admin: true
puts "测试数据, u#{i}@c.com:12345678"
50.times do |i|
  User.create email: "u#{i}@c.com", password: '12345678',
              password_confirmation: '12345678', birthday: Date.today
end
