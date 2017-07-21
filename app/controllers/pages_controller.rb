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

end
