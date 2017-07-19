class EditController < ApplicationController

def show
  @categories = Category.all
  @subcategories=Subcategory.all
end

def cat_editing
  @categories = Category.all
  @subcategories=Subcategory.all
  @c = Category.find(params[:id])

end

def create
@category=Category.new(category_params)
if @category.save
  flash[:alert] = "Saved."
  redirect_to :back
end
end

def new
  @subcategory=Subcategory.new(subcategory_params)
  if @subcategory.save
    flash[:alert] = "Saved."
    redirect_to :back
  end
end

def update
  # Find object using form parameters
   @c = Category.find(params[:id])
   # Update the object
   if @c.update_attributes(category_params)
     # If update succeeds, redirect to the list action
     flash[:alert] = "Updated."
     redirect_to :back
   else
     # If save fails, redisplay the form so user can fix problems
     render('_alter')
   end
end

def updates
  # Find object using form parameters
   @s = Subcategory.find(params[:id])
   # Update the object
   if @s.update_attributes(subcategory_params)
     # If update succeeds, redirect to the list action
     flash[:alert] = "Updated."
     redirect_to :back
   else
     # If save fails, redisplay the form so user can fix problems
     render('_alter')
   end
end

def destroy
  @s = Subcategory.find(params[:id])
  @s.destroy

  respond_to do |format|
    format.html { redirect_to subcat_editing_delete_path(@s) }
    format.xml  { head :ok }
  end
end

def category
  @c = Category.find(params[:id])
  @c.destroy
  redirect_to edit_path

end

def subcategory
  @s = Subcategory.find(params[:id])
  @s.destroy
  redirect_to :back
end

private
def category_params
  params.require(:category).permit(:category_name, :fullname)
end
private
def categoryupdate_params
  params.permit(:category).permit(:category_name, :fullname)
end
private
def subcategory_params
  params.require(:subcategory).permit(:subcategory_name, :category_id)
end

end
