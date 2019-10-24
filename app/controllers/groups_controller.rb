class GroupsController < ApplicationController
  before_action :require_login
  def index
    @orgs = Org.all
  end
  
  def create
    @org = Org.create(org_params)
    @like = Join.create(org_id: @org.id , user_id: current_user.id)
    puts @like.errors.full_messages
    if @org.valid?
      redirect_to groups_path
    else  
      flash[:errors] = @org.errors.full_messages
      redirect_to groups_path
    end
  end

  def destroy
    if Org.find_by(id: params[:id])
      @org = Org.find_by(id: params[:id])
      if current_user == @org.user
        @org.destroy
        redirect_to groups_path
      else
        flash[:errors] = "You cannot destroy this person org"
        redirect_to groups_path
      end
    else
      flash[:errors] = "Unable to find Group"
      redirect_to groups_path
    end
  end

  def show
    @org = Org.find_by(id: params[:id])

  end

  private

  def org_params
    params.require(:org).permit(:user_id, :name, :desc)
  end
end
