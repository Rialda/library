class PagesController < ApplicationController
  def index
    @categories=Category.all
    @subcategories=Subcategory.all
    @news=News.all
  end

  def home
  end

  def profile
  end

  def news
      @n=News.find(params[:id])
  end

  def catalog
    @books=Item.all
  end

  def single_item
    @book=Item.find(params[:id])
  end

end
