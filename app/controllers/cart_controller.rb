class CartController < ApplicationController

def show
@mycart=Cart.where(:line_no=>current_user.id)
@myitems=CartLine.where(:line_no=>current_user.id)
@mycartupdate=Cart.find(params[:id])

end

  def create
  @cart=Cart.new(cart_params)
  @item=Item.find(params[:id])
  if @cart.save
    flash[:alert] = "Added."
    redirect_to :back
  else
    flash[:alert] = "Could not be added."
    redirect_to :back

  end
  end

  def create2
  @cart=Cart.new(cart_params)
  @item=Item.find(params[:id])
  if @cart.save
    flash[:alert] = "Added."
    redirect_to :back
  else
    flash[:alert] = "Could not be added."
    redirect_to cart_show_path(current_user.id)
  end
  end

  def single_cart_item_delete
    @n = CartLine.find(params[:id])
    @mycart=Cart.where(:line_no=>current_user.id)
    @n.destroy

    @mycart.last.total=@mycart.last.total-@n.single_price
    redirect_to cart_show_path(current_user.id)
  end


def cart_update
  # Find object using form parameters
   @mycartupdate=Cart.find(params[:id])
   # Update the object
   if @mycartupdate.update_attributes(mycart_params)
     # If update succeeds, redirect to the list action
     flash[:alert] = "Updated."
     redirect_to :back
   else
     # If save fails, redisplay the form so user can fix problems
     render('_')
   end
end

def create_address
@address=Address.new(address_params)
if @address.save
  flash[:alert] = "Success."
  redirect_to charges_new_path
else
  flash[:alert] = "Could not be saved."
  redirect_to :back

end
end

    def update_stack
      # Find object using form parameters
       @item = Item.find(params[:id])
       # Update the object
       if @item.update_attributes(item_params)
         # If update succeeds, redirect to the list action
         flash[:alert] = "Updated."
         redirect_to :back
       else
         # If save fails, redisplay the form so user can fix problems
         render('_')
       end
    end

    def item_params
      params.require(:item).permit(:on_stack_buy)
    end


  def cart_params
    params.require(:cart).permit(:line_no, :total, :shipping, :item_price)
  end

  def mycart_params
    params.require(:cart).permit(:total)
  end

  def address_params
    params.require(:address).permit(:fullname, :country, :city, :zip, :phone, :user_id)
  end

end
