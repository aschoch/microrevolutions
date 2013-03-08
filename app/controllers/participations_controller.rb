class ParticipationsController < ApplicationController
  before_filter :signed_in_user

  def create
    @project = Project.find(params[:participation][:project_id])
    current_user.join!(@project)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end

  def destroy
    @project = Participation.find(params[:id]).project
    current_user.unjoin!(@project)
    respond_to do |format|
      format.html { redirect_to @project }
      format.js
    end
  end
end