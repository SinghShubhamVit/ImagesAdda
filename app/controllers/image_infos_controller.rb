class ImageInfosController < ApplicationController

	before_action :set_imageinfo, only: [:show, :edit, :update, :destroy]

	 def index   
		@image_infos = ImageInfo.all

	 end


	 def show
		@image_info = ImageInfo.find(params[:id])
		@sub_category = SubCategory.find(@image_info.sub_category_id)
    @comments = @image_info.comments.all


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

		  if @image_info.save!      
			  redirect_to @image_info, notice: "Image was successfully created."			 
		  else
				render :new 
		  end
	 end

	 def update
		@image_info = ImagesInfo.purge
		@imageinfo.image.attach(params[:user][:image])

		if @imageinfo.update(image_params)
			redirect_to @image_info, notice: "Image was successfully updated." 
		else
			render :edit 
		end
	 end

	 def destroy
	   @imageinfo.destroy
		redirect_to image_infos_path(@image_info), notice: "Image was successfully destroyed."		
	 end

	 private
	 
     def get_subcategories
	   @subcategories = Subcategory.where(category_id: params[:category_id])
	 end

	 def set_imageinfo
	   @imageinfo = ImageInfo.find(params[:id])
	 end

	 def imageinfo_params
	   params.require(:image_info).permit(:img_name, :img_type, :description, :price, :sub_category_id, :image )
	 end
end
