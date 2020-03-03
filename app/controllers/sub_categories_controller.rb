class SubCategoriesController < ApplicationController
  before_action :set_category, only: [:show, :edit, :update, :destroy]


  def index
    @sub_categories = SubCategory.all
  end

 
  def show
     @category = Category.find(params[:id])
     @categories = @category.subcategories
     render :action => :index
  end

 
  def new
    @sub_category = SubCategory.new
  end

 
  def edit
  end

  def create
     # category = Category.find(params[:sub_category_id])
      #@sub_category = category.sub_category.new(sub_category_params)
    @sub_category = SubCategory.new(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to @Sub_category, notice: 'subcategory was successfully created.' }
        format.json { render :show, status: :created, location: @subcategory }
      else
        format.html { render :new }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to @category, notice: 'Subcategory was successfully updated.' }
        format.json { render :show, status: :ok, location: @subcategory }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to subcategories_url, notice: 'Subcategory was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
   
    def set_sub_category
      @sub_category = Sub_Category.find(params[:id])
    end

  

    def sub_category_params
      params.require(:sub_category).permit(:sub_category_name, :parent_id)
    end 
end
