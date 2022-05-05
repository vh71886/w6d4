class UsersController < ApplicationController

    def index 
        # render plain: 'Dave and veras first rails request'
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
     
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def update
        # debugger
        user = User.find(params[:id])
        if user.update(user_params)
            # debugger
            render json: user
        else
            # debugger
            render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def destroy 
        user = User.find(params[:id])

        if user.destroy
            # redirect_to users_url
            render json: user
        else
            render json: 'Cant delete user'
        end
    end

    private 
    def user_params
        params.require(:user).permit(:username)
    end
end