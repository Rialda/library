class ShelfController < ApplicationController


  def show
    @mybooks=Shelf.where(:user_id=>current_user.id)
  end




    def cancelreservation
      @b = Shelf.find(params[:id])

      @b.destroy
      redirect_to shelf_show_path(current_user.id)
    end











end
