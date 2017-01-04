# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cell = Cell.create(number: "mczy226", user: u, name: '明辰紫月226弄')
user = cell.users.create(phone: 15921076830, name: "admin", password: "111111",  role: 1)
user = cell.users.create(phone: 15002162311, name: "媳妇", password: "111111",  role: 1)
