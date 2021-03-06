class CommentsController < ApplicationController
  before_action :current_user_must_be_comment_user, :only => [:edit, :update, :destroy]

  def current_user_must_be_comment_user
    comment = Comment.find(params[:id])

    unless current_user == comment.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Comment.ransack(params[:q])
    @comments = @q.result(:distinct => true).includes(:user, :recipe).page(params[:page]).per(10)

    render("comments/index.html.erb")
  end

  def show
    @comment = Comment.find(params[:id])

    render("comments/show.html.erb")
  end

  def new
    @comment = Comment.new

    render("comments/new.html.erb")
  end

  def create
    @comment = Comment.new

    @comment.recipe_id = params[:recipe_id]
    @comment.user_id = params[:user_id]
    @comment.comment = params[:comment]

    save_status = @comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comments/new", "/create_comment"
        redirect_to("/comments")
      else
        redirect_back(:fallback_location => "/", :notice => "Comment created successfully.")
      end
    else
      render("comments/new.html.erb")
    end
  end

  def edit
    @comment = Comment.find(params[:id])

    render("comments/edit.html.erb")
  end

  def update
    @comment = Comment.find(params[:id])

    @comment.recipe_id = params[:recipe_id]
    @comment.user_id = params[:user_id]
    @comment.comment = params[:comment]

    save_status = @comment.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/comments/#{@comment.id}/edit", "/update_comment"
        redirect_to("/recipes/#{@comment.recipe.id}", :notice => "Comment updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Comment updated successfully.")
      end
    else
      render("/recipes/#{@comment.recipe.id}")
    end
  end

  def destroy
    @comment = Comment.find(params[:id])

    @comment.destroy

    if URI(request.referer).path == "/comments/#{@comment.id}"
      redirect_to("/", :notice => "Comment deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Comment deleted.")
    end
  end
end
