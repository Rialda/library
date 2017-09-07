class HandlingBorrowController < ApplicationController

def show
  @shelves=Shelf.all
end

def handle_request
@i=Shelf.find(params[:id])
@shelves=Shelf.all
@shelf=Shelf.find(params[:id])

end

def single_user_borrowedlist
  @u=User.find_by_id(params[:id])
  @she=Shelf.all
end

def disapprove
  @b = Shelf.find(params[:id])
  @b.destroy
  redirect_to handling_borrow_path
end

def returned
  @b = Shelf.find(params[:id])
  @b.destroy
  redirect_to handling_borrow_path
end

def list_of_borrowed
@shelves=Shelf.all
  #code
end

def shelf_approve
  # Find object using form parameters
   @shelf=Shelf.find(params[:id])
   # Update the object
   if @shelf.update_attributes(shelf_params)
     # If update succeeds, redirect to the list action
     flash[:alert] = "Updated."
     redirect_to :back
   else
     # If save fails, redisplay the form so user can fix problems
     render('_')
   end
end

def shelf_params
  params.require(:shelf).permit(:borrowed, :reserved)
end

end
