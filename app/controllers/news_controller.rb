class NewsController < ApplicationController
def show
  @categories=Category.all
  @subcategories=Subcategory.all

end

end
