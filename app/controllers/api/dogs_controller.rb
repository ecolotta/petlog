module Api
  class DogsController < Api::ApplicationController
    
    def me
      render json: current_user.dog
    end

    def create
      if current_user.dog.present?
        render json: { "message": 'Validation Failed' }, status: :bad_request
      else
        json_string = current_user.create_dog!(dog_params)
        render json: json_string
      end
    end

    private

    def dog_params
      params.require(:dog).permit(:name, :birthday)
    end
  end
end
