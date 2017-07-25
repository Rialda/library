class HandlingBorrowController < ApplicationController

def show
  @shelves=Shelf.all
end

def handle_request
@i=Shelf.find(params[:id])

end




end
