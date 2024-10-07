class ProfilesController < InheritedResources::Base

  before_action :authenticate_user!
  before_action :create_profile_if_not_found, only: [:show, :edit, :update]
  before_action :no_access_to_other_user_profile, only: [:show, :edit, :update]
  before_action :no_index, only: :index
  before_action :no_destroy_profile, only: :destroy

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    respond_to do |format|
      if @profile.save
        format.html { redirect_to @profile, notice: 'Profile was successfully created.' }
        format.json { render :show, status: :created, location: @profile }
      else
        format.html { render :new }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def profile_params
      params.require(:profile).permit(:address1, :address2, :city, :state, :pincode, :mobile, :company_name, :user_id)
    end

    def create_profile_if_not_found
      @profile = Profile.find(params[:id])
      unless @profile
        flash[:alert] = "Please create a profile"
        redirect_to new_profile_path
      end
    end

    def no_access_to_other_user_profile
      @profile = Profile.find(params[:id])
      if current_user.profile != @profile
        flash[:alert] = "You don't have access to this!"
        redirect_to root_path
      end
    end

    def no_index
      flash[:alert] = "You don't have access to this!"
      redirect_to root_path
    end

    def no_destroy_profile
      flash[:alert] = "You can NOT delete your profile!"
      redirect_to root_path
    end

end
