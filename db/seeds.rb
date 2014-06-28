# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'csv'

CSV.foreach('db/congress.csv', headers:true) do |row|
  Politician.create(first_name: row["first_name"], last_name: row["last_name"], birthday: row["birthday"], gender: row["gender"], state: row["state"], bioguide_id: row["bioguide_id"], opensecrets_id: row["opensecrets_id"], party: row["party"], image: row["image"], title: row["title"], url: row["url"], address: row["address"], phone: row["phone"], contact_form: row['contact_form'], twitter: row["twitter"], facebook: row["facebook"], facebook_id: row["facebook_id"])
end


