class MicropostsController < ApplicationController
skip_before_filter :require_login, :only => [:index]

  def index
    @micropost = Micropost.new
    @posts = Micropost.all
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

  def destroy
    @micropost = Micropost.find(params[:id])
    @micropost.destroy
    redirect_to root_url
  end

  private
  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
