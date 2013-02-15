class ProfilesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create, :destroy]

   def new
      @profile = current_user. build_profile(params[:profile])
   end   

   def destroy
   end
 
   def edit
      @profile = current_user.profile
   end

  
   def create  
      @profile = current_user. build_profile(params[:profile])     
      @profile.save 
      render 'static_pages/home'
   end

   def update
     @profile = current_user.profile
      if @profile.update_attributes(params[:profile])
       render 'static_pages/home'
      else
       render 'edit'
      end
   end
   
   def signed_in_user
         unless signed_in?
           store_location
           redirect_to signin_url, notice: "Please sign in."
         end
   end
end