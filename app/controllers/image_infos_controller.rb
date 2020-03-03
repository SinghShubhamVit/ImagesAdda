class ImageInfosController < ApplicationController

	before_action :set_imageinfo, only: [:show, :edit, :update, :destroy]

	 def index
	 
		@image_infos = ImageInfo.all
	 end


	 def show
		@image_info = ImageInfo.find(params[:id])
	 end

 
	 def new
		@image_info = ImageInfo.new
	 end

	 def edit
		 @image_infos = ImageInfo.find(params[:id])
	 end


	 def create
		@image_info = ImageInfo.new(imageinfo_params)
		@image_info.user_id = current_user.id
		@image_info.sub_category_id = params[:sub_category_id]
		
		respond_to do |format|
			if @image_info.save!
			
				format.html { redirect_to @image_info, notice: 'Image was successfully created.' }
				format.json { render :show, status: :created, location: @image_info }
			else
				format.html { render :new }
				format.json { render json: @image_info.errors, status: :unprocessable_entity }
			end
		end
	end

	def update
		@image_info = ImagesInfo.purge
	 @imageinfo.image.attach(params[:user][:image])

		respond_to do |format|
			if @imageinfo.update(image_params)
				format.html { redirect_to @image_info, notice: 'Image was successfully updated.' }
				format.json { render :show, status: :ok, location: @image_info }
			else
				format.html { render :edit }
				format.json { render json: @image_info.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@imageinfo.destroy
		respond_to do |format|
			format.html { redirect_to image_infos_path(@image_info), notice: 'Image was successfully destroyed.' }
			format.json { head :no_content }
		end
	end

	private
	 
		def set_imageinfo
			@imageinfo = ImageInfo.find(params[:id])

		end

	
		def imageinfo_params

			params.require(:image_info).permit(:img_name, :img_type, :description, :price, :image )
		end
end
