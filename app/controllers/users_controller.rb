class UsersController < ApplicationController
  def index
    @users = User.page(params[:page]).per(10)
  end

  def show
    @user = User.find(params[:id])
    @recipe_list = Recipe.where(:user_id => current_user.id)
  end
end
