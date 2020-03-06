class SubCategoriesController < ApplicationController
  before_action :set_subcategory, only: [:show, :edit, :update, :destroy]


  def index
    @sub_categories = SubCategory.all
  end

 
  def show
   @sub_category = SubCategory.find(@image_info.sub_category_id) 
  end

 
  def new
    @sub_category = SubCategory.new
  end

 
  def edit
  end

  def create
  # category = Category.find(params[:sub_category_id])
  #@sub_category = category.sub_category.new(sub_category_params)
    @sub_category = SubCategory.new(subcategory_params)

    if @sub_category.save
      redirect_to sub_categories_path, notice: "Subcategory was successfully created"    
    else
      render :new     
    end
  end

  def update
    if @sub_category.update(sub_category_params)
      redirect_to @sub_category, notice: "Subcategory was successfully updated."       
    else
      render :edit     
    end
 end


  def destroy
    @sub_category.destroy
    redirect_to sub_categories_path(@sub_category), notice: "Subcategory was successfully destroyed."
  end

  private
   
    def set_subcategory
      @sub_category = SubCategory.find(params[:id])
    end  

    def subcategory_params
      
      params.require(:sub_category).permit(:category_id,:sub_category_name)
    end 
end
