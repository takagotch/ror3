class UserController < ApplicationController
def edit
	@user = User.find(params[:id])
end

def upsdate
	@user = User.find(params[:id])
	if @user.update_attributes(params[:user])
	end
end

end

