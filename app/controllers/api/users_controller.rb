module Api
  class UsersController < Api::ApplicationController
    def me
      render json: current_user
    end
  end
end
