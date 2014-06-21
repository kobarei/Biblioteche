# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

library =
  Library.new(
    name: 'kobarei',
    subdomain: 'biblio'
  )

library.save

staff =
  Staff.new(
    name: 'Reiji Kobayashi',
    library_id: library.id,
    login_id: 'staff',
    password: 'staff',
    password_confirmation: 'staff'
  )

staff.save
