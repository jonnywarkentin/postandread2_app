class MicropostsController < ApplicationController
skip_before_filter :require_login, :only => [:index]

  def index
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.microposts.new(micropost_params)

    if @micropost.save
      flash[:notice] = "Post successful."
      redirect_to root_url
    else
      redirect_to microposts_url
    end
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
