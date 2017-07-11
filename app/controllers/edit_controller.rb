class EditController < ApplicationController
def new
  @category = Category.new
  @categories = Category.all
end
def edit
  @category = C.find params[:id]
end

def create
@category=Category.new(category_params)

if @category.save
  redirect_to edit_neww_path
end

end

private
def category_params
  params.require(:category).permit(:category_name)
end



end
