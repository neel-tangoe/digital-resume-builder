class ResumesController < ApplicationController

  def index
    @resumes = Resume.where(:user_id => current_user.id )
  end

  def show
    @resume = Resume.find(params[:id])
  end

  def new
    @resume = Resume.new
    respond_to do |format|
      format.html { render :template => "resumes/_form" }
    end
  end

  def edit
    @resume = Resume.find(params[:id])
  end

  def create
    @resume = Resume.new(resume_params)

    if @resume.save
      redirect_to resume_path(@resume)
    else
      render 'new'
      end
  end

  def update
    @resume = Resume.find(params[:id])

    if @resume.update(resume_params)
      redirect_to resume_path(@resume)
    else
      render 'edit'
    end
  end

  def destroy
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to resumes_path
  end

  private
  def resume_params
    params.require(:resume).permit(:name, :general_info, :phone_number, :interests, :user_id, :address, :country, :birthdate, :website,
                                   skills_attributes: [:id, :section, :title, :percent, :_destroy],
                                   languages_attributes: [:id, :name, :_destroy],
                                   projects_attributes:[:id, :date_from, :date_to, :client, :description, :technologies, :role, :level, :team_size, :_destroy],
                                   educations_attributes:[:id, :date_from, :date_to, :level, :description, :place, :_destroy])
  end
end
