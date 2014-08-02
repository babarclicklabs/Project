class FacebookController < ApplicationController
  def new
    @user=User.new
  end
  
  def create
    
    @user1=User.new(fb_params)
    @user2=User.find_by_email(@user1.email)
    if @user2.present? then
        #if @user2.fb_token.blank? and @user2.fb_id.blank?
          #render json: {'here'=> "ssdsdsdsds"}
         # @user2.fb_id=@user1.fb_id
         # @user2.fb_token=@user1.fb_token
         # @user2.save
          @user2.update_attributes(:fb_id=>@user1.fb_id,:fb_token=>@user1.fb_token)
          sign_in @user2,:by_pass=> true
      # end
    else
      #render json: {'here'=>@user1.fb_id}
      #@user2.fb_id=@user1.fb_id
      #@user2.fb_token=@user1.fb_token
      #@user2.email=@user1.email
      
      if @user1.save then
      else
        #render json: { 'here'=>  @user1.errors}and return
      end
      sign_in @user1, :bypass=> true     
   end
end
  
  
  private

  def fb_params
    params.require(:user).permit(:email,:username,:password,:password_conformation,:fb_id,:fb_token)
    end
end
