class EditingUsersController < ApplicationController


  def show
    @users=User.all
  end

  def single_user
    @u=User.find_by_id(params[:id])
  end

  def update
    # Find object using form parameters
     @u = User.find(params[:id])
     # Update the object
     if @u.update_attributes(users_params)
       # If update succeeds, redirect to the list action
       flash[:alert] = "Updated."
       redirect_to :back
     else
       # If save fails, redisplay the form so user can fix problems
       render('_')
     end
  end
  def single_user_delete
    @u = User.find(params[:id])
    @u.destroy
    redirect_to editing_users_path
  end



  def create
  @user=User.new(user_reg_params)
  if @user.save
    flash[:alert] = "Registered."
    redirect_to :back
  else
    flash[:alert] = "Could not be registered."
    redirect_to :back

  end
  end

  def users_params
    params.require(:user).permit(:firstname, :lastname, :email, :isguest, :ismember, :isadmin)
  end

  def user_reg_params
    params.require(:user).permit(:firstname, :lastname, :email, :isguest, :ismember, :isadmin, :password)
  end


end
