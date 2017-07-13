class EditController < ApplicationController

def show
    @categories = Category.all
    @category=Category.new
    @subcategory=Subcategory.new
    @subcategories=Subcategory.all
end

def edit
  @category = C.find params[:id]
end

def create
@category=Category.new(category_params)
if @category.save
  redirect_to :back
end

end

def new
  @subcategory=Subcategory.new(subcategory_params)
  if @subcategory.save
    redirect_to :back
  end
end



private
def category_params
  params.require(:category).permit(:category_name)
end

private
def subcategory_params
  params.require(:subcategory).permit(:subcategory_name, :category_id)
end

end
