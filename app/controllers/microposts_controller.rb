class MicropostsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user,  only: :desroy

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
    @micropost.desroy
    redirect_to root_url
  end
  
  private
  
  def microposts_params
      params.require(:micropost).permit(:content)
  end
     
     def correct_user
       @micropost = current_user.microposts.find_by(id: params[:id])
       redirect_to root_url if @micropost.nil?
     end
end