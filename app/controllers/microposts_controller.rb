class MicropostsController < ApplicationController
  before_action :authenticate_user!

  def create
      @microposts = current_user.microposts.build(microposts_params)
      if @microposts.save
          flash[:success] = "Micropost created!"
          redirect_to root_url
      else
          render 'static_pages/home'
  end
  end

  def destroy
  end
  
  private
  
  def microposts_params
      params.require(:microposts).permit(:contact)
  end
     
end