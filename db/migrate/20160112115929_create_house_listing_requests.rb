class CreateHouseListingRequests < ActiveRecord::Migration
	def change
		create_table :house_listing_requests do |t|
			t.string :name
			t.string :email
			t.string :phone

			t.timestamps null: false
		end
	end
end
