class ItemsEditController < ApplicationController
  def show
    @categories = Category.all
    @subcategories=Subcategory.all
  end

  def all_items
    @categories = Category.all
    @subcategories=Subcategory.all
    @items=Item.all.search(params[:search]).paginate(:per_page => 9, :page => params[:page])
  end


  def create
  @item=Item.new(item_params)
  if @item.save
    flash[:alert] = "Saved."
    redirect_to :back
  else
    flash[:alert] = "Could not be saved."
    redirect_to :back

  end
  end

def lang_create
  @categories = Category.all
  @subcategories=Subcategory.all
  @languages=Language.all
end

  def new_lang
  @language=Language.new(lang_params)
  if @language.save
    flash[:alert] = "Saved."
    redirect_to :back
  else
    flash[:alert] = "Not saved."
    redirect_to :back
  end
  end

  def edit_lang
    # Find object using form parameters
     @l = Language.find(params[:id])
     # Update the object
     if @l.update_attributes(lang_params)
       # If update succeeds, redirect to the list action
       flash[:alert] = "Updated."
       redirect_to :back
     else
       # If save fails, redisplay the form so user can fix problems
       render('_alter')
     end
  end

  def language_del
    @l = Language.find(params[:id])
    @l.destroy
    redirect_to :back
  end

  def tag_create
    @categories = Category.all
    @subcategories=Subcategory.all
    @tags=Tag.all
  end

    def new_tag
    @tag=Tag.new(tag_params)
    if @tag.save
      flash[:alert] = "Saved."
      redirect_to :back
    else
      flash[:alert] = "Not saved."
      redirect_to :back
    end
    end

    def edit_tag
      # Find object using form parameters
       @t = Tag.find(params[:id])
       # Update the object
       if @t.update_attributes(tag_params)
         # If update succeeds, redirect to the list action
         flash[:alert] = "Updated."
         redirect_to :back
       else
         # If save fails, redisplay the form so user can fix problems
         render('_alter')
       end
    end

    def tag_del
      @t = Tag.find(params[:id])
      @t.destroy
      redirect_to :back
    end

    def item
      @categories = Category.all
      @subcategories=Subcategory.all
      @item = Item.find(params[:id])
    end


    def update
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


        def item_delete
          @item = Item.find(params[:id])
          @item.destroy
          redirect_to all_items_path
        end

  private
  def item_params
    params.require(:item).permit(:item_name, :author, :edition, :year_published, :publisher, :isbn, :on_stack, :price, :description, :category_id, :subcategory_id, :language_id, :tag_id, :borrow, :buy, :image, :document, :on_stack_buy)
  end

  private
  def lang_params
    params.require(:language).permit(:language_name)
  end

  private
  def tag_params
    params.require(:tag).permit(:tag_name)
  end

end
