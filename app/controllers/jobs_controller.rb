class JobsController < ActionController::Base

  def index
    @jobs = Job.all.includes(:company).order(updated_at: :desc)
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end
end
