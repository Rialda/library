class EditController < ApplicationController

def show
    @categories = Category.all
    @category=Category.new
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

private
def category_params
  params.require(:category).permit(:category_name)
end



end
