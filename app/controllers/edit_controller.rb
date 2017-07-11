class EditController < ApplicationController
def new
  @category = Category.new
  @categories = Category.all
end

def create
@category=Category.new(category_params)

if @category.save
  redirect_to edit_neww_path
end

end


def edit
  @category = Category.find params[:id]
end

private
def category_params
  params.require(:category).permit(:category_name)
end



end
