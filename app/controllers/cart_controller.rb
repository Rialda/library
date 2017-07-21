class CartController < ApplicationController

def show
@mycart=Cart.where(:line_no=>current_user.id)
@myitems=CartLine.where(:line_no=>current_user.id)

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

  def single_cart_item_delete
    @n = CartLine.find(params[:id])
    @mycart=Cart.where(:line_no=>current_user.id)

    @n.destroy



    redirect_to cart_show_path(current_user.id)
  end



  def cart_params
    params.require(:cart).permit(:line_no, :total, :shipping)
  end

end
