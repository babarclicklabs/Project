class RegistrationsController < Devise::RegistrationsController
	
	@str1=String.new
	@Str2=String.new

	def new
		@user=User.new

	end

	def show
	end

 def create

		@user=User.new(registration_params)
		@str1=@user.email
		@str2=@user.password
		@user.access_token=generate_token()
		#render json: {'here'=>@user.access_token}
		 if @user.save
		 	sign_in @user ,:bypass=>true
		 	#redirect_to create_registration_path
		 else
		 	render "new"
		 end
				
end


def generate_token()
	@str=String.new
	@str1=@str1.reverse
	@str2=@str2.reverse
	@str=@str1+@str2

	return @str

end


private

	def registration_params
		params.require(:user).permit(:email,:username,:password,:password_conformation)
    end

end



