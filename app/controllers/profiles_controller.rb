class ProfilesController < ApplicationController

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    @user = current_user
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    @user = current_user
    respond_to do |format|
      if @user.update(profile_params)
        format.html { redirect_to profile_path, notice: 'Profile was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:user).permit(:username, :first_name, :last_name, :email, :avatar, :password, :password_confirmation)
    end
end
