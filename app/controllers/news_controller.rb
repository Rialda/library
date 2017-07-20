class NewsController < ApplicationController
def show
  @categories=Category.all
  @subcategories=Subcategory.all
  @news= News.all
end

def write_news

end

def create
@news=News.new(news_params)
if @news.save
  flash[:alert] = "Saved."
  redirect_to :back
else
  flash[:alert] = "Could not be saved."
  redirect_to :back

end
end

def single_news_edit
  @n = News.find(params[:id])

end

def update
  # Find object using form parameters
   @n = News.find(params[:id])
   # Update the object
   if @n.update_attributes(news_params)
     # If update succeeds, redirect to the list action
     flash[:alert] = "Updated."
     redirect_to :back
   else
     # If save fails, redisplay the form so user can fix problems
     render('_')
   end
end


    def single_news_delete
      @n = News.find(params[:id])
      @n.destroy
      redirect_to edit_news_path
    end


def news_params
  params.require(:news).permit(:title, :author, :news_body, :cover_image)
end

end
