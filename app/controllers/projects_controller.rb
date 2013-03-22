class ProjectsController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  before_filter :correct_user,   only: :destroy

  def create
    @project = current_user.projects.build(params[:project])
    if @project.save
      flash[:success] = t("confirm.project_created")
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end

  def index
    @projects = Project.search(params[:search], params[:src])
  end

  def show
    @project = Project.find(params[:id])
  end

  def participants
    @title = t("project.participants")
    @project = Project.find(params[:id])
    @users = @project.participants.paginate(page: params[:page])
    render 'show_participants'
  end

  def destroy
    @project.destroy
    redirect_to root_url
  end

  private

    def correct_user
      @project = current_user.projects.find_by_id(params[:id])
      redirect_to root_url if @project.nil?
    end
end