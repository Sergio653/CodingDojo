class JoinsController < ApplicationController
    before_action :require_login
    def create
        if Org.find_by(id: params[:join][:org_id])
            @org = Org.find_by(id: params[:join][:org_id])

            if !(@org.users.include?(User.find(current_user)))
                Join.create(joins_params)
            end
        end
        redirect_to group_path(params[:join][:org_id])
    end
  
    def destroy
        @join = Join.find_by(joins_params)
        if @join
            if current_user.id == @join.user.id
                @join.destroy
                redirect_to group_path(params[:join][:org_id])
            else  
                flash[:errors] = "You cannot destroy this join!"
                redirect_to group_path(params[:join][:org_id])
            end
        end
    end
  
    private
    def joins_params
      params.require(:join).permit( :user_id, :org_id,)
    end
  
  end
  
