# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


City.create!(name: "Mumbai")

Locality.create!(name: "Vikhroli", city_id: 1)
Locality.create!(name: "Kanjur Marg", city_id: 1)
Locality.create!(name: "Powai", city_id: 1)
Locality.create!(name: "Chandivali", city_id: 1)


House.create!(#type, owner,
							title: "Raj Legacy", bhk: 2, no_of_beds: 4, allowed_gender: "any", locality_id: 1, 
							#pincode, lat, long, landmark,
							address: "Raj Legacy Housing Cooperative Society, LBS Road, Vikhroli West - 400079")
House.create!(title: "Raj Splendour", bhk: 2, no_of_beds: 4, allowed_gender: "any", 
							locality_id: 1, address: "Raj splendour, LBS Road, Vikhroli West - 400079")
House.create!(title: "Lodha Aurum", bhk: 2, no_of_beds: 4, allowed_gender: "any", 
							locality_id: 2, address: "Lodha Aurum Grande, Kanjurmarg East - 400042")



4.times { Bed.create!(house_id: 1, #tenant_id,
											rent: 47000/4, security_deposit: 200000/4, room_occupancy: 2) }
4.times { Bed.create!(house_id: 2, rent: 49000/4, security_deposit: 130000/4, room_occupancy: 2) }
4.times { Bed.create!(house_id: 3, rent: 45000/4, security_deposit: 200000/4, room_occupancy: 2) }



Amenity.create!(name: "AC", category: "living room")	# AC in Living Room
House.find(1).house_amenity_relationships.create!(amenity_id: 1)
House.find(3).house_amenity_relationships.create!(amenity_id: 1)

Amenity.create!(name: "AC", category: "bedroom")			# AC in Bedroom

Amenity.create!(name: "Dining Table", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 2)

Amenity.create!(name: "Fridge", category: "kitchen")
House.find(1).house_amenity_relationships.create!(amenity_id: 3)

Amenity.create!(name: "Gas Stove", category: "kitchen")
House.find(1).house_amenity_relationships.create!(amenity_id: 4)

Amenity.create!(name: "Crockery Set", category: "kitchen")
House.find(1).house_amenity_relationships.create!(amenity_id: 5)

Amenity.create!(name: "Sofa", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 6)

Amenity.create!(name: "Television", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 7)

Amenity.create!(name: "Washing Machine", category: "bathroom")
House.find(1).house_amenity_relationships.create!(amenity_id: 8)

Amenity.create!(name: "WiFi", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 9)

Amenity.create!(name: "DTH", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 10)

Amenity.create!(name: "Attached Bathroom", category: "bathroom")
House.find(1).house_amenity_relationships.create!(amenity_id: 11)
House.find(2).house_amenity_relationships.create!(amenity_id: 11)
House.find(3).house_amenity_relationships.create!(amenity_id: 11)

Amenity.create!(name: "Geyser", category: "bathroom")
House.find(1).house_amenity_relationships.create!(amenity_id: 12)
House.find(2).house_amenity_relationships.create!(amenity_id: 12)
House.find(3).house_amenity_relationships.create!(amenity_id: 12)

Amenity.create!(name: "Western Toilet", category: "bathroom")
House.find(1).house_amenity_relationships.create!(amenity_id: 13)
House.find(2).house_amenity_relationships.create!(amenity_id: 13)
House.find(3).house_amenity_relationships.create!(amenity_id: 13)

Amenity.create!(name: "Cupboard", category: "bedroom")
House.find(1).house_amenity_relationships.create!(amenity_id: 14)
House.find(3).house_amenity_relationships.create!(amenity_id: 14)

Amenity.create!(name: "Bed", category: "bedroom")
House.find(1).house_amenity_relationships.create!(amenity_id: 15)

Amenity.create!(name: "Mattresses", category: "bedroom")
House.find(1).house_amenity_relationships.create!(amenity_id: 16)

Amenity.create!(name: "TV Unit", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 17)

Amenity.create!(name: "Centre Table", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 18)

Amenity.create!(name: "Shoe Rack", category: "living room")
House.find(1).house_amenity_relationships.create!(amenity_id: 19)

Amenity.create!(name: "Gas Pipeline", category: "kitchen")
House.find(1).house_amenity_relationships.create!(amenity_id: 20)

Amenity.create!(name: "Swimming Pool", category: "society")
House.find(1).house_amenity_relationships.create!(amenity_id: 21)

Amenity.create!(name: "Gym", category: "society")
House.find(1).house_amenity_relationships.create!(amenity_id: 22)
House.find(3).house_amenity_relationships.create!(amenity_id: 22)

Amenity.create!(name: "Indoor Games", category: "society")
House.find(1).house_amenity_relationships.create!(amenity_id: 23)
House.find(3).house_amenity_relationships.create!(amenity_id: 23)

Amenity.create!(name: "Playing Area", category: "society")
House.find(1).house_amenity_relationships.create!(amenity_id: 24)
House.find(2).house_amenity_relationships.create!(amenity_id: 24)
House.find(3).house_amenity_relationships.create!(amenity_id: 24)

Amenity.create!(name: "Parking", category: "society")
House.find(1).house_amenity_relationships.create!(amenity_id: 25)
House.find(2).house_amenity_relationships.create!(amenity_id: 25)
House.find(3).house_amenity_relationships.create!(amenity_id: 25)

Amenity.create!(name: "Lift", category: "society")
House.find(1).house_amenity_relationships.create!(amenity_id: 26)
House.find(2).house_amenity_relationships.create!(amenity_id: 26)
House.find(3).house_amenity_relationships.create!(amenity_id: 26)

Amenity.create!(name: "Security", category: "society")
House.find(1).house_amenity_relationships.create!(amenity_id: 27)
House.find(2).house_amenity_relationships.create!(amenity_id: 27)
House.find(3).house_amenity_relationships.create!(amenity_id: 27)



# Locality.find_by(name: "Powai").neighborhoods.create!(neighbor_locality: Locality.find_by(name: "Andheri"), distance: 5.8)
# Locality.find_by(name: "Nariman Point").neighborhoods.create!(neighbor_locality: Locality.find_by(name: "Marine Lines"), distance: 2.8)
# Locality.find_by(name: "Dadar").neighborhoods.create!(neighbor_locality: Locality.find_by(name: "Prabhadevi"), distance: 2.3)
# Locality.find_by(name: "Dadar").neighborhoods.create!(neighbor_locality: Locality.find_by(name: "Bandra"), distance: 5)
