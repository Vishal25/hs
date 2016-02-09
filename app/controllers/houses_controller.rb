class HousesController < ApplicationController
	
	def search
	end

	def results
		@houses = House.search_results(params[:search])
	end
	
	# Angular JSON - Below for sending JSONs to Angular
	def details
		# Gather all post data
		house = House.find(params[:id])

    # Respond to request with post data in json format
		render json: house
	end

	# def new
	# 	@house = House.new
	# 	@house.beds.build
	# 	@house.photos.build
	# end

	# def create
	# 	@house  = House.new(house_params)
	# 	if @house.save
	# 		flash[:success] = "Successfully created new house..."
	# 		redirect_to @house
	# 	else
	# 		flash[:notice] = "@house.save failed..."
	# 		render 'new'
	# 	end
	# end

	def show
		@house = House.find(params[:id])
		
		all_house_amenities = @house.amenities
		@living_room_amenities = all_house_amenities.where("category = ?", "living room")
		@kitchen_amenities = all_house_amenities.where("category = ?", "kitchen")
		@bedroom_amenities = all_house_amenities.where("category = ?", "bedroom")
		@bathroom_amenities = all_house_amenities.where("category = ?", "bathroom")
		@society_amenities = all_house_amenities.where("category = ?", "society")

		@rooms = @house.rooms
		room_ids = @rooms.pluck(:id)
		@beds = Bed.where("room_id IN (?)", room_ids)
	end

	private

		def house_params
			params.require(:house).permit(:category, :title, :bhk, :max_no_of_beds, 
																		:locality_id, :pincode, :lat, :long, :address, :landmark, 
																		:rent, :security_deposit, :homestayzid,
																		beds_attributes: [:id, :rent, :security_deposit, :room_occupancy],
																		photos_attributes: [:id, :image, :caption])
		end
end
