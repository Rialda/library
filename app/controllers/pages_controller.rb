class PagesController < ApplicationController
  def index
    @categories=Category.all
    @subcategories=Subcategory.all
    @news=News.all.paginate(:per_page => 3, :page => params[:page])

  end

  def home
  end

  def profile
  end

  def news
      @n=News.find(params[:id])
  end

  def catalog
    @books=Item.all.search(params[:search]).paginate(:per_page => 12, :page => params[:page])
  end

  def single_item
    @book=Item.find(params[:id])
  end

  def category
    @cat=Category.find(params[:id])
    @items = Item.where("category_id = ?", params[:id]).search(params[:search]).paginate(:per_page => 9, :page => params[:page])
  end

  def subcategory
    @subcat=Subcategory.find(params[:id])
    @items = Item.where("subcategory_id = ?", params[:id]).search(params[:search]).paginate(:per_page => 9, :page => params[:page])

  end

  def create
  @cart=Cart.new(cart_params)
    @cart_line=CartLine.new(cartline_params)
    @cl=CartLine.where(:line_no=>current_user.id)
  if (@cart.save && @cart_line.save)
    flash[:alert] = "Added."
    redirect_to :back
  else
    flash[:alert] = "Could not be added."
    redirect_to :back

  end
  end

  def create2
  @cart=Cart.new(cart_params)
    @cart_line=CartLine.new(cartline_params)
    @cl=CartLine.where(:line_no=>current_user.id)
  if (@cart.save && @cart_line.save)
    redirect_to  cart_show_path(current_user.id)
  else
    flash[:alert] = "Could not be added."
    redirect_to :back

  end
  end

def initcreate

      @cart=Cart.new(cart_params)
      if @cart.save
        redirect_to :back
      else
        redirect_to :back
      end


end

def shelfcreate
@shelf=Shelf.new(shelf_params)
if (@shelf.save)
  flash[:alert] = "Reservation made."
  redirect_to :back
else
  flash[:alert] = "Could not be reserved."
  redirect_to :back

end
end


  def cart_params
    params.require(:cart).permit(:line_no, :total, :shipping, :user_id)
  end
  def cartline_params
    params.require(:cart_line).permit(:line_no, :item_id, :single_price, :cart_id)
  end
  def shelf_params
    params.require(:shelf).permit(:user_id, :item_id, :reserved, :borrowed)
  end


end
