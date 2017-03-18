class AdminController < ApplicationController
  before_action :require_to_be_admin

  def index
  end

######################

  def user_index
    @users = User.page(params[:page])
  end

  def user_edit
    @user = User.find_by_id(params[:id])

    if @user == nil
      redirect_to admin_users_path
      return
    end
  end

  def user_update
    @user = User.find_by_id(params[:id])

    if @user == nil
      redirect_to admin_users_path
      return
    end

    if @user.update(user_params)
      redirect_to admin_users_path
    else
      render 'user_edit'
    end
  end

  ######################

  def game_index
    @games = Game.page(params[:page])
  end

  def game_new
    @game = Game.new
  end

  def game_create
  end

  def game_edit
    @game = Game.find_by_id(params[:id])

    if @game == nil
      redirect_to admin_games_path
      return
    end
  end

  def game_update
    @game = Game.find_by_id(params[:id])

    if @game == nil
      redirect_to admin_games_path
      return
    end

    if @game.update(game_params)
      redirect_to admin_games_path
    else
      render 'game_edit'
    end
  end

  ######################

  def video_index
    @videos = Video.page(params[:page])
  end

  def video_new
  end

  def video_create
  end

  def video_edit
    @video = Video.find_by_id(params[:id])
    @video_categories = []
    video_categories_list = VideoCategory.all

    video_categories_list.each do |category|
      @video_categories << [category.name, category.id]
    end

    if @video == nil
      redirect_to admin_videos_path
      return
    end
  end

  def video_update
    @video = Video.find_by_id(params[:id])
    @video_categories = []
    video_categories_list = VideoCategory.all

    video_categories_list.each do |category|
      @video_categories << [category.name, category.id]
    end

    if @video == nil
      redirect_to admin_videos_path
      return
    end

    if @video.update(video_params)
      redirect_to admin_videos_path
    else
      render 'video_edit'
    end
  end

private
  def require_to_be_admin
    if (user_signed_in? && current_user.role == User::ADMIN_TYPE)
      return
    else
      redirect_to root_url, alert: "Unauthorize"
    end
  end

  def user_params
    params.require(:user).permit(:username, :email, :description, :favorite_game, :favorite_type, :role)
  end

  def game_params
    params.require(:game).permit(:name, :comment, :link, :state)
  end

  def video_params
    params.require(:video).permit(:name, :link, :video_category_id)
  end
end
