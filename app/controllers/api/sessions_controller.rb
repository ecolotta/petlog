module Api  
  class SessionsController < Api::ApplicationController
    def destroy
      logout
      redirect_back_or_to root_path
    end
  end
end
