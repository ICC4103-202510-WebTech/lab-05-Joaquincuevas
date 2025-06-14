class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:edit, :update]

    def index
        authorize! :read, User
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def edit
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end


    def update
        if @user.update(user_params)
            redirect_to @user, notice: "User was successfully updated."
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: 'User was successfully created.'
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:email, :first_name, :last_name)
    end
end