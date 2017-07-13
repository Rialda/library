class PagesController < ApplicationController
  def index
    @categories=Category.all
    @subcategories=Subcategory.all
  end

  def home
  end

  def profile
  end

  def news
  end
end
